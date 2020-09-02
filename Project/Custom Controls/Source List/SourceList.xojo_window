#tag Window
Begin ContainerControl SourceList Implements AnimationKit.Scrollable, AnimationKit.ValueAnimator
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   598
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   410
   Begin ControlCanvas Content
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   598
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      ScrollSpeed     =   20
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   410
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Self.mSelectedRowIndex = -1
		  
		  #if UseVibrancyView
		    Const NSVisualEffectMaterialSidebar = 7
		    
		    Var VibrancyView As New NSVisualEffectViewMBS(0, 0, Self.Content.Width, Self.Content.Height)
		    VibrancyView.BlendingMode = NSVisualEffectViewMBS.NSVisualEffectBlendingModeBehindWindow
		    VibrancyView.Material = NSVisualEffectMaterialSidebar
		    VibrancyView.State = NSVisualEffectViewMBS.NSVisualEffectStateFollowsWindowActiveState
		    VibrancyView.AutoresizesSubviews = True
		    VibrancyView.AutoresizingMask = NSViewMBS.NSViewWidthSizable Or NSViewMBS.NSViewHeightSizable
		    
		    Var CanvasView As NSViewMBS = Self.Content.NSViewMBS
		    Var RootView As NSViewMBS = Self.NSViewMBS
		    CanvasView.RemoveFromSuperviewWithoutNeedingDisplay
		    RootView.AddSubview(VibrancyView)
		    RootView.AddSubview(CanvasView)
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  Self.Resize()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  Self.Resize()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AnimationStep(Identifier As String, Value As Double)
		  // Part of the AnimationKit.ValueAnimator interface.
		  
		  Select Case Identifier
		  Case "Scroll Opacity"
		    Self.mScrollOpacity = Value
		    Self.Content.Invalidate
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(ParamArray Items() As SourceListItem)
		  For Each Item As SourceListItem In Items
		    If (Item Is Nil) = False And Self.IndexOf(Item) = -1 Then
		      Self.mItems.AddRow(Item)
		      Self.Content.Invalidate
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BeginScrollFadeOut()
		  Self.mScrollOpacityKey = ""
		  
		  Self.mScrollFadeAnimation = New AnimationKit.ValueTask(Self, "Scroll Opacity", Self.mScrollOpacity, 0.0)
		  Self.mScrollFadeAnimation.DurationInSeconds = 0.5
		  Self.mScrollFadeAnimation.Curve = AnimationKit.Curve.CreateEaseOut
		  Self.mScrollFadeAnimation.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return Self.mItems.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If Self.mScrollOpacityKey.IsEmpty = False Then
		    CallLater.Cancel(Self.mScrollOpacityKey)
		    Self.mScrollOpacityKey = ""
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexAtPoint(X As Integer, Y As Integer) As Integer
		  Return Self.IndexAtPoint(New Xojo.Point(X, Y))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexAtPoint(Point As Xojo.Point) As Integer
		  For Idx As Integer = 0 To Self.mItemRects.LastRowIndex
		    If (Self.mItemRects(Idx) Is Nil) = False And Self.mItemRects(Idx).Contains(Point) Then
		      Return Idx
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Item As SourceListItem) As Integer
		  For Idx As Integer = 0 To Self.mItems.LastRowIndex
		    If Self.mItems(Idx) = Item Then
		      Return Idx
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Idx As Integer, Item As SourceListItem)
		  If (Item Is Nil) = False And Self.IndexOf(Item) = -1 Then
		    If Idx < Self.mSelectedRowIndex Then
		      Self.mSelectedRowIndex = Self.mSelectedRowIndex + 1
		    End If
		    
		    Self.mItems.AddRowAt(Idx, Item)
		    Self.Content.Invalidate
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Invalidate(Idx As Integer)
		  If Idx < Self.mItemRects.FirstRowIndex Or Idx > Self.mItemRects.LastRowIndex Then
		    Self.Content.Invalidate(False)
		    Return
		  End If
		  
		  Var ItemRect As Rect = Self.mItemRects(Idx)
		  If ItemRect Is Nil Then
		    Self.Content.Invalidate(False)
		    Return
		  End If
		  
		  Self.Content.Invalidate(ItemRect.Left, ItemRect.Top, ItemRect.Width, ItemRect.Height, False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Idx As Integer) As SourceListItem
		  If Idx >= 0 And Idx <= Self.mItems.LastRowIndex Then
		    Return Self.mItems(Idx)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Item(Idx As Integer, Assigns Item As SourceListItem)
		  If Idx >= 0 And Idx <= Self.mItems.LastRowIndex Then
		    Self.mItems(Idx) = Item
		    Self.Invalidate(Idx)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastItemIndex() As Integer
		  Return Self.mItems.LastRowIndex
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function LimitScrollOffset(Offset As Double, ContentHeight As Integer, ViewportHeight As Integer) As Double
		  Return Min(Max(Offset, 0), Max(ContentHeight - ViewportHeight, 0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Idx As Integer)
		  #Pragma Warning "Won't trigger change event"
		  
		  If Idx >= 0 And Idx <= Self.mItems.LastRowIndex Then
		    Self.mItems.RemoveRowAt(Idx)
		    
		    If Idx <= Self.mSelectedRowIndex Then
		      Self.mSelectedRowIndex = Self.mSelectedRowIndex - 1
		    End If
		    
		    Self.Content.Invalidate
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllItems()
		  #Pragma Warning "Won't trigger change event"
		  
		  Self.mItems.ResizeTo(-1)
		  Self.mSelectedRowIndex = -1
		  Self.Content.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Resize()
		  RaiseEvent Resize()
		  
		  // This will cause the offset to recompute and invalidate if necessary
		  Self.ScrollPosition = Self.mScrollOffset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollMaximum() As Double
		  // Part of the AnimationKit.Scrollable interface.
		  
		  Return Self.mContentHeight - Self.Content.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScrollMaximum(Assigns Value As Double)
		  // Part of the AnimationKit.Scrollable interface.
		  
		  #Pragma Unused Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollMinimum() As Double
		  // Part of the AnimationKit.Scrollable interface.
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ScrollMinimum(Assigns Value As Double)
		  // Part of the AnimationKit.Scrollable interface.
		  
		  #Pragma Unused Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollPosition() As Double
		  // Part of the AnimationKit.Scrollable interface.
		  
		  Return Self.LimitScrollOffset(Self.mScrollOffset, Self.mContentHeight, Self.Content.Height)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollPosition(Assigns Value As Double)
		  // Part of the AnimationKit.Scrollable interface.
		  
		  Value = Self.LimitScrollOffset(Value, Self.mContentHeight, Self.Content.Height)
		  If Self.mScrollOffset <> Value Then
		    Self.mScrollOpacity = 1
		    If Self.mScrollOpacityKey.IsEmpty = False THen
		      CallLater.Cancel(Self.mScrollOpacityKey)
		    End If
		    If (Self.mScrollFadeAnimation Is Nil) = False Then
		      Self.mScrollFadeAnimation.Cancel
		      Self.mScrollFadeAnimation = Nil
		    End If
		    Self.mScrollOpacityKey = CallLater.Schedule(1000, WeakAddressOf BeginScrollFadeOut)
		    Self.mScrollOffset = Value
		    Self.Content.Invalidate
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedItem() As SourceListItem
		  If Self.SelectedRowIndex = -1 Then
		    Return Nil
		  End If
		  
		  Return Self.Item(Self.SelectedRowIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedItem(Assigns Item As SourceListItem)
		  Self.SelectedRowIndex = Self.IndexOf(Item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedTag() As Variant
		  If Self.mSelectedRowIndex = -1 Then
		    Return Nil
		  End If
		  
		  Return Self.mItems(Self.mSelectedRowIndex).Tag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedTag(Assigns Tag As Variant)
		  For Idx As Integer = 0 To Self.mItems.LastRowIndex
		    If Self.mItems(Idx).Tag = Tag Then
		      Self.SelectedRowIndex = Idx
		      Return
		    End If
		  Next
		  Self.SelectedRowIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  Var Names() As String
		  Var SelectedItem As SourceListItem = Self.Item(Self.SelectedRowIndex)
		  
		  For Idx As Integer = 0 To Self.mItems.LastRowIndex
		    Names.AddRow(Self.mItems(Idx).Caption)
		  Next
		  
		  If Self.mItemRects.LastRowIndex = Self.mItems.LastRowIndex Then
		    Names.SortWith(Self.mItems, Self.mItemRects)
		  Else
		    Names.SortWith(Self.mItems)
		    Self.mItemRects.ResizeTo(-1)
		  End If
		  
		  If (SelectedItem Is Nil) = False Then
		    Self.mSelectedRowIndex = Self.IndexOf(SelectedItem)
		  End If
		  
		  Self.Content.Invalidate
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldChange(DesiredIndex As Integer) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return Self.mContentHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mContentHeight = Value Then
			    Return
			  End If
			  
			  Self.mContentHeight = Value
			  Self.Content.Invalidate()
			End Set
		#tag EndSetter
		Private ContentHeight As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mContentHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItemRects() As Rect
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItems() As SourceListItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDownIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDownPoint As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseOverIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMousePoint As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollFadeAnimation As AnimationKit.ValueTask
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollOffset As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollOpacity As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollOpacityKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedRowIndex As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mSelectedRowIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mSelectedRowIndex <> Value Then
			    If IsEventImplemented("ShouldChange") Then
			      If Not RaiseEvent ShouldChange(Value) Then
			        Return
			      End If
			    End If
			    
			    If Self.mSelectedRowIndex > -1 Then
			      Self.Invalidate(Self.mSelectedRowIndex)
			    End If
			    Self.mSelectedRowIndex = Value
			    RaiseEvent Change
			    Self.Invalidate(Value)
			  End If
			End Set
		#tag EndSetter
		SelectedRowIndex As Integer
	#tag EndComputedProperty


	#tag Constant, Name = UseVibrancyView, Type = Boolean, Dynamic = False, Default = \"False", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events Content
	#tag Event
		Sub Activate()
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Deactivate()
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Var MousePoint As New Xojo.Point(X, Y)
		  Var Idx As Integer = Self.IndexAtPoint(MousePoint)
		  If Idx = -1 Then
		    Self.mMouseDown = False
		    Return True
		  End If
		  
		  Self.mMouseDown = True
		  Self.mMousePoint = MousePoint
		  Self.mMouseDownPoint = MousePoint
		  Self.mMouseDownIndex = Idx
		  Self.mMouseOverIndex = Idx
		  Self.Invalidate(Self.mMouseDownIndex)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If Not Self.mMouseDown Then
		    Return
		  End If
		  
		  Self.mMousePoint = New Xojo.Point(X, Y)
		  
		  Var OldIndex As Integer = Self.mMouseOverIndex
		  Self.mMouseOverIndex = Self.IndexAtPoint(Self.mMousePoint)
		  
		  If OldIndex > -1 And Self.mMouseOverIndex <> OldIndex Then
		    Var OldRect As Rect = Self.mItemRects(OldIndex)
		    Self.Invalidate(OldRect.Left, OldRect.Top, OldRect.Width, OldRect.Height)
		  End If
		  
		  If Self.mMouseOverIndex > -1 Then
		    Var OverRect As Rect = Self.mItemRects(Self.mMouseOverIndex)
		    Self.Invalidate(OverRect.Left, OverRect.Top, OverRect.Width, OverRect.Height)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  If Self.mMouseDown Then
		    Return
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  If Self.mMouseDown Then
		    Return
		  End If
		  
		  Self.mMousePoint = Nil
		  
		  If Self.mMouseOverIndex <> -1 Then
		    Self.Invalidate(Self.mMouseOverIndex)
		    Self.mMouseOverIndex = -1
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If Self.mMouseDown Then
		    Return
		  End If
		  
		  Self.mMousePoint = New Point(X, Y)
		  Var OldIndex As Integer = Self.mMouseOverIndex
		  Self.mMouseOverIndex = Self.IndexAtPoint(Self.mMousePoint)
		  
		  If OldIndex > -1 And Self.mMouseOverIndex <> OldIndex Then
		    Self.Invalidate(OldIndex)
		  End If
		  
		  If Self.mMouseOverIndex > -1 Then
		    Self.Invalidate(Self.mMouseOverIndex)
		  End If
		  
		  #if TargetMacOS
		    Self.TrueWindow.NSWindowMBS.Movable = Self.mMouseOverIndex = -1
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If Not Self.mMouseDown Then
		    Return
		  End If
		  
		  Self.mMousePoint = New Point(X, Y)
		  
		  If Self.mMouseDownIndex > -1 And Self.IndexAtPoint(Self.mMousePoint) = Self.mMouseDownIndex Then
		    Self.SelectedRowIndex = Self.mMouseDownIndex
		  End If
		  
		  Self.mMouseDown = False
		  Self.mMouseDownIndex = -1
		  
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect, Highlighted As Boolean)
		  #if UseVibrancyView = False And TargetMacOS = False
		    G.DrawingColor = SystemColors.WindowBackgroundColor
		    G.FillRectangle(0, 0, G.Width, G.Height)
		  #endif
		  
		  Var Rects() As Rect
		  Rects.ResizeTo(Self.mItems.LastRowIndex)
		  
		  Const RowHeight = 30
		  Const Inset = 10
		  Const CornerRadius = 8
		  Const Padding = 8
		  
		  Var RowTop As Integer = Floor(Inset - Self.mScrollOffset)
		  For Idx As Integer = 0 To Self.mItems.LastRowIndex
		    Rects(Idx) = New Rect(Inset, RowTop, G.Width - (Inset * 2), RowHeight)
		    RowTop = RowTop + RowHeight
		  Next
		  
		  Self.ContentHeight = (Self.mItems.Count * RowHeight) + (Inset * 2)
		  Self.mItemRects = Rects
		  
		  Var Viewport As New Rect(0, 0, G.Width, G.Height)
		  For Idx As Integer = 0 To Self.mItems.LastRowIndex
		    Var ItemRect As Rect = Self.mItemRects(Idx)
		    Var Draw As Boolean
		    If Viewport.Intersects(ItemRect) Then
		      If Areas.LastRowIndex = -1 Then
		        Draw = True
		      Else
		        For Each Area As Rect In Areas
		          If Area.Intersects(ItemRect) Then
		            Draw = True
		          End If
		        Next
		      End If
		    End If
		    If Not Draw Then
		      Continue
		    End If
		    
		    Var Clip As Graphics = G.Clip(ItemRect.Left, ItemRect.Top, ItemRect.Width, ItemRect.Height)
		    Var CaptionBaseline As Double = (Clip.Height / 2) + (Clip.CapHeight / 2)
		    Var CaptionLeft As Double = Padding
		    
		    If Self.SelectedRowIndex = Idx Then
		      Clip.DrawingColor = If(Highlighted, SystemColors.SelectedContentBackgroundColor, SystemColors.UnemphasizedSelectedContentBackgroundColor)
		      Clip.FillRoundRectangle(0, 0, Clip.Width, Clip.Height, CornerRadius, CornerRadius)
		      Clip.DrawingColor = If(Highlighted, SystemColors.AlternateSelectedControlTextColor, SystemColors.UnemphasizedSelectedTextColor)
		    Else
		      Clip.DrawingColor = SystemColors.ControlTextColor
		    End If
		    Clip.DrawText(Self.mItems(Idx).Caption, CaptionLeft, CaptionBaseline, Clip.Width - (Padding * 2), True)
		    
		    If Self.mMouseDown And Self.mMouseOverIndex = Idx And Self.mMouseDownIndex = Idx Then
		      Clip.DrawingColor = &c000000AA
		      Clip.FillRoundRectangle(0, 0, Clip.Width, Clip.Height, CornerRadius, CornerRadius)
		    End If
		  Next
		  
		  If Self.mScrollOpacity > 0 Then
		    Const ThumbWidth = 7
		    Const ThumbPadding = 2
		    
		    Var Ratio As Double = Me.Height / Self.mContentHeight
		    Var TrackArea As Integer = Me.Height - (ThumbPadding * 2)
		    Var ThumbHeight As Double = NearestMultiple(TrackArea * Ratio, G.ScaleY)
		    Var ThumbTop As Double = NearestMultiple(ThumbPadding + ((TrackArea - ThumbHeight) * (Self.ScrollPosition / Self.ScrollMaximum)), G.ScaleY)
		    
		    G.DrawingColor = SystemColors.SecondaryLabelColor.AtOpacity(Self.mScrollOpacity)
		    G.FillRoundRectangle(G.Width - (ThumbWidth + ThumbPadding), ThumbTop, ThumbWidth, ThumbHeight, ThumbWidth, ThumbWidth)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(MouseX As Integer, MouseY As Integer, PixelsX As Double, PixelsY As Double, WheelData As BeaconUI.ScrollEvent) As Boolean
		  #Pragma Unused MouseX
		  #Pragma Unused MouseY
		  #Pragma Unused WheelData
		  #Pragma Unused PixelsX
		  
		  Self.ScrollPosition = Self.mScrollOffset + PixelsY
		End Function
	#tag EndEvent
#tag EndEvents
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelectedRowIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
