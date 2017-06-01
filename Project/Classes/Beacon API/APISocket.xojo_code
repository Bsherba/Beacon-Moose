#tag Class
Protected Class APISocket
	#tag Method, Flags = &h1
		Protected Sub AdvanceQueue()
		  If UBound(Self.Queue) = -1 Then
		    Self.Working = False
		    Return
		  End If
		  
		  Dim Request As APIRequest = Self.Queue(0)
		  Self.Queue.Remove(0)
		  
		  System.DebugLog(Request.CommandLineVersion)
		  
		  Self.ActiveRequest = Request
		  
		  If Request.Method = "GET" Then
		    Dim URL As Text = Request.URL
		    Dim Query As Text = Request.Query
		    If Query <> "" Then
		      URL = URL + "?" + Query
		    End If
		    Self.Socket.Send("GET", URL)
		  Else
		    Self.Socket.SetRequestContent(Request.Payload, Request.ContentType)
		    Self.Socket.Send(Request.Method, Request.URL)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.Socket = New Xojo.Net.HTTPSocket
		  Self.Socket.ValidateCertificates = True
		  AddHandler Self.Socket.Error, WeakAddressOf Socket_Error
		  AddHandler Self.Socket.PageReceived, WeakAddressOf Socket_PageReceived
		  AddHandler Self.Socket.AuthenticationRequired, WeakAddressOf Socket_AuthenticationRequired
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Xojo.Core.Timer.CancelCall(WeakAddressOf Self.AdvanceQueue)
		  
		  Self.Socket.Disconnect
		  Self.Socket = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Socket_AuthenticationRequired(Sender As Xojo.Net.HTTPSocket, Realm As Text, ByRef Name As Text, ByRef Password As Text) As Boolean
		  #Pragma Unused Sender
		  #Pragma Unused Realm
		  
		  If Self.ActiveRequest.AuthCount = 0 Then
		    Name = Self.ActiveRequest.AuthUser
		    Password = Self.ActiveRequest.AuthPassword
		    Self.ActiveRequest.AuthCount = Self.ActiveRequest.AuthCount + 1
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Socket_Error(Sender As Xojo.Net.HTTPSocket, Err As RuntimeException)
		  #Pragma Unused Sender
		  
		  Self.ActiveRequest.InvokeCallback(False, Err.Reason, Nil)
		  Self.ActiveRequest = Nil
		  Xojo.Core.Timer.CallLater(1, WeakAddressOf Self.AdvanceQueue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Socket_PageReceived(Sender As Xojo.Net.HTTPSocket, URL As Text, HTTPStatus As Integer, Content As Xojo.Core.MemoryBlock)
		  #Pragma Unused Sender
		  #Pragma Unused URL
		  #Pragma Unused HTTPStatus
		  
		  Try
		    Dim Reply As Xojo.Core.Dictionary = Xojo.Data.ParseJSON(Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Content))
		    Dim Success As Boolean = Reply.Value("status") = "success"
		    Dim Message As Text
		    Dim Details As Auto = Reply.Value("details")
		    If Not Success Then
		      Message = Reply.Value("message")
		    End If
		    Self.ActiveRequest.InvokeCallback(Success, Message, Details)
		  Catch Err As RuntimeException
		    Self.ActiveRequest.InvokeCallback(False, "Unhandled Exception", Nil)
		  End Try
		  Self.ActiveRequest = Nil
		  Xojo.Core.Timer.CallLater(1, WeakAddressOf Self.AdvanceQueue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start(Request As APIRequest)
		  Self.Queue.Append(Request)
		  If UBound(Self.Queue) = 0 Then
		    Xojo.Core.Timer.CallLater(1, WeakAddressOf Self.AdvanceQueue)
		    Self.Working = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Working() As Boolean
		  Return Self.mWorking
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Working(Assigns Value As Boolean)
		  If Self.mWorking = Value Then
		    Return
		  End If
		  
		  Self.mWorking = Value
		  If Self.mWorking Then
		    RaiseEvent WorkStarted
		  Else
		    RaiseEvent WorkCompleted
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event WorkCompleted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WorkStarted()
	#tag EndHook


	#tag Property, Flags = &h21
		Private ActiveRequest As APIRequest
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorking As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Queue() As APIRequest
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Socket As Xojo.Net.HTTPSocket
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
