#tag DesktopWindow
Begin ArkDiscoveryView ArkNitradoDiscoveryView
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   DoubleBuffer    =   "False"
   Enabled         =   True
   EraseBackground =   "True"
   HasBackgroundColor=   False
   Height          =   480
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   720
   Begin DesktopPagePanel PagePanel1
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   480
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   3
      Panels          =   ""
      Scope           =   2
      SelectedPanelIndex=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   1
      Visible         =   True
      Width           =   720
      Begin UITweaks.ResizedPushButton FindingCancelButton
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
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   620
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   440
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin DesktopLabel FindingLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
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
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Finding Servers…"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   162
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   680
      End
      Begin DesktopProgressBar FindingProgress
         Active          =   False
         AllowAutoDeactivate=   True
         AllowTabStop    =   True
         Enabled         =   True
         Height          =   20
         Indeterminate   =   False
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumValue    =   100
         PanelIndex      =   0
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   1
         Tooltip         =   ""
         Top             =   194
         Transparent     =   False
         Value           =   0.0
         Visible         =   True
         Width           =   680
         _mIndex         =   0
         _mInitialParent =   ""
         _mName          =   ""
         _mPanelIndex    =   0
      End
      Begin DesktopLabel ListMessageLabel
         AllowAutoDeactivate=   True
         Bold            =   True
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Select Servers"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   20
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   680
      End
      Begin UITweaks.ResizedPushButton ListCancelButton
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
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   528
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   440
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPushButton ListActionButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Next"
         Default         =   True
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   620
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   440
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPushButton NewAuthButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Link Another Account"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   440
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   160
      End
      Begin DesktopLabel FindingStatus
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
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
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Connecting…"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   218
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   680
      End
      Begin BeaconListbox List
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowInfiniteScroll=   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   4
         ColumnWidths    =   "26,*,170,170"
         DefaultRowHeight=   "#BeaconListbox.StandardRowHeight"
         DefaultSortColumn=   0
         DefaultSortDirection=   0
         DropIndicatorVisible=   False
         EditCaption     =   "Edit"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLineStyle   =   0
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   360
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   " 	Name	Address	Platform"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PreferencesKey  =   ""
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   60
         Transparent     =   False
         TypeaheadColumn =   0
         Underline       =   False
         Visible         =   True
         VisibleRowCount =   0
         Width           =   680
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin Beacon.OAuth2Client AuthClient
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin Timer StatusWatchTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   100
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Begin()
		  Self.List.RemoveAllRows()
		  Self.mPendingListActions = 0
		  
		  If Self.mAccounts.Count = 0 Then
		    Self.StartNewAccount()
		    Return
		  End If
		  
		  Var Accounts() As Beacon.ExternalAccount = Self.mAccounts.ForProvider(Beacon.ExternalAccount.ProviderNitrado)
		  For Each Account As Beacon.ExternalAccount In Accounts
		    Var Profile As New Ark.NitradoServerProfile
		    Profile.ExternalAccountUUID = Account.UUID
		    Self.Authenticate(Profile)
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub GetValuesFromProject(Project As Beacon.Project)
		  Self.mAccounts.Import(Project.Accounts)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Self.SwapButtons()
		  RaiseEvent Open
		  Self.CheckActionEnabled
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resize()
		  Var ContentHeight As Integer = FindingLabel.Height + 12 + FindingProgress.Height + 6 + FindingStatus.Height
		  Var AvailableHeight As Integer = Self.Height - (52 + FindingCancelButton.Height)
		  
		  Var ContentTop As Integer = 20 + ((AvailableHeight - ContentHeight) / 2)
		  FindingLabel.Top = ContentTop
		  FindingProgress.Top = ContentTop + FindingLabel.Height + 12
		  FindingStatus.Top = FindingProgress.Top + FindingProgress.Height + 6
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Authenticate(Profile As Ark.NitradoServerProfile)
		  Var Engine As New Ark.NitradoIntegrationEngine(Profile)
		  Self.mEngines.Value(Profile.ExternalAccountUUID.StringValue) = Engine
		  AddHandler Engine.Discovered, WeakAddressOf Engine_Discovered
		  AddHandler Engine.Wait, WeakAddressOf Engine_Wait
		  Engine.BeginDiscovery(Self.Project)
		  
		  Self.mPendingListActions = Self.mPendingListActions + 1
		  
		  If Self.PagePanel1.SelectedPanelIndex <> 0 Then
		    Self.PagePanel1.SelectedPanelIndex = 0
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Busy() As Boolean
		  Return Self.AuthClient.Busy Or Self.mPendingListActions > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CheckActionEnabled()
		  If Not Self.Busy Then
		    For I As Integer = 0 To Self.List.RowCount - 1
		      If Self.List.CellCheckBoxValueAt(I, 0) Then
		        Self.ListActionButton.Enabled = True
		        Return
		      End If
		    Next
		  End If
		  
		  Self.ListActionButton.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mAccounts = New Beacon.ExternalAccountManager
		  Self.mEngines = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If Self.mOAuthWindow <> Nil Then
		    Self.mOAuthWindow.Close
		    Self.mOAuthWindow = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Engine_Discovered(Sender As Ark.NitradoIntegrationEngine, Data() As Beacon.DiscoveredData)
		  Self.mPendingListActions = Self.mPendingListActions - 1
		  
		  If Sender.Errored Then
		    Self.ShowAlert("Unable to retrieve server list from Nitrado", "The error message provided was:" + EndOfLine + EndOfLine + Sender.ErrorMessage + EndOfLine + EndOfLine + "This error may be temporary, so try again in a few minutes. If the problem persists, make sure your antivirus or malware protection is not blocking Beacon from contacting Nitrado's servers.")
		    Self.ShouldCancel()
		    Return
		  End If
		  
		  For Each Server As Beacon.DiscoveredData In Data
		    Var PlatformText As String = "Unknown"
		    Select Case Server.Profile.Platform
		    Case Beacon.ServerProfile.PlatformPC
		      PlatformText = "Steam & Epic"
		    Case Beacon.ServerProfile.PlatformPlayStation
		      PlatformText = "PlayStation"
		    Case Beacon.ServerProfile.PlatformSwitch
		      PlatformText = "Switch"
		    Case Beacon.ServerProfile.PlatformXbox
		      PlatformText = "Xbox & Windows Store"
		    End Select
		    
		    Self.List.AddRow("", Server.Profile.Name, Ark.NitradoServerProfile(Server.Profile).Address, PlatformText)
		    Self.List.RowTagAt(Self.List.LastAddedRowIndex) = Server
		  Next
		  
		  If Self.PagePanel1.SelectedPanelIndex <> 1 And Self.Busy = False Then
		    If Self.List.RowCount = 0 Then
		      Self.ShowAlert("No eligible servers were found", "Beacon could not find any PC, Xbox, or PS4 Ark servers on any of the connected Nitrado accounts.")
		      Self.ShouldCancel()
		      Return
		    End If
		    
		    Var AllSamePlatform As Boolean = True
		    Var PlatformText As String
		    For Idx As Integer = 0 To Self.List.LastRowIndex
		      If PlatformText.IsEmpty Then
		        PlatformText = Self.List.CellTextAt(Idx, 3)
		        Continue
		      End If
		      
		      If PlatformText <> Self.List.CellTextAt(Idx, 3) Then
		        AllSamePlatform = False
		        Exit For Idx
		      End If
		    Next
		    
		    If AllSamePlatform Then
		      Self.List.ColumnAttributesAt(3).WidthExpression = "0"
		    Else
		      Self.List.SizeColumnToFit(3)
		    End If
		    Self.List.SizeColumnToFit(2)
		    
		    App.FrontmostMBS = True
		    Self.TrueWindow.ActivateWindowMBS
		    
		    Self.List.SortingColumn = 1
		    Self.List.Sort
		    Self.DesiredHeight = 480
		    Self.PagePanel1.SelectedPanelIndex = 1
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Engine_Wait(Sender As Ark.NitradoIntegrationEngine, Controller As Beacon.TaskWaitController) As Boolean
		  Select Case Controller.Action
		  Case "Auth External"
		    Var Profile As Ark.ServerProfile = Sender.Profile
		    Var Account As Beacon.ExternalAccount = Self.mAccounts.GetByUUID(Profile.ExternalAccountUUID)
		    If Account Is Nil Then
		      Account = New Beacon.ExternalAccount(Profile.ExternalAccountUUID, Beacon.ExternalAccount.ProviderNitrado)
		    End If
		    
		    If Self.AuthClient.SetAccount(Account) Then
		      Self.mAuthController = Controller
		      Self.AuthClient.Authenticate(App.IdentityManager.CurrentIdentity)
		    Else
		      Controller.Cancelled = True
		      Controller.ShouldResume = True
		    End If
		    
		    Return True
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ListServers(Account As Beacon.ExternalAccount)
		  Var Profile As New Ark.NitradoServerProfile
		  Profile.ExternalAccountUUID = Account.UUID
		  
		  Var Engine As New Ark.NitradoIntegrationEngine(Profile)
		  Self.mEngines.Value(Profile.ExternalAccountUUID.StringValue) = Engine
		  AddHandler Engine.Discovered, WeakAddressOf Engine_Discovered
		  AddHandler Engine.Wait, WeakAddressOf Engine_Wait
		  Engine.BeginDiscovery(Self.Project)
		  
		  Self.mPendingListActions = Self.mPendingListActions + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShouldCancel()
		  If (Self.mAuthController Is Nil) = False Then
		    Self.mAuthController.Cancelled = True
		    Self.mAuthController.ShouldResume = True
		    Self.mAuthController = Nil
		  End If
		  
		  Super.ShouldCancel()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartNewAccount()
		  Var Account As New Beacon.ExternalAccount(Beacon.ExternalAccount.ProviderNitrado)
		  Self.mAccounts.Add(Account)
		  
		  Var Profile As New Ark.NitradoServerProfile
		  Profile.ExternalAccountUUID = Account.UUID
		  Self.Authenticate(Profile)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mAccounts As Beacon.ExternalAccountManager
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAddressColumnWidth As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAuthController As Beacon.TaskWaitController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEngines As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOAuthWindow As OAuthAuthorizationWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingListActions As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlatformColumnWidth As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedServers As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events PagePanel1
	#tag Event
		Sub PanelChanged()
		  Self.StatusWatchTimer.RunMode = If(Me.SelectedPanelIndex = 0, Timer.RunModes.Multiple, Timer.RunModes.Off)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FindingCancelButton
	#tag Event
		Sub Pressed()
		  Self.ShouldCancel()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListCancelButton
	#tag Event
		Sub Pressed()
		  Self.ShouldCancel()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListActionButton
	#tag Event
		Sub Pressed()
		  Var Data() As Beacon.DiscoveredData
		  For I As Integer = 0 To Self.List.RowCount - 1
		    If Not Self.List.CellCheckBoxValueAt(I, 0) Then
		      Continue
		    End If
		    
		    Data.Add(Self.List.RowTagAt(I))
		  Next
		  Self.ShouldFinish(Data, Self.mAccounts)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewAuthButton
	#tag Event
		Sub Pressed()
		  If Self.AuthClient.Busy THen
		    Self.ShowAlert("Wait for the current Nitrado authentication to finish first.", "Beacon can only support one Nitrado authentication at a time.")
		    Return
		  End If
		  
		  Self.StartNewAccount()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events List
	#tag Event
		Sub Opening()
		  Me.ColumnTypeAt(0) = DesktopListbox.CellTypes.CheckBox
		  Me.TypeaheadColumn = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  #Pragma Unused Row
		  #Pragma Unused Column
		  
		  Self.CheckActionEnabled()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AuthClient
	#tag Event
		Sub Authenticated()
		  Var Account As Beacon.ExternalAccount = Me.Account
		  Self.mAccounts.Add(Account)
		  
		  If (Self.mAuthController Is Nil) = False Then
		    Dictionary(Self.mAuthController.UserData).Value("Account") = Account
		    Self.mAuthController.ShouldResume = True
		    Self.mAuthController = Nil
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub AuthenticationError(Reason As String)
		  #Pragma Unused Reason
		  
		  Var Choice As BeaconUI.ConfirmResponses = Self.ShowConfirm("Beacon is unable to communicate with its server", "Check Beacon's ""System Status"" page to make sure this isn't a problem with Beacon. If Beacon is working normally, check your internet connection.", "System Status", "Cancel", "Help")
		  Select Case Choice
		  Case BeaconUI.ConfirmResponses.Action
		    System.GotoURL("https://status.usebeacon.app/")
		  Case BeaconUI.ConfirmResponses.Alternate
		    System.GotoURL(Beacon.WebURL("/help/solving_connection_problems_to"))
		  End Select
		  
		  If (Self.mAuthController Is Nil) = False Then
		    Self.mAuthController.Cancelled = True
		    Self.mAuthController.ShouldResume = True
		    Self.mAuthController = Nil
		  End If
		  
		  Self.ShouldCancel()
		End Sub
	#tag EndEvent
	#tag Event
		Function StartAuthentication(Account As Beacon.ExternalAccount, URL As String) As Boolean
		  If Not Self.ShowConfirm("Open your browser to authorize with " + Account.Provider + "?", "To continue discovering servers, you must authorize " + Account.Provider + " to allow Beacon to access your servers.", "Continue", "Cancel") Then
		    Return False
		  End If
		  
		  System.GotoURL(URL)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DismissWaitingWindow()
		  If Self.mOAuthWindow <> Nil Then
		    Self.mOAuthWindow.Close
		    Self.mOAuthWindow = Nil
		  End If
		  
		  Self.NewAuthButton.Enabled = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub ShowWaitingWindow()
		  Self.mOAuthWindow = New OAuthAuthorizationWindow(Me)
		  Self.NewAuthButton.Enabled = False
		  Self.mOAuthWindow.Show()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Busy()
		  Self.NewAuthButton.Enabled = False
		  Self.CheckActionEnabled()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Idle()
		  Self.NewAuthButton.Enabled = True
		  Self.CheckActionEnabled()
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserCancelled()
		  If Self.List.RowCount = 0 Then
		    Self.ShouldCancel()
		    Return
		  End If
		  
		  Self.PagePanel1.SelectedPanelIndex = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub AccountUUIDChanged(OldUUID As v4UUID)
		  If Self.mEngines.HasKey(OldUUID.StringValue) Then
		    Var Engine As Beacon.IntegrationEngine = Self.mEngines.Value(OldUUID.StringValue)
		    Engine.Profile.ExternalAccountUUID = Me.Account.UUID
		    Self.mEngines.Remove(OldUUID.StringValue)
		    Self.mEngines.Value(Me.Account.UUID.StringValue) = Engine
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatusWatchTimer
	#tag Event
		Sub Action()
		  If Self.mEngines Is Nil Then
		    Return
		  End If
		  
		  Var Label As String
		  If Self.mEngines.KeyCount = 1 Then
		    Var Key As Variant = Self.mEngines.Key(0)
		    Var Engine As Ark.NitradoIntegrationEngine = Self.mEngines.Value(Key)
		    Label = Engine.Logs(True)
		  Else
		    Label = "Discovering servers on multiple accounts…"
		  End If
		  
		  If Self.FindingStatus.Text.Compare(Label, ComparisonOptions.CaseSensitive, Locale.Current) <> 0 Then
		    Self.FindingStatus.Text = Label
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
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
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
#tag EndViewBehavior
