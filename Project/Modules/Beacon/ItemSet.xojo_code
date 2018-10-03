#tag Class
Protected Class ItemSet
Implements Beacon.Countable,Beacon.DocumentItem
	#tag Method, Flags = &h0
		Sub Append(Entry As Beacon.SetEntry)
		  Self.mEntries.Append(Entry)
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mMinNumItems = 1
		  Self.mMaxNumItems = 3
		  Self.mNumItemsPower = 1
		  Self.mSetWeight = 0.5
		  Self.mItemsRandomWithoutReplacement = True
		  Self.mLabel = "Untitled Item Set"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Source As Beacon.ItemSet)
		  Self.Constructor()
		  
		  Redim Self.mEntries(UBound(Source.mEntries))
		  
		  Self.mItemsRandomWithoutReplacement = Source.mItemsRandomWithoutReplacement
		  Self.mMaxNumItems = Source.mMaxNumItems
		  Self.mMinNumItems = Source.mMinNumItems
		  Self.mNumItemsPower = Source.mNumItemsPower
		  Self.mSetWeight = Source.mSetWeight
		  Self.mLabel = Source.mLabel
		  Self.mSourcePresetID = Source.mSourcePresetID
		  
		  For I As Integer = 0 To UBound(Source.mEntries)
		    Self.mEntries(I) = New Beacon.SetEntry(Source.mEntries(I))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConsumeMissingEngrams(Engrams() As Beacon.Engram)
		  For Each Entry As Beacon.SetEntry In Self.mEntries
		    Entry.ConsumeMissingEngrams(Engrams)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return UBound(Self.mEntries) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Export() As Xojo.Core.Dictionary
		  Dim Children() As Xojo.Core.Dictionary
		  For Each Entry As Beacon.SetEntry In Self.mEntries
		    Children.Append(Entry.Export)
		  Next
		  
		  Dim Keys As New Xojo.Core.Dictionary
		  Keys.Value("ItemEntries") = Children
		  Keys.Value("bItemsRandomWithoutReplacement") = Self.ItemsRandomWithoutReplacement
		  Keys.Value("Label") = Self.Label // Write "Label" so older versions of Beacon can read it
		  Keys.Value("MaxNumItems") = Self.MaxNumItems
		  Keys.Value("MinNumItems") = Self.MinNumItems
		  Keys.Value("NumItemsPower") = Self.NumItemsPower
		  Keys.Value("SetWeight") = Self.Weight
		  If Self.SourcePresetID <> "" Then
		    Keys.Value("SourcePresetID") = Self.SourcePresetID
		  End If
		  Return Keys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FromPreset(Preset As Beacon.Preset, ForLootSource As Beacon.LootSource, Mask As UInt64, ConsoleSafe As Boolean) As Beacon.ItemSet
		  Dim Set As New Beacon.ItemSet
		  Set.Label = Preset.Label
		  Set.MinNumItems = Preset.MinItems
		  Set.MaxNumItems = Preset.MaxItems
		  // Weight is intentionally skipped, as that is relative to the source, no reason for a preset to alter that.
		  Set.mSourcePresetID = Preset.PresetID
		  
		  Dim QuantityMultiplier As Double = Preset.QuantityMultiplier(ForLootSource.Kind)
		  Dim QualityModifier As Integer = Preset.QualityModifier(ForLootSource.Kind)
		  Dim Qualities() As Beacon.Quality = Beacon.Qualities.All
		  
		  For Each Entry As Beacon.PresetEntry In Preset
		    If Not Entry.ValidForMask(Mask) Or (ConsoleSafe And Not Entry.ConsoleSafe) Then
		      Continue
		    End If
		    
		    Dim EntryQuantityMultiplier As Double = If(Entry.RespectQuantityMultiplier, QuantityMultiplier, 1)
		    Dim EntryQualityModifier As Integer = If(Entry.RespectQualityModifier, QualityModifier, 0)
		    
		    Dim MinQualityIndex, MaxQualityIndex As Integer
		    For I As Integer = 0 To UBound(Qualities)
		      If Qualities(I) = Entry.MinQuality Then
		        MinQualityIndex = I
		      End If
		      If Qualities(I) = Entry.MaxQuality Then
		        MaxQualityIndex = I
		      End If
		    Next
		    MinQualityIndex = Max(Min(MinQualityIndex + EntryQualityModifier, UBound(Qualities)), 0)
		    MaxQualityIndex = Max(Min(MaxQualityIndex + EntryQualityModifier, UBound(Qualities)), 0)
		    
		    Entry.MinQuantity = Round(Entry.MinQuantity * EntryQuantityMultiplier)
		    Entry.MaxQuantity = Round(Entry.MaxQuantity * EntryQuantityMultiplier)
		    Entry.MinQuality = Qualities(MinQualityIndex)
		    Entry.MaxQuality = Qualities(MaxQualityIndex)
		    
		    Set.Append(New Beacon.SetEntry(Entry))
		  Next
		  
		  Set.mModified = False
		  Return Set
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIterator() As Xojo.Core.Iterator
		  Return New Beacon.ItemSetIterator(Self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hash() As Text
		  Dim Entries() As Text
		  Redim Entries(UBound(Self.mEntries))
		  For I As Integer = 0 To UBound(Entries)
		    Entries(I) = Self.mEntries(I).Hash
		  Next
		  Entries.Sort
		  
		  Dim Locale As Xojo.Core.Locale = Xojo.Core.Locale.Raw
		  Dim Format As Text = "0.000"
		  
		  Dim Parts(5) As Text
		  Parts(0) = Beacon.MD5(Text.Join(Entries, ",")).Lowercase
		  Parts(1) = if(Self.ItemsRandomWithoutReplacement, "1", "0")
		  Parts(2) = Self.MaxNumItems.ToText(Locale, Format)
		  Parts(3) = Self.MinNumItems.ToText(Locale, Format)
		  Parts(4) = Self.NumItemsPower.ToText(Locale, Format)
		  Parts(5) = Self.Weight.ToText(Locale, Format)
		  
		  Return Beacon.MD5(Text.Join(Parts, ",")).Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImportFromBeacon(Dict As Xojo.Core.Dictionary) As Beacon.ItemSet
		  Dim Set As New Beacon.ItemSet
		  If Dict.HasKey("MinNumItems") Then
		    Set.MinNumItems = Dict.Value("MinNumItems")
		  End If
		  If Dict.HasKey("MaxNumItems") Then
		    Set.MaxNumItems = Dict.Value("MaxNumItems")
		  End If
		  If Dict.HasKey("NumItemsPower") Then
		    Set.NumItemsPower = Dict.Value("NumItemsPower")
		  End If
		  If Dict.HasKey("SetWeight") Then
		    Set.Weight = Dict.Value("SetWeight")
		  ElseIf Dict.HasKey("Weight") Then
		    Set.Weight = Dict.Value("Weight")
		  End If
		  If Dict.HasKey("bItemsRandomWithoutReplacement") Then
		    Set.ItemsRandomWithoutReplacement = Dict.Value("bItemsRandomWithoutReplacement")
		  ElseIf Dict.HasKey("ItemsRandomWithoutReplacement") Then
		    Set.ItemsRandomWithoutReplacement = Dict.Value("ItemsRandomWithoutReplacement")
		  End If
		  If Dict.HasKey("Label") Then
		    Set.Label = Dict.Value("Label")
		  ElseIf Dict.HasKey("SetName") Then
		    Set.Label = Dict.Value("SetName")
		  End If
		  
		  Dim Children() As Auto
		  If Dict.HasKey("ItemEntries") Then
		    Children = Dict.Value("ItemEntries")
		  ElseIf Dict.HasKey("Items") Then
		    Children = Dict.Value("Items")
		  End If
		  For Each Child As Xojo.Core.Dictionary In Children
		    Dim Entry As Beacon.SetEntry = Beacon.SetEntry.ImportFromBeacon(Child)
		    If Entry <> Nil Then
		      Set.Append(Entry)
		    End If
		  Next
		  
		  If Dict.HasKey("SourcePresetID") Then
		    Set.mSourcePresetID = Dict.Value("SourcePresetID")
		  End If
		  
		  Set.mModified = False
		  Return Set
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ImportFromConfig(Dict As Xojo.Core.Dictionary, Multipliers As Beacon.Range, DifficultyValue As Double) As Beacon.ItemSet
		  Dim Set As New Beacon.ItemSet
		  If Dict.HasKey("MinNumItems") Then
		    Set.MinNumItems = Dict.Value("MinNumItems")
		  End If
		  If Dict.HasKey("MaxNumItems") Then
		    Set.MaxNumItems = Dict.Value("MaxNumItems")
		  End If
		  If Dict.HasKey("NumItemsPower") Then
		    Set.NumItemsPower = Dict.Value("NumItemsPower")
		  End If
		  If Dict.HasKey("SetWeight") Then
		    Set.Weight = Dict.Value("SetWeight")
		  End If
		  If Dict.HasKey("bItemsRandomWithoutReplacement") Then
		    Set.ItemsRandomWithoutReplacement = Dict.Value("bItemsRandomWithoutReplacement")
		  End If
		  If Dict.HasKey("SetName") Then
		    Set.Label = Dict.Value("SetName")
		  End If
		  
		  Dim Children() As Auto
		  If Dict.HasKey("ItemEntries") Then
		    Children = Dict.Value("ItemEntries")
		  End If
		  For Each Child As Xojo.Core.Dictionary In Children
		    Dim Entry As Beacon.SetEntry = Beacon.SetEntry.ImportFromConfig(Child, Multipliers, DifficultyValue)
		    If Entry <> Nil Then
		      Set.Append(Entry)
		    End If
		  Next
		  
		  If Dict.HasKey("SourcePresetID") Then
		    Set.mSourcePresetID = Dict.Value("SourcePresetID")
		  End If
		  
		  Set.mModified = False
		  Return Set
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Entry As Beacon.SetEntry) As Integer
		  For I As Integer = 0 To UBound(Self.mEntries)
		    If Self.mEntries(I) = Entry Then
		      Return I
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Entry As Beacon.SetEntry)
		  Self.mEntries.Insert(Index, Entry)
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValid() As Boolean
		  For Each Entry As Beacon.SetEntry In Self.mEntries
		    If Not Entry.IsValid Then
		      Return False
		    End If
		  Next
		  Return UBound(Self.mEntries) > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Join(Sets() As Beacon.ItemSet, Separator As Text, Multipliers As Beacon.Range, UseBlueprints As Boolean, Difficulty As BeaconConfigs.Difficulty) As Text
		  Dim SumSetWeights As Double
		  For Each Set As Beacon.ItemSet In Sets
		    SumSetWeights = SumSetWeights + Set.Weight
		  Next
		  
		  Dim Values() As Text
		  For Each Set As Beacon.ItemSet In Sets
		    Values.Append(Set.TextValue(Multipliers, SumSetWeights, UseBlueprints, Difficulty))
		  Next
		  
		  Return Text.Join(Values, Separator)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Modified() As Boolean
		  If Self.mModified Then
		    Return True
		  End If
		  
		  For Each Entry As Beacon.SetEntry In Self.mEntries
		    If Entry.Modified Then
		      Return True
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Modified(Assigns Value As Boolean)
		  Self.mModified = Value
		  
		  If Not Value Then
		    For Each Entry As Beacon.SetEntry In Self.mEntries
		      Entry.Modified = False
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(Other As Beacon.ItemSet) As Integer
		  If Other = Nil Then
		    Return 1
		  End If
		  
		  Dim SelfHash As Text = Self.Hash
		  Dim OtherHash As Text = Other.Hash
		  
		  Return SelfHash.Compare(OtherHash, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(Bound As Integer)
		  Redim Self.mEntries(Bound)
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As Beacon.SetEntry
		  Return Self.mEntries(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Subscript(Index As Integer, Assigns Entry As Beacon.SetEntry)
		  Self.mEntries(Index) = Entry
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReconfigureWithPreset(Preset As Beacon.Preset, ForLootSource As Beacon.LootSource, Document As Beacon.Document)
		  Self.ReconfigureWithPreset(Preset, ForLootSource, Document.MapCompatibility, Document.ConsoleModsOnly)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReconfigureWithPreset(Preset As Beacon.Preset, ForLootSource As Beacon.LootSource, Mask As UInt64, ConsoleSafe As Boolean)
		  Dim Clone As Beacon.ItemSet = Beacon.ItemSet.FromPreset(Preset, ForLootSource, Mask, ConsoleSafe)
		  If Self.SourcePresetID = Preset.PresetID And Self.Hash = Clone.Hash Then
		    Return
		  End If
		  Self.mEntries = Clone.mEntries
		  Self.mSourcePresetID = Clone.mSourcePresetID
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RelativeWeight(Index As Integer) As Double
		  Return Self.mEntries(Index).Weight / Self.TotalWeight()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  Self.mEntries.Remove(Index)
		  Self.mModified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Simulate() As Beacon.SimulatedSelection()
		  Dim Selections() As Beacon.SimulatedSelection
		  If Self.mEntries.Ubound = -1 Then
		    Return Selections
		  End If
		  
		  Dim NumEntries As Integer = Self.Count
		  Dim MinEntries As Integer = Xojo.Math.Max(Xojo.Math.Min(Self.MinNumItems, NumEntries), 1)
		  Dim MaxEntries As Integer = Xojo.Math.Max(Xojo.Math.Min(Self.MaxNumItems, NumEntries), MinEntries)
		  
		  Dim SelectedEntries() As Beacon.SetEntry
		  If NumEntries = MinEntries And MinEntries = MaxEntries Then
		    // All
		    For Each Entry As Beacon.SetEntry In Self.mEntries
		      SelectedEntries.Append(Entry)
		    Next
		  Else
		    Dim WeightLookup As New Xojo.Core.Dictionary
		    Dim Sum, Weights() As Double
		    For Each Entry As Beacon.SetEntry In Self.mEntries
		      If Entry.Weight = 0 Then
		        Continue
		      End If
		      Sum = Sum + Entry.Weight
		      Weights.Append(Sum * 100000)
		      WeightLookup.Value(Sum * 100000) = Entry
		    Next
		    Weights.Sort
		    
		    Dim ChooseEntries As Integer = Xojo.Math.RandomInt(MinEntries, MaxEntries)
		    For I As Integer = 1 To ChooseEntries
		      Do
		        Dim Decision As Double = Xojo.Math.RandomInt(100000, 100000 + (Sum * 100000)) - 100000
		        Dim SelectedEntry As Beacon.SetEntry
		        
		        For X As Integer = 0 To Weights.Ubound
		          If Weights(X) >= Decision Then
		            Dim SelectedWeight As Double = Weights(X)
		            SelectedEntry = WeightLookup.Value(SelectedWeight)
		            Exit For X
		          End If
		        Next
		        
		        If SelectedEntry = Nil Then
		          Continue
		        End If
		        
		        SelectedEntries.Append(SelectedEntry)
		        
		        Exit
		      Loop
		    Next
		  End If
		  
		  For Each Entry As Beacon.SetEntry In SelectedEntries
		    Dim EntrySelections() As Beacon.SimulatedSelection = Entry.Simulate()
		    For Each Selection As Beacon.SimulatedSelection In EntrySelections
		      Selections.Append(Selection)
		    Next
		  Next
		  Return Selections
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SourcePresetID() As Text
		  Return Self.mSourcePresetID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Multipliers As Beacon.Range, SumSetWeights As Double, UseBlueprints As Boolean, Difficulty As BeaconConfigs.Difficulty) As Text
		  Dim SetWeight As Integer = Xojo.Math.Round((Self.mSetWeight / SumSetWeights * 1000))
		  Dim MinItems As UInteger = Xojo.Math.Max(Xojo.Math.Min(Self.mMinNumItems, Self.Count), 0)
		  Dim MaxItems As UInteger = Xojo.Math.Max(Xojo.Math.Min(Self.mMaxNumItems, Self.Count), 0)
		  
		  Dim Values() As Text
		  Values.Append("SetName=""" + Self.Label + """")
		  Values.Append("MinNumItems=" + MinItems.ToText)
		  Values.Append("MaxNumItems=" + MaxItems.ToText)
		  Values.Append("NumItemsPower=" + Self.mNumItemsPower.PrettyText)
		  Values.Append("SetWeight=" + SetWeight.ToText)
		  Values.Append("bItemsRandomWithoutReplacement=" + if(Self.mItemsRandomWithoutReplacement, "true", "false"))
		  Values.Append("ItemEntries=(" + Beacon.SetEntry.Join(Self.mEntries, ",", Multipliers, UseBlueprints, Difficulty) + ")")
		  Return "(" + Text.Join(Values, ",") + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalWeight() As Double
		  Dim Value As Double
		  For Each Entry As Beacon.SetEntry In Self.mEntries
		    Value = Value + Entry.Weight
		  Next
		  Return Value
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mItemsRandomWithoutReplacement
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mItemsRandomWithoutReplacement = Value Then
			    Return
			  End If
			  
			  Self.mItemsRandomWithoutReplacement = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		ItemsRandomWithoutReplacement As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mLabel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mLabel.Compare(Value, Text.CompareCaseSensitive) = 0 Then
			    Return
			  End If
			  
			  Self.mLabel = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		Label As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mMaxNumItems
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Value = Max(Value, 1)
			  If Self.mMaxNumItems = Value Then
			    Return
			  End If
			  
			  Self.mMaxNumItems = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		MaxNumItems As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEntries() As Beacon.SetEntry
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mMinNumItems
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Value = Max(Value, 1)
			  If Self.mMinNumItems = Value Then
			    Return
			  End If
			  
			  Self.mMinNumItems = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		MinNumItems As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mItemsRandomWithoutReplacement As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLabel As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMaxNumItems As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinNumItems As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumItemsPower As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetWeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSourcePresetID As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mNumItemsPower
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Value = Max(Value, 0)
			  If Self.mNumItemsPower = Value Then
			    Return
			  End If
			  
			  Self.mNumItemsPower = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		NumItemsPower As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mSetWeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Value = Min(Max(Value, 0.0001), 1.0)
			  If Self.mSetWeight = Value Then
			    Return
			  End If
			  
			  Self.mSetWeight = Value
			  Self.mModified = True
			End Set
		#tag EndSetter
		Weight As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ItemsRandomWithoutReplacement"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Label"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxNumItems"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinNumItems"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumItemsPower"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Weight"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
