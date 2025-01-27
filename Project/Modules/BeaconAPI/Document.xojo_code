#tag Class
Protected Class Document
	#tag Method, Flags = &h0
		Function ConsoleSafe() As Boolean
		  Return Self.mConsoleSafe
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Source As Dictionary)
		  Self.mDescription = Source.Value("description")
		  Self.mDocumentID = Source.Value("project_id")
		  Self.mDownloadCount = Source.Value("download_count")
		  Self.mLastUpdated = NewDateFromSQLDateTime(Source.Value("last_updated"))
		  Self.mName = Source.Value("name")
		  Self.mResourceURL = Source.Value("resource_url")
		  Self.mRevision = Source.Value("revision")
		  Self.mUserID = Source.Value("user_id")
		  Self.mMapMask = Source.Value("map_mask")
		  Self.mConsoleSafe = Source.Value("console_safe")
		  Self.mIsGuest = Source.Value("user_id") <> Source.Value("owner_id")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description() As String
		  Return Self.mDescription
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DocumentID() As String
		  Return Self.mDocumentID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DownloadCount() As UInteger
		  Return Self.mDownloadCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsGuest() As Boolean
		  Return Self.mIsGuest
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastUpdated(InTimeZone As TimeZone = Nil) As DateTime
		  If InTimeZone Is Nil Or Self.mLastUpdated Is Nil Then
		    Return Self.mLastUpdated
		  Else
		    Return New DateTime(Self.mLastUpdated.SecondsFrom1970, InTimeZone)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MapMask() As UInt64
		  Return Self.mMapMask
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  Return Self.mName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(Other As BeaconAPI.Document) As Integer
		  If Other = Nil Then
		    Return 1
		  End If
		  
		  Return Self.mDocumentID.Compare(Other.mDocumentID, ComparisonOptions.CaseSensitive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceURL() As String
		  Return Self.mResourceURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Revision() As UInteger
		  Return Self.mRevision
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserID() As String
		  Return Self.mUserID
		End Function
	#tag EndMethod


	#tag Note, Name = Beacon.Document
		Yes, they are different. An BeaconAPI.Document is metadata, no content, and includes stats.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mConsoleSafe As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDescription As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDocumentID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadCount As UInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsGuest As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastUpdated As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMapMask As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResourceURL As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRevision As UInteger
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserID As String
	#tag EndProperty


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Class
#tag EndClass
