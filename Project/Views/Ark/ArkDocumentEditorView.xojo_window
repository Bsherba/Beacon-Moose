#tag DesktopWindow
Begin DocumentEditorView ArkDocumentEditorView
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composited      =   False
   DoubleBuffer    =   "True"
   Enabled         =   True
   EraseBackground =   "True"
   HasBackgroundColor=   False
   Height          =   528
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
   Width           =   858
   Begin DesktopPagePanel PagePanel1
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   487
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   231
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   2
      SelectedPanelIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   41
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   627
      Begin DesktopCanvas OmniNoticeBanner
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Enabled         =   True
         Height          =   31
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   231
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   False
         Width           =   627
      End
      Begin LogoFillCanvas LogoFillCanvas1
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         Caption         =   "There was an error loading the editor"
         ContentHeight   =   0
         Enabled         =   True
         Height          =   487
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   231
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         ScrollActive    =   False
         ScrollingEnabled=   False
         ScrollSpeed     =   20
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   41
         Transparent     =   True
         Visible         =   True
         Width           =   627
      End
   End
   Begin FadedSeparator SourceSeparator
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      ContentHeight   =   0
      Enabled         =   True
      Height          =   487
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      ScrollActive    =   False
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   41
      Transparent     =   True
      Visible         =   True
      Width           =   1
   End
   Begin OmniBar OmniBar1
      Alignment       =   0
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      BackgroundColor =   ""
      ContentHeight   =   0
      Enabled         =   True
      Height          =   41
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LeftPadding     =   -1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RightPadding    =   -1
      Scope           =   2
      ScrollActive    =   False
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   858
   End
   Begin SourceList ConfigList
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   446
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   82
      Transparent     =   True
      Visible         =   True
      Width           =   230
   End
   Begin ControlCanvas ConfigSetPicker
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      ContentHeight   =   0
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      ScrollActive    =   False
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   41
      Transparent     =   True
      Visible         =   True
      Width           =   230
   End
   Begin FadedSeparator FadedSeparator2
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      ContentHeight   =   0
      Enabled         =   True
      Height          =   1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      ScrollActive    =   False
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   81
      Transparent     =   True
      Visible         =   True
      Width           =   230
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  If (Self.mImportWindow Is Nil) = False Then
		    Self.CleanupImportWindow()
		    Self.mImportWindow.Close
		    Self.mImportWindow = Nil
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  If Self.ReadyToDeploy Then
		    FileDeploy.Enabled = True
		  End If
		  
		  If Self.ReadyToExport Then
		    FileExport.Enabled = True
		  End If
		  
		  If Self.Project.ActiveConfigSet <> Ark.Project.BaseConfigSetName Then
		    ViewSwitchToBaseConfigSet.Enabled = True
		  End If
		  
		  If Self.CurrentPanel <> Nil Then
		    Self.CurrentPanel.EnableMenuItems()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Hidden()
		  Var Panel As ArkConfigEditor = Self.CurrentPanel
		  If (Panel Is Nil) = False Then
		    Panel.SwitchedFrom()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub IdentityChanged()
		  // Simply toggle the menu to force a redraw
		  Var CurrentConfig As String = Self.CurrentConfigName
		  Self.CurrentConfigName = ""
		  Self.CurrentConfigName = CurrentConfig
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  If (Self.Project Is Nil) = False Then
		    Var UUID As String = Self.Project.UUID
		    Var LastConfigName As String = Preferences.ProjectState(UUID, "Editor", "")
		    Var LastConfigSet As String = Preferences.ProjectState(UUID, "Config Set", "")
		    If LastConfigName.IsEmpty Or LastConfigSet.IsEmpty Then
		      If Self.URL.Scheme = Beacon.ProjectURL.TypeWeb Then
		        LastConfigName = Ark.Configs.NameMetadataPsuedo
		      Else
		        LastConfigName = Ark.Configs.NameLootDrops
		      End If
		      LastConfigSet = Beacon.Project.BaseConfigSetName
		    End If
		    Self.ActiveConfigSet = LastConfigSet
		    Self.CurrentConfigName = LastConfigName
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub RunScriptAction(Action As Beacon.ScriptAction)
		  Select Case Action.Action
		  Case "Deploy"
		    Var Settings As New Beacon.DeploySettings
		    Settings.Options = UInt64.FromString(Action.Value("Options"), Locale.Raw)
		    Settings.StopMessage = Action.Value("StopMessage")
		    Var ProfileIds() As String = Action.Value("Servers").Split(",")
		    For Each ProfileId As String In ProfileIds
		      Var Profile As Beacon.ServerProfile = Self.Project.ServerProfile(ProfileId)
		      If (Profile Is Nil) = False Then
		        Settings.Servers.Add(Profile)
		      End If
		    Next
		    
		    Self.BeginDeploy(Settings)
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub ShouldSave(CloseWhenFinished As Boolean)
		  #Pragma Unused CloseWhenFinished
		  
		  If Self.mUpdateUITag <> "" Then
		    CallLater.Cancel(Self.mUpdateUITag)
		    Self.mUpdateUITag = ""
		    Self.UpdateUI()
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown(UserData As Variant = Nil)
		  Var Panel As ArkConfigEditor = Self.CurrentPanel
		  If (Panel Is Nil) = False Then
		    Panel.SwitchedTo(UserData)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub SwitchToEditor(EditorName As String)
		  Self.CurrentConfigName = EditorName
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileDeploy() As Boolean Handles FileDeploy.Action
		  If Self.IsFrontmost = False Then
		    Return False
		  End If
		  
		  Self.BeginDeploy()
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileExport() As Boolean Handles FileExport.Action
		  If Self.IsFrontmost = False Then
		    Return False
		  End If
		  
		  Self.BeginExport()
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewSwitchToBaseConfigSet() As Boolean Handles ViewSwitchToBaseConfigSet.Action
		  If Self.IsFrontmost = False Then
		    Return False
		  End If
		  
		  Self.ActiveConfigSet = Beacon.Project.BaseConfigSetName
		  Return True
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub BeginDeploy()
		  Self.BeginDeploy(Preferences.NewDeploySettings)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BeginDeploy(Settings As Beacon.DeploySettings)
		  If Self.mDeployWindow <> Nil And Self.mDeployWindow.Value <> Nil And Self.mDeployWindow.Value IsA DeployManager Then
		    DeployManager(Self.mDeployWindow.Value).BringToFront()
		  Else
		    Self.Autosave()
		    
		    If Not Self.ReadyToDeploy Then
		      Self.ShowAlert("This project is not ready for deploy.", "You must import at least one server into this project to use the deploy feature. Use the Import button in the top left.") 
		      Return
		    End If
		    
		    If Not Self.ContinueWithoutExcludedConfigs() Then
		      Return
		    End If
		    
		    If Self.mValidator Is Nil And (Self.mValidationResultsDialog Is Nil Or Self.mValidationResultsDialog.Value Is Nil) Then
		      Var Validator As New Beacon.ProjectValidator
		      AddHandler Validator.Validating, WeakAddressOf mValidator_Validating
		      AddHandler Validator.ValidationComplete, WeakAddressOf mValidator_ValidationComplete_Deploy
		      Validator.StartValidation(Self.Project, Settings)
		      Self.mValidator = Validator
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BeginDeploy(PreselectServers() As Beacon.ServerProfile)
		  Var Settings As Beacon.DeploySettings = Preferences.NewDeploySettings
		  Settings.Servers = PreselectServers
		  Self.BeginDeploy(Settings)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BeginExport()
		  Self.Autosave()
		  
		  If Not Self.ContinueWithoutExcludedConfigs() Then
		    Return
		  End If
		  
		  If Self.mValidator Is Nil And (Self.mValidationResultsDialog Is Nil Or Self.mValidationResultsDialog.Value Is Nil) Then
		    Var Validator As New Beacon.ProjectValidator
		    AddHandler Validator.Validating, WeakAddressOf mValidator_Validating
		    AddHandler Validator.ValidationComplete, WeakAddressOf mValidator_ValidationComplete_Export
		    Validator.StartValidation(Self.Project)
		    Self.mValidator = Validator
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BeginImport(ForDeployment As Boolean)
		  If (Self.mImportWindow Is Nil) = False Then
		    Self.mImportWindow.Show()
		    Return
		  End If
		  
		  Var OtherProjects() As Beacon.Project
		  For I As Integer = 0 To Self.mEditorRefs.KeyCount - 1
		    Var Key As Variant = Self.mEditorRefs.Key(I)
		    Var Ref As WeakRef = Self.mEditorRefs.Value(Key)
		    If Ref <> Nil And Ref.Value <> Nil And Ref.Value IsA DocumentEditorView And DocumentEditorView(Ref.Value).Project.UUID <> Self.Project.UUID Then
		      OtherProjects.Add(DocumentEditorView(Ref.Value).Project)
		    End If
		  Next
		  
		  Var ImportView As New ArkImportView
		  Var Ref As New DocumentImportWindow(ImportView, Self.Project, OtherProjects)
		  AddHandler Ref.ProjectsImported, WeakAddressOf mImportWindow_ProjectsImported
		  AddHandler Ref.Closing, WeakAddressOf mImportWindow_Closing
		  Ref.UserData = ForDeployment
		  Ref.Show()
		  Self.mImportWindow = Ref
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CleanupImportWindow()
		  If Self.mImportWindow Is Nil Then
		    Return
		  End If
		  
		  Try
		    RemoveHandler mImportWindow.Closing, WeakAddressOf mImportWindow_Closing
		  Catch Err As RuntimeException
		  End Try
		  
		  Try
		    RemoveHandler mImportWindow.ProjectsImported, WeakAddressOf mImportWindow_ProjectsImported
		  Catch Err As RuntimeException
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConfirmClose() As Boolean
		  If Self.Progress <> BeaconSubview.ProgressNone Then
		    Self.RequestFrontmost()
		    
		    Self.ShowAlert(Self.ViewTitle + " cannot be closed right now because it is busy.", "Wait for the progress indicator at the top of the tab to go away before trying to close it.")
		    Return False
		  End If
		  
		  Return Super.ConfirmClose()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Controller As Beacon.ProjectController)
		  If Self.mEditorRefs = Nil Then
		    Self.mEditorRefs = New Dictionary
		  End If
		  Self.mEditorRefs.Value(Controller.Project.UUID) = New WeakRef(Self)
		  
		  Self.Panels = New Dictionary
		  
		  Super.Constructor(Controller)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ContinueWithoutExcludedConfigs() As Boolean
		  Var ExcludedConfigs() As Ark.ConfigGroup = Self.Project.UsesOmniFeaturesWithoutOmni(App.IdentityManager.CurrentIdentity)
		  If ExcludedConfigs.LastIndex = -1 Then
		    Return True
		  End If
		  
		  Var HumanNames() As String
		  For Each Config As Ark.ConfigGroup In ExcludedConfigs
		    HumanNames.Add("""" + Language.LabelForConfig(Config) + """")
		  Next
		  HumanNames.Sort
		  
		  Var Message, Explanation As String
		  If HumanNames.LastIndex = 0 Then
		    Message = "You are using an editor that will not be included in your config files."
		    Explanation = "The " + HumanNames(0) + " editor requires Beacon Omni, which you have not purchased. Beacon will not generate its content for your config files. Do you still want to continue?"
		  Else
		    Var GroupList As String = HumanNames.EnglishOxfordList()
		    Message = "You are using editors that will not be included in your config files."
		    Explanation = "The " + GroupList + " editors require Beacon Omni, which you have not purchased. Beacon will not generate their content for your config files. Do you still want to continue?"
		  End If
		  
		  Return Self.ShowConfirm(Message, Explanation, "Continue", "Cancel")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CopyFromDocuments(SourceProjects As Variant)
		  Var Projects() As Beacon.Project
		  Try
		    Projects = SourceProjects
		  Catch Err As RuntimeException
		  End Try
		  DocumentMergerWindow.Present(Self, Projects, Self.Project, WeakAddressOf MergeCallback)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CopyFromDocumentsAndDeploy(SourceProjects As Variant)
		  Var Projects() As Beacon.Project
		  Try
		    Projects = SourceProjects
		  Catch Err As RuntimeException
		  End Try
		  DocumentMergerWindow.Present(Self, Projects, Self.Project, WeakAddressOf MergeAndDeployCallback)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If (Self.mEditorRefs Is Nil) = False And Self.mEditorRefs.HasKey(Self.Project.UUID) Then
		    Self.mEditorRefs.Remove(Self.Project.UUID)
		  End If
		  
		  If (Self.mMapsPopoverController Is Nil) = False Then
		    RemoveHandler mMapsPopoverController.Finished, WeakAddressOf MapsPopoverController_Finished
		    Self.mModsPopoverController.Dismiss(True)
		    Self.mMapsPopoverController = Nil
		  End If
		  
		  If (Self.mModsPopoverController Is Nil) = False Then
		    RemoveHandler mModsPopoverController.Finished, WeakAddressOf ModsPopoverController_Finished
		    Self.mModsPopoverController.Dismiss(True)
		    Self.mModsPopoverController = Nil
		  End If
		  
		  If (Self.mValidationResultsDialog Is Nil) = False And (Self.mValidationResultsDialog.Value Is Nil) = False Then
		    ResolveIssuesDialog(Self.mValidationResultsDialog.Value).Close
		  End If
		  
		  If (Self.mDeployWindow Is Nil) = False And (Self.mDeployWindow.Value Is Nil) = False Then
		    DeployManager(Self.mDeployWindow.Value).Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DiscardConfigPanel(CacheKey As String)
		  // This is indiscriminate and will close the current config if you ask it to.
		  
		  If Not Self.Panels.HasKey(CacheKey) Then
		    Return
		  End If
		  
		  Var Panel As ArkConfigEditor = Self.Panels.Value(CacheKey)
		  If Panel IsA ServersConfigEditor Then
		    RemoveHandler ServersConfigEditor(Panel).ShouldDeployProfiles, WeakAddressOf ServersEditor_ShouldDeployProfiles
		  End If
		  RemoveHandler Panel.ContentsChanged, WeakAddressOf Panel_ContentsChanged
		  Panel.Close
		  Self.Panels.Remove(CacheKey)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleConfigPickerClick()
		  Var Menu As New DesktopMenuItem
		  Menu.AddMenu(New DesktopMenuItem("Create and switch to new config set…", "beacon:createandswitch"))
		  Menu.AddMenu(New DesktopMenuItem("Manage config sets…", "beacon:manage"))
		  Menu.AddMenu(New DesktopMenuItem(MenuItem.TextSeparator))
		  
		  Var SetNames() As String = Self.Project.ConfigSetNames
		  SetNames.Sort
		  For Each SetName As String In SetNames
		    Var Item As New DesktopMenuItem(SetName, SetName)
		    Item.HasCheckMark = SetName = Self.ActiveConfigSet
		    If SetName = Beacon.Project.BaseConfigSetName Then
		      Item.Shortcut = "B"
		    End If
		    Menu.AddMenu(Item)
		  Next
		  
		  Menu.AddMenu(New DesktopMenuItem(MenuItem.TextSeparator))
		  Menu.AddMenu(New DesktopMenuItem("Learn more about config sets…", "beacon:help"))
		  
		  Var PickerOrigin As Point = Self.ConfigSetPicker.GlobalPosition
		  Var Origin As Point = New Point(PickerOrigin.X + Self.mConfigPickerMenuOrigin.X, PickerOrigin.Y + Self.mConfigPickerMenuOrigin.Y)
		  Var Choice As DesktopMenuItem = Menu.PopUp(Origin.X, Origin.Y)
		  If (Choice Is Nil) = False Then
		    If Choice.Tag.StringValue.BeginsWith("beacon:") Then
		      Var Tag As String = Choice.Tag.StringValue.Middle(7)
		      Select Case Tag
		      Case "manage"
		        If ConfigSetManagerWindow.Present(Self, Self.Project) Then
		          Self.ActiveConfigSet = Self.ActiveConfigSet
		        End If
		      Case "help"
		        Var HelpURL As String = Beacon.HelpURL("config_sets")
		        If App.MainWindow Is Nil Then
		          // No logical way for this to happen.
		          System.GotoURL(HelpURL)
		          Return
		        End If
		        
		        Var Component As HelpComponent = App.MainWindow.Help(False)
		        If Component Is Nil Then
		          System.GotoURL(HelpURL)
		          Return
		        End If
		        
		        App.MainWindow.ShowHelp()
		        Component.LoadURL(HelpURL)
		      case "createandswitch"
		        Var NewSetName As String = ConfigSetNamingWindow.Present(Self)
		        If NewSetName.IsEmpty Then
		          Return
		        End If
		        
		        If Self.Project.HasConfigSet(NewSetName) Then
		          Self.ActiveConfigSet = NewSetName
		          Self.ShowAlert("You have been switched to the " + NewSetName + " config set.", "This project already has a " + NewSetName + " config set, so it has been switched to.")
		          Return
		        End If
		        
		        Self.Project.AddConfigSet(NewSetName)
		        Self.ActiveConfigSet = NewSetName
		      End Select
		    Else
		      Self.ActiveConfigSet = Choice.Tag.StringValue
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MapsPopoverController_Finished(Sender As PopoverController, Cancelled As Boolean)
		  If Not Cancelled Then
		    Self.Project.MapMask = MapSelectionGrid(Sender.Container).Mask
		    Self.Modified = Self.Project.Modified
		  End If
		  
		  If (Self.CurrentPanel Is Nil) = False Then
		    Self.CurrentPanel.SetupUI()
		  End If
		  
		  Self.OmniBar1.Item("MapsButton").Toggled = False
		  Self.mMapsPopoverController = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MergeAndDeployCallback()
		  Self.MergeCallback()
		  Self.BeginDeploy()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MergeCallback()
		  Var Keys() As Variant = Self.Panels.Keys
		  For Each Key As Variant In Keys
		    Var Panel As ArkConfigEditor = Self.Panels.Value(Key)
		    If Panel <> Nil Then
		      Panel.ImportFinished()
		    End If
		  Next
		  
		  Self.Autosave()
		  Self.UpdateConfigList()
		  Self.Panel_ContentsChanged(Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mImportWindow_Closing(Sender As DocumentImportWindow)
		  #Pragma Unused Sender
		  
		  Self.CleanupImportWindow()
		  Self.mImportWindow = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mImportWindow_ProjectsImported(Sender As DocumentImportWindow, Projects() As Beacon.Project)
		  #Pragma Unused Sender
		  
		  If Sender.UserData.BooleanValue Then
		    Call CallLater.Schedule(0, WeakAddressOf CopyFromDocumentsAndDeploy, Projects)
		  Else
		    Call CallLater.Schedule(0, WeakAddressOf CopyFromDocuments, Projects)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ModsPopoverController_Finished(Sender As PopoverController, Cancelled As Boolean)
		  If Not Cancelled Then
		    Var Editor As ModSelectionGrid = ModSelectionGrid(Sender.Container)
		    Var ContentPacks() As Ark.ContentPack = Ark.DataSource.Pool.Get(False).GetContentPacks
		    For Each Pack As Ark.ContentPack In ContentPacks
		      Self.Project.ContentPackEnabled(Pack.UUID) = Editor.ModEnabled(Pack.UUID)
		    Next
		    
		    Self.Modified = Self.Project.Modified
		  End If
		  
		  If (Self.CurrentPanel Is Nil) = False Then
		    Self.CurrentPanel.SetupUI()
		  End If
		  
		  Self.OmniBar1.Item("ModsButton").Toggled = False
		  Self.mModsPopoverController = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mValidationResultsDialog_GoToIssue(Sender As ResolveIssuesDialog, Issue As Beacon.Issue)
		  Sender.Close
		  
		  Select Case Issue.Location
		  Case "MapMask"
		    Self.ShowMapPicker()
		    Return
		  End Select
		  
		  Var Parts() As String = Issue.Location.Split(".")
		  If Parts.Count < 3 Then
		    Break
		    App.Log("Unknown issue path " + Issue.Location)
		    Return
		  End If
		  
		  Var ConfigSet As String = Parts(0)
		  Var ConfigName As String = Parts(1)
		  Self.ActiveConfigSet = ConfigSet
		  Self.CurrentConfigName = ConfigName
		  Self.CurrentPanel.GoToIssue(Issue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mValidator_Validating(Sender As Beacon.ProjectValidator)
		  #Pragma Unused Sender
		  
		  Var Progress As New ProgressWindow
		  Progress.Message = "Checking project for errors…"
		  Progress.Detail = "Just a moment…"
		  Progress.Show
		  Self.mValidatorProgress = Progress
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function mValidator_ValidationComplete_Common(Sender As Beacon.ProjectValidator, Results As Beacon.ProjectValidationResults, UserData As Variant) As Boolean
		  #Pragma Unused Sender
		  #Pragma Unused UserData
		  
		  Self.mValidator = Nil
		  If (Self.mValidatorProgress Is Nil) = False Then
		    Self.mValidatorProgress.Close
		    Self.mValidatorProgress = Nil
		  End If
		  
		  If Results.Count > 0 Then
		    Var Dialog As New ResolveIssuesDialog(Results)
		    AddHandler Dialog.GoToIssue, WeakAddressOf mValidationResultsDialog_GoToIssue
		    Dialog.Show(Self)
		    Self.mValidationResultsDialog = New WeakRef(Dialog)
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mValidator_ValidationComplete_Deploy(Sender As Beacon.ProjectValidator, Results As Beacon.ProjectValidationResults, UserData As Variant)
		  If Self.mValidator_ValidationComplete_Common(Sender, Results, UserData) = False Then
		    Return
		  End If
		  
		  Var Settings As Beacon.DeploySettings
		  Try
		    Settings = UserData
		  Catch Err As RuntimeException
		    App.Log(Err, CurrentMethodName, "Casting UserData into PreselectServers")
		  End Try
		  Var Win As DeployManager = New DeployManager(Self.Controller, Settings)
		  Self.mDeployWindow = New WeakRef(Win)
		  Win.BringToFront()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mValidator_ValidationComplete_Export(Sender As Beacon.ProjectValidator, Results As Beacon.ProjectValidationResults, UserData As Variant)
		  If Self.mValidator_ValidationComplete_Common(Sender, Results, UserData) = False Then
		    Return
		  End If
		  
		  ArkExportWindow.Present(Self, Self.Project, Keyboard.AsyncOptionKey And Keyboard.AsyncShiftKey)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ObservedValueChanged(Source As ObservationKit.Observable, Key As String, OldValue As Variant, NewValue As Variant)
		  // Part of the ObservationKit.Observer interface.
		  
		  Select Case Key
		  Case "MinimumWidth", "MinimumHeight"
		    Self.UpdateMinimumDimensions()
		  Else
		    Super.ObservedValueChanged(Source, Key, OldValue, NewValue)
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Panel_ContentsChanged(Sender As ArkConfigEditor)
		  #Pragma Unused Sender
		  
		  If Self.Modified <> Self.Project.Modified Then
		    Self.Modified = Self.Project.Modified
		  End If
		  
		  If Self.mUpdateUITag <> "" Then
		    CallLater.Cancel(Self.mUpdateUITag)
		    Self.mUpdateUITag = ""
		  End If
		  
		  Self.mUpdateUITag = CallLater.Schedule(500, WeakAddressOf UpdateUI)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Project() As Ark.Project
		  Return Ark.Project(Super.Project())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadyToDeploy() As Boolean
		  If Self.Project Is Nil Or Self.Project.ServerProfileCount = 0 Then
		    Return False
		  End If
		  
		  Var Bound As Integer = Self.Project.ServerProfileCount - 1
		  For I As Integer = 0 To Bound
		    If Self.Project.ServerProfile(I) <> Nil And Self.Project.ServerProfile(I).DeployCapable Then
		      Return True
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadyToExport() As Boolean
		  Return Self.Project <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RestoreEditor(ConfigName As String)
		  Var Label As String = Language.LabelForConfig(ConfigName)
		  If Self.ShowConfirm("Are you sure you want to restore """ + Label + """ to default settings?", "Wherever possible, this will remove the config options from your file completely, restoring settings to Ark's default values. You cannot undo this action.", "Restore", "Cancel") Then
		    Var IsSelected As Boolean = Self.CurrentConfigName = ConfigName
		    
		    If IsSelected Then
		      Self.CurrentConfigName = ""
		    End If
		    
		    Self.Project.RemoveConfigGroup(ConfigName)
		    
		    Var CacheKey As String = Self.ActiveConfigSet + ":" + ConfigName
		    Self.DiscardConfigPanel(CacheKey)
		    
		    If IsSelected Then
		      Self.CurrentConfigName = ConfigName
		    End If
		    
		    Self.Modified = True
		    Self.UpdateConfigList()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ServersEditor_ShouldDeployProfiles(Sender As ServersConfigEditor, SelectedProfiles() As Beacon.ServerProfile)
		  #Pragma Unused Sender
		  Self.BeginDeploy(SelectedProfiles)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMapPicker()
		  Var Item As OmniBarItem = Self.OmniBar1.Item("MapsButton")
		  If Item Is Nil Then
		    Return
		  End If
		  
		  Var ItemRect As Rect = Self.OmniBar1.RectForItem(Item)
		  Self.ShowMapPicker(Item, ItemRect)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowMapPicker(Item As OmniBarItem, ItemRect As Rect)
		  If (Self.mMapsPopoverController Is Nil) = False And Self.mMapsPopoverController.Visible Then
		    Self.mMapsPopoverController.Dismiss(False)
		    Self.mMapsPopoverController = Nil
		    Item.Toggled = False
		    Return
		  End If
		  
		  Var Editor As New MapSelectionGrid
		  Var Controller As New PopoverController("Select Maps", Editor)
		  Editor.Mask = Self.Project.MapMask
		  Controller.Show(Self.OmniBar1, ItemRect)
		  
		  Item.Toggled = True
		  
		  AddHandler Controller.Finished, WeakAddressOf MapsPopoverController_Finished
		  Self.mMapsPopoverController = Controller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateConfigList()
		  Var Labels(), Tags() As String
		  
		  Var ActiveConfigSet As String = Self.ActiveConfigSet
		  Var IsBase As Boolean = ActiveConfigSet = Beacon.Project.BaseConfigSetName
		  If IsBase Then
		    Var PsuedoTags() As String = Array(Ark.Configs.NameMetadataPsuedo, Ark.Configs.NameAccountsPsuedo)
		    // Show everything
		    #if DeployEnabled
		      PsuedoTags.Add(Ark.Configs.NameServersPseudo)
		    #endif
		    For Each Tag As String In PsuedoTags
		      Labels.Add(Language.LabelForConfig(Tag))
		      Tags.Add(Tag)
		    Next Tag
		  End If
		  
		  Var Names() As String = Ark.Configs.AllNames
		  For Each Name As String In Names
		    Labels.Add(Language.LabelForConfig(Name))
		    Tags.Add(Name)
		  Next
		  
		  Labels.SortWith(Tags)
		  
		  Var SourceItems() As SourceListItem
		  For I As Integer = 0 To Labels.LastIndex
		    Var Item As New SourceListItem(Labels(I), Tags(I))
		    Var SupportsConfigSets As Boolean = Ark.Configs.SupportsConfigSets(Tags(I))
		    If IsBase = False And SupportsConfigSets = False Then
		      Continue
		    End If
		    Item.CanDismiss = SupportsConfigSets And Self.Project.HasConfigGroup(Tags(I)) = True And Self.Project.ConfigGroup(Tags(I)).IsImplicit = False
		    SourceItems.Add(Item)
		  Next
		  
		  Self.ConfigList.ReplaceContents(SourceItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateMinimumDimensions()
		  Self.MinimumWidth = If(Self.CurrentPanel <> Nil, Max(Self.CurrentPanel.MinimumWidth, Self.LocalMinWidth), Self.LocalMinWidth) + Self.PagePanel1.Left
		  Self.MinimumHeight = If(Self.CurrentPanel <> Nil, Max(Self.CurrentPanel.MinimumHeight, Self.LocalMinHeight), Self.LocalMinHeight) + Self.PagePanel1.Top
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUI()
		  Self.ViewTitle = Self.Controller.Name
		  Self.UpdateConfigList()
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.Project.ActiveConfigSet
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Var ConfigName As String = Self.CurrentConfigName
			  If Value <> Ark.Project.BaseConfigSetName And Ark.Configs.SupportsConfigSets(ConfigName) = False Then
			    // If switching from base and on an editor that won't exist in the desired set, switch to something else
			    ConfigName = Ark.Configs.NameLootDrops
			  End If
			  Self.CurrentConfigName = "" // To unload the current version
			  
			  Self.Project.ActiveConfigSet = Value
			  Self.ConfigSetPicker.Refresh
			  Self.UpdateConfigList
			  
			  If (Self.Project Is Nil) = False And Self.Controller.URL.Scheme <> Beacon.ProjectURL.TypeTransient Then
			    Preferences.ProjectState(Self.Project.UUID, "Config Set") = Value
			  End If
			  
			  Self.CurrentConfigName = ConfigName
			End Set
		#tag EndSetter
		ActiveConfigSet As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mCurrentConfigName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mCurrentConfigName = Value Then
			    Return
			  End If
			  
			  If (Value = Ark.Configs.NameAccountsPsuedo Or Value = Ark.Configs.NameServersPseudo Or Value = Ark.Configs.NameMetadataPsuedo) And Self.ActiveConfigSet <> Beacon.Project.BaseConfigSetName Then
			    Self.ActiveConfigSet = Beacon.Project.BaseConfigSetName
			  End If
			  
			  Self.mCurrentConfigName = Value
			  
			  Var NewPanel As ArkConfigEditor
			  Var Embed As Boolean
			  If Value.IsEmpty = False Then
			    Var CacheKey As String = Self.ActiveConfigSet + ":" + Value
			    
			    If (Self.Project Is Nil) = False And Self.Controller.URL.Scheme <> Beacon.ProjectURL.TypeTransient Then
			      Preferences.ProjectState(Self.Project.UUID, "Editor") = Value
			    End If
			    
			    Var HistoryIndex As Integer = Self.mPanelHistory.IndexOf(CacheKey)
			    If HistoryIndex > 0 Then
			      Self.mPanelHistory.RemoveAt(HistoryIndex)
			    End If
			    Self.mPanelHistory.AddAt(0, CacheKey)
			    
			    // Close older panels
			    If Self.mPanelHistory.LastIndex > 2 Then
			      For I As Integer = Self.mPanelHistory.LastIndex DownTo 3
			        Var PanelTag As String = Self.mPanelHistory(I)
			        Self.DiscardConfigPanel(PanelTag)
			      Next
			    End If
			    
			    If Self.Panels.HasKey(CacheKey) Then
			      NewPanel = Self.Panels.Value(CacheKey)
			    Else
			      Select Case Value
			      Case Ark.Configs.NameServersPseudo
			        NewPanel = New ServersConfigEditor(Self.Project)
			      Case Ark.Configs.NameAccountsPsuedo
			        NewPanel = New ArkAccountsEditor(Self.Project)
			      Case Ark.Configs.NameMetadataPsuedo
			        NewPanel = New ArkProjectSettingsEditor(Self.Project)
			      Case Ark.Configs.NameLootDrops
			        NewPanel = New ArkLootDropsEditor(Self.Project)
			      Case Ark.Configs.NameDifficulty
			        NewPanel = New ArkDifficultyEditor(Self.Project)
			      Case Ark.Configs.NameExperienceCurves
			        NewPanel = New ArkExperienceEditor(Self.Project)
			      Case Ark.Configs.NameCustomContent
			        NewPanel = New ArkCustomConfigEditor(Self.Project)
			      Case Ark.Configs.NameCraftingCosts
			        NewPanel = New ArkCraftingCostsEditor(Self.Project)
			      Case Ark.Configs.NameStackSizes
			        NewPanel = New ArkStackSizesEditor(Self.Project)
			      Case Ark.Configs.NameBreedingMultipliers
			        NewPanel = New ArkBreedingMultipliersEditor(Self.Project)
			      Case Ark.Configs.NameHarvestRates
			        NewPanel = New ArkHarvestRatesEditor(Self.Project)
			      Case Ark.Configs.NameDinoAdjustments
			        NewPanel = New ArkDinoAdjustmentsEditor(Self.Project)
			      Case Ark.Configs.NameStatMultipliers
			        NewPanel = New ArkStatMultipliersEditor(Self.Project)
			      Case Ark.Configs.NameDayCycle
			        NewPanel = New ArkDayCycleEditor(Self.Project)
			      Case Ark.Configs.NameSpawnPoints
			        NewPanel = New ArkCreatureSpawnsEditor(Self.Project)
			      Case Ark.Configs.NameStatLimits
			        NewPanel = New ArkStatLimitsEditor(Self.Project)
			      Case Ark.Configs.NameEngramControl
			        NewPanel = New ArkEngramControlEditor(Self.Project)
			      Case Ark.Configs.NameSpoilTimers
			        NewPanel = New ArkSpoilTimersEditor(Self.Project)
			      Case Ark.Configs.NameOtherSettings
			        NewPanel = New ArkGeneralSettingsEditor(Self.Project)
			      End Select
			      If NewPanel <> Nil Then
			        Self.Panels.Value(CacheKey) = NewPanel
			        Embed = True
			      End If
			    End If
			  End If
			  
			  If Self.CurrentPanel = NewPanel Then
			    Return
			  End If
			  
			  If (Self.CurrentPanel Is Nil) = False Then
			    Self.CurrentPanel.SwitchedFrom()
			    Self.CurrentPanel.Visible = False
			    Self.CurrentPanel = Nil
			  End If
			  
			  Self.CurrentPanel = NewPanel
			  
			  If (Self.CurrentPanel Is Nil) = False Then
			    Var RequiresPurchase As Boolean
			    If Value.Length > 0 Then
			      RequiresPurchase = Not Ark.Configs.ConfigUnlocked(Value, App.IdentityManager.CurrentIdentity)
			    End If
			    Var TopOffset As Integer
			    If RequiresPurchase Then
			      TopOffset = (Self.OmniNoticeBanner.Top + Self.OmniNoticeBanner.Height) - Self.PagePanel1.Top
			    End If
			    If Embed Then
			      AddHandler Self.CurrentPanel.ContentsChanged, WeakAddressOf Panel_ContentsChanged
			      If Self.CurrentPanel IsA ServersConfigEditor Then
			        AddHandler ServersConfigEditor(Self.CurrentPanel).ShouldDeployProfiles, WeakAddressOf ServersEditor_ShouldDeployProfiles
			      End If
			      Self.CurrentPanel.EmbedWithinPanel(Self.PagePanel1, 1, 0, TopOffset, Self.PagePanel1.Width, Self.PagePanel1.Height - TopOffset)
			    Else
			      Self.CurrentPanel.Top = Self.PagePanel1.Top + TopOffset
			      Self.CurrentPanel.Height = Self.PagePanel1.Height - TopOffset
			    End If
			    Self.OmniNoticeBanner.Visible = RequiresPurchase
			    Self.CurrentPanel.Visible = True
			    Self.CurrentPanel.SwitchedTo()
			    Self.PagePanel1.SelectedPanelIndex = 1
			  Else
			    Self.PagePanel1.SelectedPanelIndex = 0
			  End If
			  
			  Self.ConfigList.SelectedTag = Value
			  
			  Self.UpdateMinimumDimensions()
			End Set
		#tag EndSetter
		CurrentConfigName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private CurrentPanel As ArkConfigEditor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConfigPickerMenuOrigin As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConfigPickerMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mConfigPickerMouseHover As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentConfigName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDeployWindow As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDrawOmniBannerPressed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mEditorRefs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mImportWindow As DocumentImportWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMapsPopoverController As PopoverController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModsPopoverController As PopoverController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPagesAnimation As AnimationKit.MoveTask
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPanelHistory() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpdateUITag As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValidationResultsDialog As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValidator As Beacon.ProjectValidator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValidatorProgress As ProgressWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Panels As Dictionary
	#tag EndProperty


	#tag Constant, Name = DeployEnabled, Type = Boolean, Dynamic = False, Default = \"True", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kConfigGroupClipboardType, Type = String, Dynamic = False, Default = \"com.thezaz.beacon.ark.configgroup", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LocalMinHeight, Type = Double, Dynamic = False, Default = \"400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LocalMinWidth, Type = Double, Dynamic = False, Default = \"500", Scope = Private
	#tag EndConstant

	#tag Constant, Name = OmniWarningText, Type = String, Dynamic = False, Default = \"This config type requires Beacon Omni. Click this banner to learn more.", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events OmniNoticeBanner
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma Unused Areas
		  
		  Var BaseColor As Color = SystemColors.SystemYellowColor
		  Var BackgroundColor As Color = BaseColor.AtOpacity(0.2)
		  Var TextColor As Color = SystemColors.LabelColor
		  Var BorderColor As Color = SystemColors.SeparatorColor
		  
		  G.DrawingColor = BackgroundColor
		  G.FillRectangle(0, 0, G.Width, G.Height - 1)
		  G.DrawingColor = BorderColor
		  G.DrawLine(0, G.Height - 1, G.Width, G.Height - 1)
		  
		  Var TextWidth As Double = G.TextWidth(Self.OmniWarningText)
		  Var TextLeft As Double = (G.Width - TextWidth) / 2
		  Var TextBaseline As Double = (G.Height / 2) + (G.CapHeight / 2)
		  G.DrawingColor = TextColor
		  G.DrawText(Self.OmniWarningText, TextLeft, TextBaseline, G.Width - 40, True)
		  
		  If Self.mDrawOmniBannerPressed Then
		    G.DrawingColor = &c00000080
		    G.FillRectangle(0, 0, G.Width, G.Height - 1)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  Self.mDrawOmniBannerPressed = True
		  Self.OmniNoticeBanner.Refresh
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  Var ShouldBePressed As Boolean = X >= 0 And X < Me.Width And Y >= 0 And Y < Me.Height
		  If Self.mDrawOmniBannerPressed <> ShouldBePressed Then
		    Self.mDrawOmniBannerPressed = ShouldBePressed
		    Self.OmniNoticeBanner.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Self.mDrawOmniBannerPressed = False
		  Self.OmniNoticeBanner.Refresh
		  If X >= 0 And X < Me.Width And Y >= 0 And Y < Me.Height Then
		    System.GotoURL(Beacon.WebURL("/omni"))
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OmniBar1
	#tag Event
		Sub Opening()
		  Me.Append(OmniBarItem.CreateButton("ImportButton", "Import", IconToolbarImport, "Import config files"))
		  Me.Append(OmniBarItem.CreateSpace())
		  Me.Append(OmniBarItem.CreateButton("ExportButton", "Export", IconToolbarExport, "Save new config file"))
		  
		  #if DeployEnabled
		    Me.Append(OmniBarItem.CreateButton("DeployButton", "Deploy", IconToolbarDeploy, "Make config changes live"))
		  #endif
		  
		  Me.Append(OmniBarItem.CreateSpace())
		  Me.Append(OmniBarItem.CreateButton("ShareButton", "Share", IconToolbarShare, "Share this project with other users"))
		  
		  Me.Append(OmniBarItem.CreateSeparator())
		  Me.Append(OmniBarItem.CreateButton("MapsButton", "Maps", IconToolbarMaps, "Change the maps for this project"))
		  Me.Append(OmniBarItem.CreateButton("ModsButton", "Mods", IconToolbarMods, "Enable or disable Beacon's built-in mods"))
		  Me.Append(OmniBarItem.CreateButton("ToolsButton", "Tools", IconToolbarTools, "Use convenience tools for this project"))
		End Sub
	#tag EndEvent
	#tag Event
		Sub ItemPressed(Item As OmniBarItem, ItemRect As Rect)
		  Select Case Item.Name
		  Case "ImportButton"
		    Self.BeginImport(False)
		  Case "ExportButton"
		    Self.BeginExport()
		  Case "ShareButton"
		    If Self.URL.Scheme = Beacon.ProjectURL.TypeCloud Then
		      SharingDialog.Present(Self, Self.Project)
		    ElseIf Self.URL.Scheme = Beacon.ProjectURL.TypeLocal Then
		      Self.ShowAlert("Project sharing is only available to cloud projects", "Use ""Save As…"" under the file menu to save a new copy of this project to the cloud if you would like to use Beacon's sharing features.")
		    Else
		      Self.ShowAlert("Project sharing is only available to cloud projects", "If you would like to use Beacon's sharing features, first save your project using ""Save"" under the file menu.")
		    End If
		  Case "DeployButton"
		    Self.BeginDeploy()
		  Case "MapsButton"
		    Self.ShowMapPicker(Item, ItemRect)
		  Case "ModsButton"
		    If (Self.mModsPopoverController Is Nil) = False And Self.mModsPopoverController.Visible Then
		      Self.mModsPopoverController.Dismiss(False)
		      Self.mModsPopoverController = Nil
		      Item.Toggled = False
		      Return
		    End If
		    
		    Var Editor As New ModSelectionGrid(Self.Project.ContentPacks)
		    Var Controller As New PopoverController("Select Mods", Editor)
		    Controller.Show(Me, ItemRect)
		    
		    Item.Toggled = True
		    
		    AddHandler Controller.Finished, WeakAddressOf ModsPopoverController_Finished
		    Self.mModsPopoverController = Controller
		  Case "ToolsButton"
		    Var Tools() As Ark.ProjectTool = Ark.Configs.AllTools
		    Var LastEditor As String
		    Var Base As New DesktopMenuItem
		    For Each Tool As Ark.ProjectTool In Tools
		      If Tool.FirstGroup <> LastEditor Then
		        If Base.Count > 0 Then
		          Base.AddMenu(New DesktopMenuItem(MenuItem.TextSeparator))
		        End If
		        
		        Var Header As New DesktopMenuItem(Language.LabelForConfig(Tool.FirstGroup))
		        Header.Enabled = False
		        Base.AddMenu(Header)
		        LastEditor = Tool.FirstGroup
		      End If
		      Base.AddMenu(New DesktopMenuItem(Tool.Caption, Tool))
		    Next
		    
		    Var Position As Point = Me.GlobalPosition
		    Var Choice As DesktopMenuItem = Base.PopUp(Position.X + ItemRect.Left, Position.Y + ItemRect.Bottom)
		    If Choice Is Nil Then
		      Return
		    End If
		    
		    Var Tool As Ark.ProjectTool = Choice.Tag
		    If Tool.IsRelevantForGroup(Self.CurrentConfigName) = False Then
		      Self.CurrentConfigName = Tool.FirstGroup
		    End If
		    Call Self.CurrentPanel.RunTool(Tool.UUID)
		    Self.UpdateConfigList()
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConfigList
	#tag Event
		Sub Change()
		  Var TagVar As Variant
		  If Me.SelectedRowIndex > -1 Then
		    TagVar = Me.Item(Me.SelectedRowIndex).Tag
		  End If
		  If IsNull(TagVar) = False And (TagVar.Type = Variant.TypeString Or TagVar.Type = Variant.TypeText) Then
		    Self.CurrentConfigName = TagVar.StringValue
		  Else
		    Self.CurrentConfigName = ""
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Self.UpdateConfigList()
		End Sub
	#tag EndEvent
	#tag Event
		Function ShouldChange(DesiredIndex As Integer) As Boolean
		  #Pragma Unused DesiredIndex
		  
		  Var CurrentItem As SourceListItem = Me.SelectedItem
		  If (CurrentItem Is Nil) = False Then
		    Try
		      Var GroupName As String = CurrentItem.Tag
		      CurrentItem.CanDismiss = Self.Project.HasConfigGroup(GroupName) = True And Self.Project.ConfigGroup(GroupName).IsImplicit = False
		    Catch Err As RuntimeException
		    End Try
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub DismissPressed(Item As SourceListItem, ItemIndex As Integer, ItemRect As Rect)
		  #Pragma Unused ItemIndex
		  #Pragma Unused ItemRect
		  
		  Self.RestoreEditor(Item.Tag)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ContextualClick(MouseX As Integer, MouseY As Integer, ItemIndex As Integer, ItemRect As Rect)
		  Const RestoreTag = "b4d7f3d8-17f2-425f-8ab8-9032d558b29d"
		  Const CopyTag = "a0b7a0ee-518a-4ee8-a33c-5c8e46ba570f"
		  Const PasteTag = "31f1decc-7706-4baf-af11-f4d4fdde799d"
		  
		  Var Item As SourceListItem
		  Var ConfigName As String
		  Var Config As Ark.ConfigGroup
		  If ItemIndex > -1 Then
		    Item = Me.Item(ItemIndex)
		    ConfigName = Item.Tag
		    Config = Self.Project.ConfigGroup(ConfigName, False)
		  End If
		  
		  Var Base As New DesktopMenuItem
		  Var CopyItem As New DesktopMenuItem("Copy", CopyTag)
		  CopyItem.Enabled = (ItemIndex > -1) And (Config Is Nil) = False And Config.IsImplicit = False
		  Base.AddMenu(CopyItem)
		  Var Board As New Clipboard
		  Var PasteItem As New DesktopMenuItem("Paste", PasteTag)
		  PasteItem.Enabled = Board.RawDataAvailable(Self.kConfigGroupClipboardType) And (ItemIndex = -1 Or Board.RawData(Self.kConfigGroupClipboardType).IndexOf("""GroupName"":""" + ConfigName + """") > -1)
		  Base.AddMenu(PasteItem)
		  
		  If ItemIndex > -1 Then
		    Base.AddMenu(New DesktopMenuItem(MenuItem.TextSeparator))
		    Var Tools() As Ark.ProjectTool = Ark.Configs.AllTools
		    For Each Tool As Ark.ProjectTool In Tools
		      If Tool.IsRelevantForGroup(ConfigName) Then
		        Base.AddMenu(New DesktopMenuItem(Tool.Caption, Tool.UUID))
		      End If
		    Next
		    If Base.Count > 0 Then
		      Base.AddMenu(New DesktopMenuItem(MenuItem.TextSeparator))
		    End If
		    Base.AddMenu(New DesktopMenuItem("Restore """ + Item.Caption + """ to Default", RestoreTag))
		  End If
		  
		  Var Position As Point = Me.GlobalPosition
		  Var Choice As DesktopMenuItem
		  If ItemRect Is Nil Then
		    Choice = Base.PopUp(Position.X + MouseX, Position.Y + MouseY)
		  Else
		    Choice = Base.PopUp(Position.X + ItemRect.Left, Position.Y + ItemRect.Bottom)
		  End If
		  If Choice Is Nil Then
		    Return
		  End If
		  
		  Select Case Choice.Tag
		  Case RestoreTag
		    Self.RestoreEditor(ConfigName)
		  Case CopyTag
		    If (Config Is Nil) = False Then
		      Var SaveData As New Dictionary
		      SaveData.Value("GroupName") = ConfigName
		      SaveData.Value("SaveData") = Config.SaveData()
		      Var JSON As String = Beacon.GenerateJSON(SaveData, False)
		      Board.RawData(Self.kConfigGroupClipboardType) = JSON
		    End If
		  Case PasteTag
		    Try
		      Var Parsed As Dictionary = Beacon.ParseJSON(Board.RawData(Self.kConfigGroupClipboardType))
		      Var NewConfigName As String = Parsed.Value("GroupName")
		      Var NewConfigData As Dictionary = Parsed.Value("SaveData")
		      Var NewConfig As Ark.ConfigGroup = Ark.Configs.CreateInstance(NewConfigName, NewConfigData, Nil)
		      Self.Project.AddConfigGroup(NewConfig)
		      Self.UpdateConfigList()
		      Self.Modified = Self.Project.Modified
		      
		      If Me.SelectedRowIndex = ItemIndex Or (ItemIndex = -1 And Me.SelectedRowIndex > -1 And Me.Item(Me.SelectedRowIndex).Tag = NewConfigName) Then
		        // Refresh
		        Self.CurrentConfigName = ""
		        Self.CurrentConfigName = NewConfigName
		      End If
		    Catch Err As RuntimeException
		      App.Log(Err, CurrentMethodName, "Working with pasted data")
		      App.Log("Pasted data: " + EncodeBase64(Board.RawData(Self.kConfigGroupClipboardType), 0))
		      Self.ShowAlert("Beacon was unable to complete the paste.", "The error was '" + Err.Message + "'. More data may be available in the log files.")
		    End Try
		  Else
		    If Me.SelectedRowIndex <> ItemIndex Then
		      Me.SelectedRowIndex = ItemIndex
		    End If
		    
		    Call Self.CurrentPanel.RunTool(Choice.Tag)
		    Self.UpdateConfigList()
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConfigSetPicker
	#tag Event
		Sub Paint(G As Graphics, Areas() As Rect, Highlighted As Boolean, SafeArea As Rect)
		  #Pragma Unused Areas
		  #Pragma Unused SafeArea
		  
		  Var Caption As String = "Config Set: " + Self.ActiveConfigSet
		  Var CaptionBaseline As Double = (G.Height / 2) + (G.CapHeight / 2)
		  Var CaptionLeft As Double = G.Height - CaptionBaseline
		  
		  Var DropdownLeft As Double = G.Width - (CaptionLeft + 8)
		  Var DropdownTop As Double = (G.Height - 4) / 2
		  
		  Var Path As New GraphicsPath
		  Path.MoveToPoint(NearestMultiple(DropdownLeft, G.ScaleX), NearestMultiple(DropdownTop, G.ScaleY))
		  Path.AddLineToPoint(NearestMultiple(DropdownLeft + 2, G.ScaleX), NearestMultiple(DropdownTop, G.ScaleY))
		  Path.AddLineToPoint(NearestMultiple(DropdownLeft + 4, G.ScaleX), NearestMultiple(DropdownTop + 2, G.ScaleY))
		  Path.AddLineToPoint(NearestMultiple(DropdownLeft + 6, G.ScaleX), NearestMultiple(DropdownTop, G.ScaleY))
		  Path.AddLineToPoint(NearestMultiple(DropdownLeft + 8, G.ScaleX), NearestMultiple(DropdownTop, G.ScaleY))
		  Path.AddLineToPoint(NearestMultiple(DropdownLeft + 4, G.ScaleX), NearestMultiple(DropdownTop + 4, G.ScaleY))
		  
		  If Self.mConfigPickerMouseHover And Highlighted Then
		    G.DrawingColor = SystemColors.ControlAccentColor
		  Else
		    G.DrawingColor = SystemColors.LabelColor
		  End If
		  
		  G.DrawText(Caption, NearestMultiple(CaptionLeft, G.ScaleX), NearestMultiple(CaptionBaseline, G.ScaleY), NearestMultiple(G.Width - ((CaptionLeft * 3) + 8), G.ScaleX), True)
		  G.FillPath(Path)
		  
		  If Self.mConfigPickerMouseDown Then
		    G.DrawingColor = &c000000A5
		    G.FillRectangle(0, 0, G.Width, G.Height)
		  End If
		  
		  Self.mConfigPickerMenuOrigin = New Point(CaptionLeft, CaptionBaseline)
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  If Self.mConfigPickerMouseDown = False Then
		    Self.mConfigPickerMouseDown = True
		    Me.Refresh
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Var Pressed As Boolean = (X >= 0 And Y >= 0 And X <= Me.Width And Y <= Me.Height)
		  If Self.mConfigPickerMouseDown <> Pressed Then
		    Self.mConfigPickerMouseDown = Pressed
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  If Self.mConfigPickerMouseHover = False Then
		    Self.mConfigPickerMouseHover = True
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  If Self.mConfigPickerMouseHover = True Then
		    Self.mConfigPickerMouseHover = False
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  If Self.mConfigPickerMouseHover = False Then
		    Self.mConfigPickerMouseHover = True
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Var Pressed As Boolean = (X >= 0 And Y >= 0 And X <= Me.Width And Y <= Me.Height)
		  If Pressed Then
		    Call CallLater.Schedule(10, WeakAddressOf HandleConfigPickerClick)
		  End If
		  If Self.mConfigPickerMouseDown = True Or Self.mConfigPickerMouseHover <> Pressed Then
		    Self.mConfigPickerMouseDown = False
		    Self.mConfigPickerMouseHover = Pressed
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Modified"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
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
		Name="IsFrontmost"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ViewTitle"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ViewIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Progress"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
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
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
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
		InitialValue=""
		Type="Integer"
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
		Name="LockLeft"
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
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
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
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="TabStop"
		Visible=true
		Group="Position"
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
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
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentConfigName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ActiveConfigSet"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
