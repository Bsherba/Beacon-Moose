#tag Class
Protected Class SpawnSetOrganizer
	#tag Method, Flags = &h0
		Sub Attach(Point As Beacon.MutableSpawnPoint, Set As Beacon.SpawnPointSet = Nil)
		  If Set <> Nil Then
		    Self.mSets.Value(Point) = Set.MutableVersion
		  Else
		    Self.mSets.Value(Point) = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mSets = New Dictionary
		  Self.mTemplate = New Beacon.MutableSpawnPointSet()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Template As Beacon.SpawnPointSet)
		  Self.mSets = New Dictionary
		  Self.mTemplate = New Beacon.MutableSpawnPointSet(Template)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FoundInPoints() As Beacon.MutableSpawnPoint()
		  Var Arr() As Beacon.MutableSpawnPoint
		  For Each Entry As DictionaryEntry In Self.mSets
		    Arr.AddRow(Entry.Key)
		  Next
		  Return Arr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Label(Extended As Boolean) As String
		  If Not Extended Then
		    Return Self.Template.Label
		  End If
		  
		  If Self.mSubLabel = "" Then
		    Var PointNames() As String
		    Var Points() As Beacon.MutableSpawnPoint = Self.FoundInPoints
		    For Each Point As Beacon.MutableSpawnPoint In Points
		      PointNames.AddRow(Point.Label)
		    Next
		    PointNames.Sort
		    Self.mSubLabel = Language.EnglishOxfordList(PointNames)
		  End If
		  
		  Return Self.Template.Label + EndOfLine + Self.mSubLabel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replicate()
		  Var Bound As Integer = Self.mSets.KeyCount - 1
		  For I As Integer = 0 To Bound
		    Var Point As Beacon.MutableSpawnPoint = Self.mSets.Key(I)
		    Var Set As Beacon.MutableSpawnPointSet = Self.mSets.Value(Point)
		    
		    If Set <> Nil Then
		      Set.CopyFrom(Self.mTemplate)
		    Else
		      Set = New Beacon.MutableSpawnPointSet(Self.mTemplate)
		      Self.mSets.Value(Point) = Set
		    End If
		    
		    Point.AddSet(Set) // Will replace
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Template() As Beacon.MutableSpawnPointSet
		  Return Self.mTemplate
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSets As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubLabel As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTemplate As Beacon.MutableSpawnPointSet
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
