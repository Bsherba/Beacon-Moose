#tag Class
Protected Class FTPServerProfile
Inherits Ark.ServerProfile
	#tag Event
		Sub ReadFromDictionary(Dict As Dictionary)
		  If Not Dict.HasAllKeys("Host", "Port", "User", "Pass", "Game.ini Path", "GameUserSettings.ini Path") Then
		    Var Err As KeyNotFoundException
		    Err.Message = "Missing FTPServerProfile keys"
		    Raise Err
		  End If
		  
		  Self.mHost = Dict.Value("Host")
		  Self.mPort = Dict.Value("Port")
		  Self.mUsername = Dict.Value("User")
		  Self.mPassword = Dict.Value("Pass")
		  Self.mGameIniPath = Dict.Value("Game.ini Path")
		  Self.mGameUserSettingsIniPath = Dict.Value("GameUserSettings.ini Path")
		  Self.mMode = Dict.Lookup("Mode", Beacon.FTPModeOptionalTLS)
		  Self.mMask = Dict.Lookup("Mask", 0)
		  Self.mVerifyHost = Dict.Lookup("Verify Host", True)
		  Self.mPrivateKey = Dict.Lookup("Private Key", "")
		End Sub
	#tag EndEvent

	#tag Event
		Sub WriteToDictionary(Dict As Dictionary)
		  Dict.Value("Provider") = "FTP"
		  Dict.Value("Host") = Self.mHost
		  Dict.Value("Port") = Self.mPort
		  Dict.Value("User") = Self.mUsername
		  Dict.Value("Pass") = Self.mPassword
		  Dict.Value("Game.ini Path") = Self.mGameIniPath
		  Dict.Value("GameUserSettings.ini Path") = Self.mGameUserSettingsIniPath
		  Dict.Value("Mode") = Self.mMode
		  Dict.Value("Mask") = Self.mMask
		  Dict.Value("Verify Host") = Self.mVerifyHost
		  
		  If Self.mPrivateKey.IsEmpty = False Then
		    Dict.Value("Private Key") = Self.mPrivateKey
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AsFormData() As Dictionary
		  Var Fields As New Dictionary
		  Fields.Value("host") = Self.Host
		  Fields.Value("port") = Self.Port.ToString
		  Fields.Value("user") = Self.Username
		  Fields.Value("pass") = Self.Password
		  Fields.Value("mode") = Self.Mode
		  Return Fields
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Do not call Super.Constructor()
		  Self.mMode = Beacon.FTPModeOptionalTLS
		  Self.mPort = 21
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Profile As Ark.FTPServerProfile)
		  Self.GameIniPath = Profile.GameIniPath
		  Self.GameUserSettingsIniPath = Profile.GameUserSettingsIniPath
		  Self.Host = Profile.Host
		  Self.Mode = Profile.Mode
		  Self.Password = Profile.Password
		  Self.Port = Profile.Port
		  Self.Username = Profile.Username
		  Self.VerifyHost = Profile.VerifyHost
		  Self.PrivateKeyFile = Profile.PrivateKeyFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeployCapable() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mask() As UInt64
		  Return Self.mMask
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Mask(Assigns Value As UInt64)
		  If Self.mMask <> Value Then
		    Self.mMask = Value
		    Self.Modified = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(Other As Ark.ServerProfile) As Integer
		  If Other = Nil Then
		    Return 1
		  End If
		  
		  If Not (Other IsA Ark.FTPServerProfile) Then
		    Return Super.Operator_Compare(Other)
		  End If
		  
		  Return Self.ServerID.Compare(Ark.FTPServerProfile(Other).ServerID, ComparisonOptions.CaseSensitive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareKeyFile()
		  If (Self.mPrivateKeyFile Is Nil) = False Or Self.mPrivateKey.IsEmpty Then
		    Return
		  End If
		  
		  If Self.IsPrivateKeyInternal Then
		    // Plain key
		    Var KeysFolder As FolderItem = App.ApplicationSupport.Child("Private Keys")
		    If KeysFolder.Exists = False Then
		      Var Permissions As New Permissions(&o700)
		      Permissions.GidBit = False
		      Permissions.StickyBit = False
		      Permissions.UidBit = False
		      
		      KeysFolder.CreateFolder
		      KeysFolder.Permissions = Permissions
		    End If
		    
		    Var KeyId As String = Beacon.UUID.v5(Self.mPrivateKey, "b763e1c2-809e-45c7-bce4-1d3a7a07ec1f")
		    
		    Self.mPrivateKeyFile = KeysFolder.Child(KeyId)
		    
		    If Self.mPrivateKeyFile.Exists = False Then
		      Call Self.mPrivateKeyFile.Write(Self.mPrivateKey)
		    End If
		  Else
		    // File reference
		    Self.mPrivateKeyFile = BookmarkedFolderItem.FromSaveInfo(Beacon.Decompress(DecodeBase64(Self.mPrivateKey)), True)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateKeyFile() As FolderItem
		  Self.PrepareKeyFile()
		  Return Self.mPrivateKeyFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrivateKeyFile(Assigns PrivateKey As String)
		  Self.mPrivateKey = PrivateKey
		  Self.mPrivateKeyFile = Nil
		  Self.Modified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrivateKeyFile(Internalize As Boolean = False, Assigns PrivateKey As FolderItem)
		  If PrivateKey Is Nil Or PrivateKey.Exists = False Or PrivateKey.IsFolder Then
		    Self.mPrivateKey = ""
		    Self.mPrivateKeyFile = Nil
		    Self.Modified = True
		    Return
		  End If
		  
		  If Internalize Then
		    Self.PrivateKeyFile = PrivateKey.Read(Encodings.UTF8)
		    Return
		  End If
		  
		  Var BookmarkedPrivateKey As New BookmarkedFolderItem(PrivateKey)
		  Self.mPrivateKey = EncodeBase64(Beacon.Compress(BookmarkedPrivateKey.SaveInfo(True)), 0)
		  Self.mPrivateKeyFile = BookmarkedPrivateKey
		  Self.Modified = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SecondaryName() As String
		  Return Self.Username + "@" + Self.Host + ":" + Self.Port.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ServerID() As String
		  Return Self.mUsername.Lowercase + "@" + Self.mHost.Lowercase + If(Self.mGameIniPath.BeginsWith("/"), "", "/") + Self.mGameIniPath
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mGameIniPath
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mGameIniPath.Compare(Value, ComparisonOptions.CaseSensitive) <> 0 Then
			    Self.mGameIniPath = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		GameIniPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mGameUserSettingsIniPath
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mGameUserSettingsIniPath.Compare(Value, ComparisonOptions.CaseSensitive) <> 0 Then
			    Self.mGameUserSettingsIniPath = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		GameUserSettingsIniPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mHost
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mHost.Compare(Value, ComparisonOptions.CaseSensitive) <> 0 Then
			    Self.mHost = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		Host As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mPrivateKey.BeginsWith("---")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value = Self.IsPrivateKeyInternal Then
			    Return
			  End If
			  
			  Var PrivateKeyFile As FolderItem = Self.PrivateKeyFile
			  If PrivateKeyFile Is Nil Then
			    Return
			  End If
			  
			  Self.PrivateKeyFile(Value) = PrivateKeyFile
			End Set
		#tag EndSetter
		IsPrivateKeyInternal As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGameIniPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGameUserSettingsIniPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHost As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMask As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMode As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Select Case Value
			  Case Beacon.FTPModeOptionalTLS, Beacon.FTPModeExplicitTLS, Beacon.FTPModeSSH, Beacon.FTPModeImplicitTLS, Beacon.FTPModeInsecure
			    // Whitelist
			  Else
			    Value = Beacon.FTPModeOptionalTLS
			  End Select
			  
			  If Self.mMode.Compare(Value, ComparisonOptions.CaseSensitive) = 0 Then
			    Return
			  End If
			  
			  Self.mMode = Value
			  Self.Modified = True
			End Set
		#tag EndSetter
		Mode As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mPassword As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPort As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrivateKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrivateKeyFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUsername As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVerifyHost As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mPassword
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mPassword.Compare(Value, ComparisonOptions.CaseSensitive) <> 0 Then
			    Self.mPassword = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		Password As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Self.mPort = 0 Then
			    Self.mPort = 21
			  End If
			  Return Self.mPort
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value = 0 Then
			    Value = 21
			  End If
			  If Self.mPort <> Value Then
			    Self.mPort = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mUsername
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mUsername.Compare(Value, ComparisonOptions.CaseSensitive) <> 0 Then
			    Self.mUsername = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Self.mVerifyHost
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Self.mVerifyHost <> Value Then
			    Self.mVerifyHost = Value
			    Self.Modified = True
			  End If
			End Set
		#tag EndSetter
		VerifyHost As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Mask"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProfileColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Beacon.ServerProfile.Colors"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - Blue"
				"2 - Brown"
				"3 - Grey"
				"4 - Green"
				"5 - Indigo"
				"6 - Orange"
				"7 - Pink"
				"8 - Purple"
				"9 - Red"
				"10 - Teal"
				"11 - Yellow"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AdminNotes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackupFolderName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageDuration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConsole"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Modified"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GameIniPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GameUserSettingsIniPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Name="Password"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerifyHost"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPrivateKeyInternal"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
