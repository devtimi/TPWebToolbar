#tag Class
Protected Class TPWebToolbar
Inherits WebToolbar
	#tag Event
		Sub Shown()
		  ExecuteJavaScript(kToolbarFixJS)
		  
		  mbShown = true
		  
		  RaiseEvent Shown
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPointer(oTarget as WebToolbarButton)
		  // Prevent not shown errors
		  if mbShown = false then return
		  
		  dim sID as String = GenerateIdentifier(oTarget)
		  dim sJS as String = ReplaceAll(kAddStyleJS, "%identifier%", sID)
		  ExecuteJavaScript(sJS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateIdentifier(oTarget as WebToolbarButton) As String
		  dim sID as String = me.ControlID + "_" + oTarget.Name
		  return sID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePointer(oTarget as WebToolbarButton)
		  // Prevent not shown errors
		  if mbShown = false then return
		  
		  dim sID as String = GenerateIdentifier(oTarget)
		  dim sJS as String = ReplaceAll(kRemoveStyleJS, "%identifier%", sID)
		  ExecuteJavaScript(sJS)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Shown()
	#tag EndHook


	#tag Note, Name = About
		
		TPWebToolbar
		
		WebToolbar subclass that can add a pointer to individual buttons
		
		https://github.com/devtimi/TPWebToolbar
	#tag EndNote


	#tag Property, Flags = &h21
		Private mbShown As Boolean
	#tag EndProperty


	#tag Constant, Name = kAddStyleJS, Type = String, Dynamic = False, Default = \"var element \x3D document.getElementById(\"%identifier%\");\nelement.classList.add(\"TPToolbarPointer\");", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRemoveStyleJS, Type = String, Dynamic = False, Default = \"var element \x3D document.getElementById(\"%identifier%\");\nelement.classList.remove(\"TPToolbarPointer\");", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kToolbarFixJS, Type = String, Dynamic = False, Default = \"var sheet \x3D window.document.styleSheets[0];\nsheet.insertRule(\'.TPToolbarPointer {cursor: pointer}\'\x2C sheet.cssRules.length);", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow Northeast"
				"12 - Arrow Northwest"
				"13 - Arrow Southeast"
				"14 - Arrow Southwest"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="55"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="TabOrder"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Vertical"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="600"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_DeclareLineRendered"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpenEventFired"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
