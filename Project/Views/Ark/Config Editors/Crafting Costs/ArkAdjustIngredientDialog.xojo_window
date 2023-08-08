#tag DesktopWindow
Begin BeaconDialog ArkAdjustIngredientDialog
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   1
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   477
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1233248255
   MenuBarVisible  =   True
   MinimumHeight   =   477
   MinimumWidth    =   600
   Resizeable      =   False
   Title           =   "Adjust Crafting Costs"
   Type            =   8
   Visible         =   True
   Width           =   600
   Begin DesktopLabel MessageLabel
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Adjust Crafting Costs"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin UITweaks.ResizedPushButton TargetChooseButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Choose…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "The ingredient to be replaced."
      Top             =   201
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin UITweaks.ResizedLabel TargetLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Target Ingredient:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   "The ingredient to be replaced."
      Top             =   169
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin UITweaks.ResizedLabel ReplacementLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Replacement Ingredient:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   "The new ingredient to replace the target ingredient."
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin UITweaks.ResizedPushButton ReplacementChooseButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Choose…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "The new ingredient to replace the target ingredient."
      Top             =   307
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin UITweaks.ResizedTextField MultiplierField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1.0"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   "This multiplier will adjust the quantity of the replacement ingredient."
      Top             =   339
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   90
   End
   Begin UITweaks.ResizedLabel MultiplierLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cost Multiplier:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   "This multiplier will adjust the quantity of the replacement ingredient."
      Top             =   339
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin DesktopLabel ExplanationLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   105
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This tool will allow you to change ingredient requirements for all recipes on your server. Use ""Target Ingredient"" to choose between changing all ingredients or just a specific ingredient. Use ""Replacement Ingredient"" to change the target ingredient to something else, or leave it as ""No Replacement"" to keep the ingredient the same. Use the ""Cost Multiplier"" option to change the quantities of ingredients. Use the ""Rounding"" option to decide how partial quantities should be handled. And if you want ingredients with no quantity to be removed from recipes, check the ""Remove 0-quantity ingredients"" option."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
   Begin DesktopCheckBox RemoveIngredientsCheck
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Remove 0-quantity ingredients"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "If the multiplier would reduce the replacement ingredient to 0 quantity, it would normally be removed from the recipe. With this option enabled, the quantity will never drop below 1."
      Top             =   405
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   387
   End
   Begin UITweaks.ResizedPushButton ActionButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   437
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin UITweaks.ResizedPushButton CancelButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   408
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   437
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Thread ProcessorThread
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      TabPanelIndex   =   0
      ThreadID        =   0
      ThreadState     =   0
   End
   Begin UITweaks.ResizedPopupMenu RoundingMenu
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   "Round naturally (1.4 becomes 1 and 1.5 becomes 2)\nRound up (1.5 becomes 2)\nRound down (1.5 becomes 1)\nNo rounding"
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   373
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   387
   End
   Begin UITweaks.ResizedLabel RoundingLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Rounding:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   "This multiplier will adjust the quantity of the replacement ingredient."
      Top             =   373
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin UITweaks.ResizedPopupMenu TargetMenu
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   "All ingredients\nSelected ingredients\nTagged ingredients"
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   169
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   220
   End
   Begin UITweaks.ResizedPopupMenu ReplacementMenu
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   "No replacement\nSelected ingredient"
      Italic          =   False
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   220
   End
   Begin DesktopLabel ReplacementIngredientField
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   True
      Left            =   295
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Nothing Selected"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   307
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   285
   End
   Begin DesktopLabel TargetIngredientField
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   True
      Left            =   295
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Nothing Selected"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   201
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   285
   End
   Begin TagPicker TargetTagPicker
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Border          =   15
      Enabled         =   True
      ExcludeTagCaption=   "Do not adjust ingredients that have the ""%%Tag%%"" tag"
      Height          =   30
      Index           =   -2147483648
      Left            =   193
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      NeutralTagCaption=   "Adjusted ingredients may or may not have the ""%%Tag%%"" tag"
      RequireTagCaption=   "Only adjust ingredients that have the ""%%Tag%%"" tag"
      Scope           =   2
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   233
      Transparent     =   True
      Visible         =   True
      Width           =   387
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Self.TargetTagPicker.Tags = Ark.DataSource.Pool.Get(False).GetTags(Self.mProject.ContentPacks, Ark.CategoryEngrams)
		  
		  If Self.mTargets.Count > 0 Then
		    Self.TargetMenu.SelectedRowIndex = Self.TargetModeSelected
		    Self.TargetIngredientField.Text = Language.EnglishOxfordList(Self.mTargets)
		    Self.TargetIngredientField.Italic = False
		  ElseIf Self.mTargetTags.IsEmpty = False Then
		    Self.TargetMenu.SelectedRowIndex = Self.TargetModeTagged
		    Self.TargetTagPicker.Spec = Self.mTargetTags
		  End If
		  
		  If (Self.mReplacement Is Nil) = False Then
		    Self.ReplacementMenu.SelectedRowIndex = Self.ReplaceModeSelected
		    Self.ReplacementIngredientField.Text = Self.mReplacement.Label
		    Self.ReplacementIngredientField.Italic = False
		  End If
		  
		  Self.MultiplierField.Text = Self.mMultiplier.PrettyText(True)
		  Self.RoundingMenu.SelectedRowIndex = Self.mRoundingMode
		  Self.RemoveIngredientsCheck.Value = Self.mRemoveZeroQuantities
		  
		  Self.SetupUI
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Constructor(Project As Ark.Project, TargetIngredients() As Ark.Engram, TargetTags As String, ReplacementIngredient As Ark.Engram, Multiplier As Double, RoundingMode As Integer, RemoveZeroQuantities As Boolean)
		  // Calling the overridden superclass constructor.
		  Self.mMultiplier = Multiplier
		  Self.mProject = Project
		  Self.mRemoveZeroQuantities = RemoveZeroQuantities
		  Self.mReplacement = ReplacementIngredient
		  Self.mRoundingMode = RoundingMode
		  If (TargetIngredients Is Nil) = False Then
		    Self.mTargets.ResizeTo(TargetIngredients.LastIndex)
		    For Idx As Integer = 0 To Self.mTargets.LastIndex
		      Self.mTargets(Idx) = TargetIngredients(Idx)
		    Next
		  End If
		  Self.mTargetTags = TargetTags
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Present(Parent As DesktopWindow, Project As Ark.Project, TargetIngredients() As Ark.Engram = Nil, TargetTags As String = "", ReplacementIngredient As Ark.Engram = Nil, Multiplier As Double = 1.0, RoundingMode As Integer = 0, RemoveZeroQuantities As Boolean = False) As Boolean
		  Var Win As New ArkAdjustIngredientDialog(Project, TargetIngredients, TargetTags, ReplacementIngredient, Multiplier, RoundingMode, RemoveZeroQuantities)
		  Win.ShowModal(Parent)
		  Var Cancelled As Boolean = Win.mCancelled
		  Win.Close
		  Return Not Cancelled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Round(Value As Double, Mode As Integer) As Double
		  Select Case Mode
		  Case Self.RoundDisabled
		    Return Value
		  Case Self.RoundDown
		    Return Floor(Value)
		  Case Self.RoundNatural
		    Return Round(Value)
		  Case Self.RoundUp
		    Return Ceiling(Value)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupUI()
		  Self.ExplanationLabel.Height = Self.ExplanationLabel.IdealHeight
		  
		  Var NextTop As Integer = Self.ExplanationLabel.Bottom + 12
		  Self.TargetLabel.Top = NextTop
		  Self.TargetMenu.Top = NextTop
		  NextTop = TargetMenu.Bottom + 12
		  
		  Var TargetMode As Integer = Self.TargetMenu.SelectedRowIndex
		  Self.TargetIngredientField.Visible = (TargetMode = Self.TargetModeSelected)
		  Self.TargetChooseButton.Visible = (TargetMode = Self.TargetModeSelected)
		  Self.TargetTagPicker.Visible = (TargetMode = Self.TargetModeTagged)
		  Select Case TargetMode
		  Case Self.TargetModeSelected
		    Self.TargetIngredientField.Top = NextTop
		    Self.TargetChooseButton.Top = NextTop
		    NextTop = Self.TargetIngredientField.Bottom + 12
		  Case Self.TargetModeTagged
		    Self.TargetTagPicker.Top = NextTop
		    NextTop = Self.TargetTagPicker.Bottom + 12
		  End Select
		  
		  Self.ReplacementLabel.Top = NextTop
		  Self.ReplacementMenu.Top = NextTop
		  NextTop = Self.ReplacementMenu.Bottom + 12
		  
		  Var ReplaceMode As Integer = Self.ReplacementMenu.SelectedRowIndex
		  Self.ReplacementIngredientField.Visible = (ReplaceMode = Self.ReplaceModeSelected)
		  Self.ReplacementChooseButton.Visible = (ReplaceMode = Self.ReplaceModeSelected)
		  Select Case ReplaceMode
		  Case Self.ReplaceModeSelected
		    Self.ReplacementIngredientField.Top = NextTop
		    Self.ReplacementChooseButton.Top = NextTop
		    NextTop = Self.ReplacementIngredientField.Bottom + 12
		  End Select
		  
		  Self.MultiplierLabel.Top = NextTop
		  Self.MultiplierField.Top = NextTop
		  NextTop = Self.MultiplierField.Bottom + 12
		  
		  Self.RoundingLabel.Top = NextTop
		  Self.RoundingMenu.Top = NextTop
		  NextTop = Self.RoundingMenu.Bottom + 12
		  
		  Self.RemoveIngredientsCheck.Top = NextTop
		  NextTop = Self.RemoveIngredientsCheck.Bottom + 12
		  
		  Self.ActionButton.Top = NextTop
		  Self.CancelButton.Top = NextTop
		  
		  Var TargetHeight As Integer = Self.ActionButton.Bottom + 20
		  If Self.Height < TargetHeight Then
		    Self.MaximumHeight = TargetHeight
		    Self.Height = TargetHeight
		    Self.MinimumHeight = TargetHeight
		  ElseIf Self.Height > TargetHeight Then
		    Self.MinimumHeight = TargetHeight
		    Self.Height = TargetHeight
		    Self.MaximumHeight = TargetHeight
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCancelled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMultiplier As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProgress As ProgressWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProject As Ark.Project
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRemoveZeroQuantities As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReplacement As Ark.Engram
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRoundingMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTargets() As Ark.Engram
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTargetTags As String
	#tag EndProperty


	#tag Constant, Name = ReplaceModeSelected, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ReplaceModeUnchanged, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RoundDisabled, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RoundDown, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RoundNatural, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RoundUp, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TargetModeAll, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TargetModeSelected, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TargetModeTagged, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events TargetChooseButton
	#tag Event
		Sub Pressed()
		  Var Exclude() As Ark.Engram
		  Exclude.ResizeTo(Self.mTargets.LastIndex)
		  For Idx As Integer = 0 To Exclude.LastIndex
		    Exclude(Idx) = Self.mTargets(Idx)
		  Next
		  
		  Var Engrams() As Ark.Engram = ArkBlueprintSelectorDialog.Present(Self, "", Exclude, Self.mProject.ContentPacks, ArkBlueprintSelectorDialog.SelectModes.ExplicitMultipleWithExcluded)
		  If (Engrams Is Nil) = False And Engrams.Count > 0 Then
		    Self.mTargets.ResizeTo(Engrams.LastIndex)
		    For Idx As Integer = 0 To Self.mTargets.LastIndex
		      Self.mTargets(Idx) = Engrams(Idx)
		    Next
		    Self.TargetIngredientField.Text = Language.EnglishOxfordList(Engrams)
		    Self.TargetIngredientField.Tooltip = Self.TargetIngredientField.Text
		    Self.TargetIngredientField.Italic = False
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReplacementChooseButton
	#tag Event
		Sub Pressed()
		  Var Exclude() As Ark.Engram
		  Var Engrams() As Ark.Engram = ArkBlueprintSelectorDialog.Present(Self, "", Exclude, Self.mProject.ContentPacks, ArkBlueprintSelectorDialog.SelectModes.Single)
		  If (Engrams Is Nil) = False And Engrams.Count = 1 Then
		    Self.mReplacement = Engrams(0)
		    Self.ReplacementIngredientField.Text = Self.mReplacement.Label
		    Self.ReplacementIngredientField.Italic = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActionButton
	#tag Event
		Sub Pressed()
		  If Self.TargetMenu.SelectedRowIndex = Self.TargetModeSelected And Self.mTargets.Count = 0 Then
		    Self.ShowAlert("Select a target ingredient.", "You have not chosen an ingredient to change. If you want to change all ingredients, choose the ""All Ingredients"" option next to ""Target Ingredient.""")
		    Return
		  End If
		  
		  If Self.ReplacementMenu.SelectedRowIndex = Self.ReplaceModeSelected And Self.mReplacement Is Nil Then
		    Self.ShowAlert("Select a replacement ingredient.", "You have not chosen a replacement ingredient. Choose ""No Change"" if you do not want to replace ingredients.")
		    Return
		  End If
		  
		  Var Multiplier As Double
		  If IsNumeric(Self.MultiplierField.Text) Then
		    Try
		      Multiplier = Double.FromString(Self.MultiplierField.Text, Locale.Current)
		    Catch Err As RuntimeException
		      Self.ShowAlert("The replacement multiplier does not appear to be a number.", "Check the format of the multiplier and try again.")
		      Return
		    End Try
		  Else
		    Self.ShowAlert("The replacement multiplier does not appear to be a number.", "Check the format of the multiplier and try again.")
		    Return
		  End If
		  
		  If Multiplier < 0 Then
		    Self.ShowAlert("Negative multipliers don't make sense.", "There's no such thing as a negative crafting cost.")
		    Return
		  End If
		  
		  Select Case Self.TargetMenu.SelectedRowIndex
		  Case Self.TargetModeAll
		    Self.mTargets.ResizeTo(-1)
		  Case Self.TargetModeTagged
		    Self.mTargets.ResizeTo(-1)
		    Self.mTargetTags = Self.TargetTagPicker.Spec
		  End Select
		  If Self.ReplacementMenu.SelectedRowIndex = Self.TargetModeAll Then
		    Self.mReplacement = Nil
		  End If
		  Self.mMultiplier = Multiplier
		  Self.mRemoveZeroQuantities = Self.RemoveIngredientsCheck.Value
		  Self.mRoundingMode = Self.RoundingMenu.SelectedRowIndex
		  Self.mCancelled = False
		  
		  Me.Enabled = False
		  Self.CancelButton.Enabled = False
		  
		  Self.mProgress = New ProgressWindow("Processing crafting costs…", "Getting started…")
		  Self.mProgress.Show(Self)
		  Self.ProcessorThread.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Pressed()
		  Self.mCancelled = True
		  Self.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProcessorThread
	#tag Event
		Sub Run()
		  #if DebugBuild
		    #Pragma Warning "This isn't ready yet: needs a tag picker"
		  #else
		    #Pragma Error "This isn't ready yet: needs a tag picker"
		  #endif
		  
		  Var OriginalConfig As Ark.ConfigGroup = Self.mProject.ConfigGroup(Ark.Configs.NameCraftingCosts)
		  Var WorkingConfig As Ark.Configs.CraftingCosts
		  If OriginalConfig Is Nil Then
		    WorkingConfig = New Ark.Configs.CraftingCosts
		  Else
		    WorkingConfig = Ark.Configs.CraftingCosts(Ark.Configs.CloneInstance(OriginalConfig))
		  End If
		  
		  Var Engrams() As Ark.Engram = WorkingConfig.Engrams
		  Var Filter As New Dictionary
		  For Each Engram As Ark.Engram In Engrams
		    Filter.Value(Engram.ObjectID) = True
		  Next
		  
		  Var DataSource As Ark.DataSource = Ark.DataSource.Pool.Get(False)
		  Var ObjectIDs() As String = DataSource.GetEngramUUIDsThatHaveCraftingCosts(Self.mProject.ContentPacks, Ark.Maps.UniversalMask)
		  For Each ObjectID As String In ObjectIDs
		    If Filter.HasKey(ObjectID) Then
		      Continue
		    End If
		    
		    Var Engram As Ark.Engram = DataSource.GetEngramByUUID(ObjectID)
		    If (Engram Is Nil) = False Then
		      Engrams.Add(Engram)
		    End If
		  Next
		  
		  Var TargetIngredients() As Ark.Engram
		  If Self.mTargets.Count > 0 Then
		    TargetIngredients = Self.mTargets
		  ElseIf Self.mTargetTags.IsEmpty = False Then
		    TargetIngredients = DataSource.GetEngrams("", Self.mProject.ContentPacks, Self.mTargetTags)
		  End If
		  Var TargetMap As New Dictionary
		  For Each Ingredient As Ark.Engram In TargetIngredients
		    TargetMap.Value(Ingredient.ObjectId) = Ingredient
		  Next
		  
		  Var NumProcessed As Integer
		  Var TotalEngrams As Integer = Engrams.Count
		  For Each Engram As Ark.Engram In Engrams
		    If Self.mProgress.CancelPressed Then
		      Self.mProgress.Close
		      Self.mProgress = Nil
		      
		      Var UIData As New Dictionary
		      UIData.Value("Finished") = True
		      UIData.Value("ShouldDismiss") = False
		      Me.AddUserInterfaceUpdate(UIData)
		      
		      Return
		    End If
		    
		    Var Temp As Ark.CraftingCost = WorkingConfig.Cost(Engram)
		    Var Cost As Ark.MutableCraftingCost
		    If Temp Is Nil Then
		      Cost = New Ark.MutableCraftingCost(Engram, True)
		    Else
		      Cost = New Ark.MutableCraftingCost(Temp)
		    End If
		    If Cost.Count = 0 Then
		      Continue
		    End If
		    
		    Var ReplacementIngredients As New Dictionary
		    Var Changed As Boolean
		    For IngredientIdx As Integer = Cost.LastIndex DownTo 0
		      Var Ingredient As Ark.CraftingCostIngredient = Cost.Ingredient(IngredientIdx)
		      If TargetMap.KeyCount > 0 And TargetMap.HasKey(Ingredient.Engram.ObjectId) = False Then
		        Continue
		      End If
		      Var IngredientIsChanging As Boolean = (Self.mReplacement Is Nil) = False And Ingredient.Engram.ObjectId <> Self.mReplacement.ObjectId
		      
		      Var Replacement As Ark.Engram = If(Self.mReplacement Is Nil, Ingredient.Engram, Self.mReplacement)
		      If ReplacementIngredients.HasKey(Replacement.ObjectID) Then
		        Cost.Remove(IngredientIdx)
		        Changed = True
		        Continue
		      End If
		      ReplacementIngredients.Value(Replacement.ObjectID) = True
		      
		      Var OriginalQuantity As Double = Ingredient.Quantity
		      Var Quantity As Double = Round(OriginalQuantity * Self.mMultiplier, Self.mRoundingMode)
		      If OriginalQuantity = Quantity And IngredientIsChanging = False Then
		        Continue
		      End If
		      If Quantity = 0 And Self.mRemoveZeroQuantities = True Then
		        Cost.Remove(IngredientIdx)
		      Else
		        Cost.Ingredient(IngredientIdx) = New Ark.CraftingCostIngredient(Replacement, Quantity, Ingredient.RequireExact)
		      End If
		      
		      Changed = True
		    Next
		    
		    If Changed Then
		      Cost.Simplify()
		      WorkingConfig.Add(Cost)
		    End If
		    
		    NumProcessed = NumProcessed + 1
		    Self.mProgress.Progress = NumProcessed / TotalEngrams
		    Self.mProgress.Detail = "Updated " + NumProcessed.ToString(Locale.Current, "#,##0") + " of " + TotalEngrams.ToString(Locale.Current, "#,##0")
		  Next
		  
		  Self.mProject.AddConfigGroup(WorkingConfig)
		  
		  // Finished
		  Var UIData As New Dictionary
		  UIData.Value("Finished") = True
		  UIData.Value("ShouldDismiss") = True
		  Me.AddUserInterfaceUpdate(UIData)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() as Dictionary)
		  For Each UIDict As Dictionary In Data
		    Var Finished As Boolean = UIDict.Lookup("Finished", False).BooleanValue
		    If Finished Then
		      If (Self.mProgress Is Nil) = False Then
		        Self.mProgress.Close
		      End If
		      If UIDict.Lookup("ShouldDismiss", True) Then
		        Self.Hide
		      Else
		        Self.ActionButton.Enabled = True
		        Self.CancelButton.Enabled = True
		      End If
		      Return
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TargetMenu
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused Item
		  
		  Self.SetupUI()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReplacementMenu
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused Item
		  
		  Self.SetupUI()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TargetTagPicker
	#tag Event
		Sub ShouldAdjustHeight(Delta As Integer)
		  Me.Height = Me.Height + Delta
		  Self.SetupUI()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
