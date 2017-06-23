#tag Class
Protected Class MutableEngram
Inherits Beacon.Engram
	#tag Method, Flags = &h0
		Sub Availability(Assigns Value As UInteger)
		  Self.mAvailability = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CanBeBlueprint(Assigns Value As Boolean)
		  Self.mCanBeBlueprint = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Path As Text)
		  Super.Constructor()
		  
		  Self.mPath = Path
		  Self.mIsValid = Self.mPath.Length > 6 And Self.mPath.Left(6) = "/Game/"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Label(Assigns Value As Text)
		  Self.mLabel = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Path(Assigns Value As Text)
		  Self.mPath = Value
		  Self.mIsValid = Self.mPath.Length > 6 And Self.mPath.Left(6) = "/Game/"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValidForMap(Map As Beacon.Map, Assigns Value As Boolean)
		  If Value Then
		    Self.mAvailability = Self.mAvailability Or Map.Mask
		  Else
		    Self.mAvailability = Self.mAvailability And Not Map.Mask
		  End If
		End Sub
	#tag EndMethod


End Class
#tag EndClass
