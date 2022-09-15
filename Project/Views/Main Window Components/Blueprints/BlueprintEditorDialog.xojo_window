#tag Window
Begin BeaconDialog BlueprintEditorDialog
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   1
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   500
   ImplicitInstance=   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   408
   MinimumWidth    =   540
   Resizeable      =   True
   Title           =   "New Blueprint"
   Type            =   8
   Visible         =   True
   Width           =   540
   Begin PagePanel Pages
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   405
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   6
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   38
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   540
      Begin MapSelectionGrid MapSelector
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   False
         AllowTabs       =   True
         Backdrop        =   0
         BackgroundColor =   &cFFFFFF00
         DesiredHeight   =   0
         DesiredWidth    =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackgroundColor=   False
         Height          =   243
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Left            =   146
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   186
         Transparent     =   True
         Visible         =   True
         Width           =   380
      End
      Begin UITweaks.ResizedTextField TagsField
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   152
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   158
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   368
      End
      Begin UITweaks.ResizedTextField NameField
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   152
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   368
      End
      Begin UITweaks.ResizedPopupMenu TypeMenu
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         InitialValue    =   "Engram\nCreature\nSpawn Point\nLoot Drop"
         Italic          =   False
         Left            =   152
         ListIndex       =   -1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   159
      End
      Begin UITweaks.ResizedTextField PathField
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   152
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   90
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   368
      End
      Begin UITweaks.ResizedLabel TagsLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Tags:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   158
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin UITweaks.ResizedLabel MapLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Map Availability:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   192
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin UITweaks.ResizedLabel NameLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Name:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin UITweaks.ResizedLabel PathLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Blueprint Path:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   90
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin UITweaks.ResizedLabel TypeLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Type:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   120
      End
      Begin UITweaks.ResizedTextField EngramEntryStringField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   196
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   324
      End
      Begin UITweaks.ResizedTextField EngramPlayerLevelField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   196
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedTextField EngramRequiredPointsField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   196
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedTextField EngramStackSizeField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   196
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPushButton EngramAddIngredient
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Add"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   196
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPushButton EngramEditIngredientButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Edit"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   288
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedLabel EngramEntryStringLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Value           =   "Entry String:"
         Visible         =   True
         Width           =   164
      End
      Begin UITweaks.ResizedLabel EngramPlayerLevelLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         Value           =   "Unlockable At Level:"
         Visible         =   True
         Width           =   164
      End
      Begin UITweaks.ResizedLabel EngramRequiredPointsLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         Value           =   "Required Engram Points:"
         Visible         =   True
         Width           =   164
      End
      Begin UITweaks.ResizedLabel EngramStackSizeLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         Value           =   "Stack Size:"
         Visible         =   True
         Width           =   164
      End
      Begin UITweaks.ResizedLabel EngramCraftingCostLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   194
         Transparent     =   False
         Underline       =   False
         Value           =   "Crafting Recipe:"
         Visible         =   True
         Width           =   164
      End
      Begin UITweaks.ResizedPushButton EngramRemoveIngredientButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Remove"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   380
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedTextField CreatureIncubationTimeField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   163
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   212
      End
      Begin UITweaks.ResizedLabel CreatureIncubationTimeLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Value           =   "Incubation Time:"
         Visible         =   True
         Width           =   131
      End
      Begin UITweaks.ResizedTextField CreatureMatureTimeField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   163
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   212
      End
      Begin UITweaks.ResizedLabel CreatureMatureTimeLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         Value           =   "Mature Time:"
         Visible         =   True
         Width           =   131
      End
      Begin UITweaks.ResizedTextField CreatureIntervalMinTimeField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   163
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   212
      End
      Begin UITweaks.ResizedLabel CreatureIntervalMinTimeLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         Value           =   "Mating Interval Min:"
         Visible         =   True
         Width           =   131
      End
      Begin UITweaks.ResizedTextField CreatureIntervalMaxTimeField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   163
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   ""
         Visible         =   True
         Width           =   212
      End
      Begin UITweaks.ResizedLabel CreatureIntervalMaxTimeLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Transparent     =   False
         Underline       =   False
         Value           =   "Mating Interval Max:"
         Visible         =   True
         Width           =   131
      End
      Begin UITweaks.ResizedPushButton CreatureAddStatButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Define Stat"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   94
      End
      Begin UITweaks.ResizedPushButton CreatureEditStatButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Edit"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   126
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPushButton CreatureDeleteStatButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Remove"
         Default         =   False
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   218
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   401
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin BeaconListbox EngramCraftingCostList
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowInfiniteScroll=   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   3
         ColumnWidths    =   "*,75,75"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         DefaultSortColumn=   0
         DefaultSortDirection=   0
         DropIndicatorVisible=   False
         EditCaption     =   "Edit Quantity"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   0
         GridLinesVerticalStyle=   0
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   195
         Index           =   -2147483648
         InitialParent   =   "Pages"
         InitialValue    =   "Ingredient	Quantity	No Subst."
         Italic          =   False
         Left            =   196
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PreferencesKey  =   ""
         RequiresSelection=   False
         RowSelectionType=   1
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   194
         Transparent     =   False
         TypeaheadColumn =   0
         Underline       =   False
         Visible         =   True
         VisibleRowCount =   0
         Width           =   324
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin BeaconListbox CreatureStatsList
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowInfiniteScroll=   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   6
         ColumnWidths    =   "*,70,70,70,70,70"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         DefaultSortColumn=   0
         DefaultSortDirection=   0
         DropIndicatorVisible=   False
         EditCaption     =   "Edit"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   0
         GridLinesVerticalStyle=   0
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   0
         Height          =   195
         Index           =   -2147483648
         InitialParent   =   "Pages"
         InitialValue    =   "Stat	Base	Wild	Tamed	Add	Affinity"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PreferencesKey  =   ""
         RequiresSelection=   False
         RowSelectionType=   1
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   3
         TabStop         =   True
         Tooltip         =   ""
         Top             =   194
         Transparent     =   False
         TypeaheadColumn =   0
         Underline       =   False
         Visible         =   True
         VisibleRowCount =   0
         Width           =   500
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin ArkSpawnPointEditor SpawnPointEditor1
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
         Height          =   405
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         Tooltip         =   ""
         Top             =   38
         Transparent     =   False
         Visible         =   True
         Width           =   540
      End
      Begin RangeField LootMinMultiplierField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         DoubleValue     =   0.0
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "1.0"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   80
      End
      Begin RangeField LootMaxMultiplierField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         DoubleValue     =   0.0
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "1.0"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedPopupMenu LootIconColorMenu
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         InitialValue    =   ""
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         SelectedRowIndex=   0
         TabIndex        =   7
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   158
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   155
      End
      Begin UITweaks.ResizedPopupMenu LootIconMenu
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         InitialValue    =   ""
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         SelectedRowIndex=   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   155
      End
      Begin CheckBox LootExperimentalCheckbox
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Experimental"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   190
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   155
      End
      Begin UITweaks.ResizedLabel LootMinMultiplierLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Minimum Multiplier:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin UITweaks.ResizedLabel LootMaxMultiplierLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Maximum Multiplier:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   92
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin UITweaks.ResizedLabel LootIconColorLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   6
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Icon Color:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   158
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin UITweaks.ResizedLabel LootIconLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   4
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Icon:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   126
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin ArkLootDropEditor DropEditor
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
         Height          =   405
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   6
         TabStop         =   True
         Tooltip         =   ""
         Top             =   38
         Transparent     =   True
         Visible         =   True
         Width           =   540
      End
      Begin RangeField LootRequiredItemSetsField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         DoubleValue     =   0.0
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "1"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   222
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   80
      End
      Begin TextArea LootNotesArea
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   True
         AllowStyledText =   True
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         Height          =   50
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   256
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   1
         ValidationMask  =   ""
         Visible         =   True
         Width           =   356
      End
      Begin UITweaks.ResizedLabel LootRequiredItemSetsLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Minimum Item Sets:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   222
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin UITweaks.ResizedLabel LootNotesLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   12
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Notes:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   256
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin RangeField LootSortField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         DoubleValue     =   0.0
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   2
         TabIndex        =   13
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "0"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   318
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   80
      End
      Begin UITweaks.ResizedLabel LootSortLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "Pages"
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
         TabIndex        =   14
         TabPanelIndex   =   5
         TabStop         =   True
         Text            =   "Sort Order:"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   318
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   132
      End
      Begin UITweaks.ResizedPushButton LootSortSuggestButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Suggest"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   False
         Left            =   256
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   2
         TabIndex        =   15
         TabPanelIndex   =   5
         TabStop         =   True
         Tooltip         =   ""
         Top             =   319
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
   End
   Begin OmniBar PageSelector
      Alignment       =   1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      BackgroundColor =   ""
      ContentHeight   =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   38
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
      Width           =   540
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
      Left            =   440
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   460
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
      Left            =   348
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin FadedSeparator BottomSeparator
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      ContentHeight   =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      ScrollActive    =   False
      ScrollingEnabled=   False
      ScrollSpeed     =   20
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   443
      Transparent     =   True
      Visible         =   True
      Width           =   540
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Self.SwapButtons()
		  
		  If (Self.mOriginalBlueprint Is Nil) = False Then
		    Select Case Self.mOriginalBlueprint
		    Case IsA Ark.Creature
		      Self.TypeMenu.SelectByCaption("Creature")
		    Case IsA Ark.Engram
		      Self.TypeMenu.SelectByCaption("Engram")
		    Case IsA Ark.SpawnPoint
		      Self.TypeMenu.SelectByCaption("Spawn Point")
		    Case IsA Ark.LootContainer
		      Self.TypeMenu.SelectByCaption("Loot Drop")
		    End Select
		    Self.TypeMenu.Enabled = False
		    Self.PathField.Text = Self.mOriginalBlueprint.Path
		    Self.NameField.Text = Self.mOriginalBlueprint.Label
		    Self.TagsField.Text = Self.mOriginalBlueprint.Tags.Join(", ")
		    Self.MapSelector.Mask = Self.mOriginalBlueprint.Availability
		    
		    Select Case Self.mOriginalBlueprint
		    Case IsA Ark.Engram
		      Self.LoadBlueprint(Ark.Engram(Self.mOriginalBlueprint))
		    Case IsA Ark.Creature
		      Self.LoadBlueprint(Ark.Creature(Self.mOriginalBlueprint))
		    Case IsA Ark.SpawnPoint
		      Self.LoadBlueprint(Ark.SpawnPoint(Self.mOriginalBlueprint))
		    Case IsA Ark.LootContainer
		      Self.LoadBlueprint(Ark.LootContainer(Self.mOriginalBlueprint))
		    End Select
		  Else
		    Self.TypeMenu.SelectedRowIndex = -1
		    Self.TypeMenu.Enabled = True
		    Self.PathField.Text = ""
		    Self.NameField.Text = ""
		    Self.TagsField.Text = ""
		    Self.MapSelector.Mask = 0
		  End If
		  
		  Self.MinimumHeight = Self.AbsoluteMinimumHeight
		  If Self.Height < Self.MinimumHeight Then
		    Self.Height = Self.MinimumHeight
		  End If
		  
		  Self.Modified = False
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AbsoluteMinimumHeight() As Integer
		  Return Self.MapSelector.Top + Self.MapSelector.DesiredHeight + 20 + Self.BottomSeparator.Height + 20 + Self.ActionButton.Height + 20
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(Blueprint As Ark.Blueprint)
		  Self.mOriginalBlueprint = Blueprint.ImmutableVersion
		  Self.mModUUID = Blueprint.ContentPackUUID
		  Self.mModName = Blueprint.ContentPackName
		  
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(ModUUID As String, ModName As String)
		  Self.mOriginalBlueprint = Nil
		  Self.mModUUID = ModUUID
		  Self.mModName = ModName
		  
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FirstValue(ParamArray Values() As String) As String
		  For Each Value As String In Values
		    If Value.IsEmpty = False Then
		      Return Value
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadBlueprint(Creature As Ark.Creature)
		  If Creature.IncubationTime > 0 Then
		    Self.CreatureIncubationTimeField.Text = Beacon.SecondsToString(Creature.IncubationTime)
		  End If
		  
		  If Creature.MatureTime > 0 Then
		    Self.CreatureMatureTimeField.Text = Beacon.SecondsToString(Creature.MatureTime)
		  End If
		  
		  If Creature.MinMatingInterval > 0 Then
		    Self.CreatureIntervalMinTimeField.Text = Beacon.SecondsToString(Creature.MinMatingInterval)
		  End If
		  
		  If Creature.MaxMatingInterval > 0 Then
		    Self.CreatureIntervalMaxTimeField.Text = Beacon.SecondsToString(Creature.MaxMatingInterval)
		  End If
		  
		  Var Stats() As Ark.Stat = Ark.Stats.All
		  For Each Stat As Ark.Stat In Stats
		    Var Values As Ark.CreatureStatValue = Creature.StatValue(Stat)
		    If Values Is Nil Then
		      Continue
		    End If
		    
		    Self.CreatureStatsList.AddRow("")
		    Var Row As Integer = Self.CreatureStatsList.LastAddedRowIndex
		    Self.ShowStatInRow(Row, Values)
		  Next
		  Self.CreatureStatsList.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadBlueprint(Engram As Ark.Engram)
		  Self.EngramEntryStringField.Text = Engram.EntryString
		  
		  If (Engram.RequiredPlayerLevel Is Nil) = False Then
		    Self.EngramPlayerLevelField.Text = Engram.RequiredPlayerLevel.IntegerValue.ToString(Locale.Current, ",##0")
		  ElseIf Engram.EntryString.IsEmpty = False Then
		    Self.EngramPlayerLevelField.Text = "Tek"
		  End If
		  
		  If (Engram.RequiredUnlockPoints Is Nil) = False Then
		    Self.EngramRequiredPointsField.Text = Engram.RequiredUnlockPoints.IntegerValue.ToString(Locale.Current, ",##0")
		  End If
		  
		  If (Engram.StackSize Is Nil) = False Then
		    Self.EngramStackSizeField.Text = Engram.StackSize.IntegerValue.ToString(Locale.Current, ",##0")
		  End If
		  
		  Var Ingredients() As Ark.CraftingCostIngredient = Engram.Recipe
		  For Each Ingredient As Ark.CraftingCostIngredient In Ingredients
		    Self.EngramCraftingCostList.AddRow(Ingredient.Engram.Label, Ingredient.Quantity.ToString(Locale.Current, ",##0"))
		    Self.EngramCraftingCostList.CellCheckBoxValueAt(Self.EngramCraftingCostList.LastAddedRowIndex, 2) = Ingredient.RequireExact
		    Self.EngramCraftingCostList.RowTagAt(Self.EngramCraftingCostList.LastAddedRowIndex) = Ingredient
		  Next
		  Self.EngramCraftingCostList.SortingColumn = 0
		  Self.EngramCraftingCostList.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadBlueprint(Container As Ark.LootContainer)
		  Self.LootMinMultiplierField.DoubleValue = Container.Multipliers.Min
		  Self.LootMaxMultiplierField.DoubleValue = Container.Multipliers.Max
		  Try
		    Self.LootIconMenu.SelectByTag(Container.IconID)
		  Catch Err As RuntimeException
		  End Try
		  Try
		    Self.LootIconColorMenu.SelectByTag(Container.UIColor.ToHex)
		  Catch Err As RuntimeException
		  End Try
		  Self.LootExperimentalCheckbox.Value = Container.Experimental
		  Self.LootRequiredItemSetsField.DoubleValue = Container.RequiredItemSetCount
		  Self.LootNotesArea.Text = Container.Notes
		  Self.LootSortField.DoubleValue = Container.SortValue
		  
		  Var Mutable As Ark.MutableLootContainer = Container.MutableVersion
		  Ark.DataSource.SharedInstance.LoadDefaults(Mutable)
		  
		  Var Drops(0) As Ark.LootContainer
		  Drops(0) = Mutable
		  Self.DropEditor.Containers = Drops
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadBlueprint(Point As Ark.SpawnPoint)
		  Var Mutable As Ark.MutableSpawnPoint = Point.MutableVersion
		  Ark.DataSource.SharedInstance.LoadDefaults(Mutable)
		  
		  Var Points(0) As Ark.SpawnPoint
		  Points(0) = Mutable
		  Self.SpawnPointEditor1.SpawnPoints = Points
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Modified() As Boolean
		  Return Self.mModified
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Modified(Assigns Value As Boolean)
		  If Self.mModified = Value Then
		    Return
		  End If
		  
		  Self.mModified = Value
		  Self.ActionButton.Enabled = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mResizeAnimation_Completed(Sender As AnimationKit.MoveTask)
		  Self.mResizeAnimation = Nil
		  Self.MinimumWidth = Sender.Width
		  If Sender.AnimateHeight Then
		    Self.MinimumHeight = Sender.Height
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Present(Parent As Window, Blueprint As Ark.Blueprint) As Ark.Blueprint
		  If Parent Is Nil Then
		    Return Nil
		  End If
		  
		  If Blueprint Is Nil Then
		    Var Err As New NilObjectException
		    Err.Message = "Blueprint cannot be nil"
		    Raise Err
		  End If
		  
		  Var Win As New BlueprintEditorDialog(Blueprint)
		  Win.ShowModalWithin(Parent.TrueWindow)
		  
		  Var EditedBlueprint As Ark.Blueprint
		  If Not Win.mCancelled Then
		    EditedBlueprint = Win.mModifiedBlueprint.ImmutableVersion
		  End If
		  Win.Close
		  Return EditedBlueprint
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Present(Parent As Window, ModUUID As String, ModName As String) As Ark.Blueprint
		  If Parent Is Nil Then
		    Return Nil
		  End If
		  
		  Var Win As New BlueprintEditorDialog(ModUUID, ModName)
		  Win.ShowModalWithin(Parent.TrueWindow)
		  
		  Var EditedBlueprint As Ark.Blueprint
		  If Not Win.mCancelled Then
		    EditedBlueprint = Win.mModifiedBlueprint.ImmutableVersion
		  End If
		  Win.Close
		  Return EditedBlueprint
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SampleProject() As Ark.Project
		  If Self.mSampleProject Is Nil Then
		    Self.mSampleProject = New Ark.Project
		    Self.mSampleProject.MapMask = Ark.Maps.UniversalMask
		  End If
		  Return Self.mSampleProject
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save() As Boolean
		  If Self.TypeMenu.SelectedRowIndex = -1 Then
		    Self.ShowAlert("This objects has no type", "Please select what kind of object this is.")
		    Return False
		  End If
		  
		  Var Label As String = Self.NameField.Text.Trim
		  Var Path As String = Self.PathField.Text.Trim
		  If Label = "" Then
		    Self.ShowAlert("This object has no name", "You'll want to correct this, it will be hard to find this object again without a name.")
		    Return False
		  End If
		  If Not Path.BeginsWith("/Game/") Then
		    If Path.IndexOf("/") = -1 Then
		      Var TempPath As String
		      Select Case Self.TypeMenu.SelectedRowIndex
		      Case Self.IndexEngram
		        TempPath = Ark.Engram.CreateCustom("", "", Path).Path
		      Case Self.IndexCreature
		        TempPath = Ark.Creature.CreateCustom("", "", Path).Path
		      Case Self.IndexSpawnPoint
		        TempPath = Ark.SpawnPoint.CreateCustom("", "", Path).Path
		      Case Self.IndexLootContainer
		        TempPath = Ark.LootContainer.CreateCustom("", "", Path).Path
		      End Select
		      If Self.ShowConfirm("The entered path is a class string, not a blueprint path. Do you want to use the path """ + TempPath + """ instead?", "This is not recommended. Beacon uses the paths to properly track items that may have the same class. When possible, use the full correct path to the blueprint.", "Use Suggestion", "Cancel") Then
		        Path = TempPath
		      Else
		        Return False
		      End If
		    Else
		      Var Matches As RegExMatch = Ark.BlueprintPathRegex.Search(Path)
		      If (Matches Is Nil) = False Then
		        Path = Matches.BlueprintPath
		      Else
		        Self.ShowAlert("The blueprint path is required", "Beacon requires the full blueprint path to the object in order to function correctly.")
		        Return False
		      End If
		    End If
		  End If
		  
		  Var Tags() As String = Self.TagsField.Text.Split(",")
		  For I As Integer = Tags.LastIndex DownTo 0
		    Tags(I) = Tags(I).Trim
		    If Tags(I) = "" Then
		      Tags.RemoveAt(I)
		    End If
		  Next
		  
		  Var Availability As UInt64 = Self.MapSelector.Mask
		  If Availability = CType(0, UInt64) Then
		    Self.ShowAlert("Object is not available to any maps", "This object should be usable on at least one map.")
		    Return False
		  End If
		  
		  Var Blueprint As Ark.MutableBlueprint
		  If Self.mOriginalBlueprint Is Nil Then
		    Select Case Self.TypeMenu.SelectedRowIndex
		    Case Self.IndexEngram
		      Blueprint = New Ark.MutableEngram(Path, New v4UUID)
		    Case Self.IndexCreature
		      Blueprint = New Ark.MutableCreature(Path, New v4UUID)
		    Case Self.IndexSpawnPoint
		      Blueprint = New Ark.MutableSpawnPoint(Path, New v4UUID)
		    Case Self.IndexLootContainer
		      Blueprint = New Ark.MutableLootContainer(Path, New v4UUID)
		    End Select
		  Else
		    Blueprint = Self.mOriginalBlueprint.MutableVersion
		  End If
		  If Blueprint Is Nil Then
		    Return False
		  End If
		  
		  Blueprint.Path = Path
		  Blueprint.Label = Label
		  Blueprint.Tags = Tags
		  Blueprint.Availability = Availability
		  Blueprint.ContentPackUUID = Self.mModUUID
		  Blueprint.ContentPackName = Self.mModName
		  
		  Select Case Blueprint
		  Case IsA Ark.MutableEngram
		    If Not Self.UpdateBlueprint(Ark.MutableEngram(Blueprint)) Then
		      Return False
		    End If
		  Case IsA Ark.MutableCreature
		    If Not Self.UpdateBlueprint(Ark.MutableCreature(Blueprint)) Then
		      Return False
		    End If
		  Case IsA Ark.MutableSpawnPoint
		    If Not Self.UpdateBlueprint(Ark.MutableSpawnPoint(Blueprint)) Then
		      Return False
		    End If
		  Case IsA Ark.MutableLootContainer
		    If Not Self.UpdateBlueprint(Ark.MutableLootContainer(Blueprint)) Then
		      Return False
		    End If
		  End Select
		  
		  Self.mModifiedBlueprint = Blueprint.ImmutableVersion
		  Self.Modified = False
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowStatInRow(Row As Integer, Values As Ark.CreatureStatValue)
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnLabel) = Values.Stat.Label
		  Self.CreatureStatsList.RowTagAt(Row) = Values
		  
		  Var BaseValue As Double = Values.BaseValue
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnBase) = If(BaseValue <> Ark.Creature.MissingStatValue, BaseValue.PrettyText(True), "")
		  
		  Var WildValue As Double = Values.WildMultiplier
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnWild) = If(WildValue <> Ark.Creature.MissingStatValue, WildValue.PrettyText(True), "")
		  
		  Var TamedValue As Double = Values.TamedMultiplier
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnTamed) = If(TamedValue <> Ark.Creature.MissingStatValue, TamedValue.PrettyText(True), "")
		  
		  Var AddValue As Double = Values.AddMultiplier
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnAdd) = If(AddValue <> Ark.Creature.MissingStatValue, AddValue.PrettyText(True), "")
		  
		  Var AffinityValue As Double = Values.AffinityMultiplier
		  Self.CreatureStatsList.CellValueAt(Row, Self.CreatureStatColumnAffinity) = If(AffinityValue <> Ark.Creature.MissingStatValue, AffinityValue.PrettyText(True), "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SuggestLootSortValue(Label As String) As Integer
		  Var SortValue As Integer
		  If Label.IndexOf("White") > -1 Then
		    SortValue = 1
		  ElseIf Label.IndexOf("Green") > -1 Then
		    SortValue = 3
		  ElseIf Label.IndexOf("Blue") > -1 Then
		    SortValue = 5
		  ElseIf Label.IndexOf("Purple") > -1 Then
		    SortValue = 7
		  ElseIf Label.IndexOf("Yellow") > -1 Then
		    SortValue = 9
		  ElseIf Label.IndexOf("Red") > -1 Then
		    SortValue = 11
		  ElseIf Label.IndexOf("Cyan") > -1 Then
		    SortValue = 13
		  ElseIf Label.IndexOf("Orange") > -1 Then
		    SortValue = 15
		  End If
		  If Label.IndexOf("Bonus") > -1 Then
		    SortValue = SortValue + 1
		  ElseIf Label.IndexOf("Cave") > -1 Then
		    SortValue = SortValue + 14
		  End If
		  If SortValue = 0 Then
		    SortValue = 199
		  End If
		  Return SortValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UpdateBlueprint(Creature As Ark.MutableCreature) As Boolean
		  Const ParseInstructions = "Use a format like ""2 days 3 hours 4 minutes 5 seconds"" to specify an amount of time. Short versions such as ""2d3h4m5s"" may also be used. Omit any units that are not needed. Decimal values may only be used on the seconds field."
		  
		  Var IncubationString As String = Self.CreatureIncubationTimeField.Text.Trim
		  If IncubationString.IsEmpty = False Then
		    Var Interval As DateInterval = Beacon.ParseInterval(IncubationString)
		    If Interval Is Nil Then
		      Self.ShowAlert("Unable to parse the incubation time", ParseInstructions)
		      Return False
		    End If
		    
		    Creature.IncubationTime = Interval.TotalSeconds
		  Else
		    Creature.IncubationTime = 0
		  End If
		  
		  Var MatureString As String = Self.CreatureMatureTimeField.Text.Trim
		  If MatureString.IsEmpty = False Then
		    Var Interval As DateInterval = Beacon.ParseInterval(MatureString)
		    If Interval Is Nil Then
		      Self.ShowAlert("Unable to parse the mature time", ParseInstructions)
		      Return False
		    End If
		    
		    Creature.MatureTime = Interval.TotalSeconds
		  Else
		    Creature.MatureTime = 0
		  End If
		  
		  Var MinIntervalString As String = Self.CreatureIntervalMinTimeField.Text
		  Var MaxIntervalString As String = Self.CreatureIntervalMaxTimeField.Text
		  If MinIntervalString.IsEmpty = False Or MaxIntervalString.IsEmpty = False Then
		    Var MinInterval As DateInterval = Beacon.ParseInterval(FirstValue(MinIntervalString, MaxIntervalString))
		    Var MaxInterval As DateInterval = Beacon.ParseInterval(FirstValue(MaxIntervalString, MinIntervalString))
		    
		    If MinInterval Is Nil Then
		      Self.ShowAlert("Unable to parse minimum mating interval", ParseInstructions)
		      Return False
		    End If
		    If MaxInterval Is Nil Then
		      Self.ShowAlert("Unable to parse maximum mating interval", ParseInstructions)
		      Return False
		    End If
		    
		    Creature.MinMatingInterval = MinInterval.TotalSeconds
		    Creature.MaxMatingInterval = MaxInterval.TotalSeconds
		  Else
		    Creature.MinMatingInterval = 0
		    Creature.MaxMatingInterval = 0
		  End If
		  
		  Creature.ClearStats
		  Var Mask As UInt16
		  For Row As Integer = 0 To Self.CreatureStatsList.LastRowIndex
		    Var Values As Ark.CreatureStatValue = Self.CreatureStatsList.RowTagAt(Row)
		    Creature.AddStatValue(Values)
		    Mask = Mask Or Values.Mask
		  Next
		  Creature.StatsMask = Mask
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UpdateBlueprint(Engram As Ark.MutableEngram) As Boolean
		  Var EntryString As String = Self.EngramEntryStringField.Text.Trim
		  Var RequiredLevelString As String = Self.EngramPlayerLevelField.Text.Trim
		  Var RequiredPointsString As String = Self.EngramRequiredPointsField.Text.Trim
		  Var HasUnlockDetails As Boolean = EntryString.IsEmpty = False
		  
		  If HasUnlockDetails Then
		    If EntryString.IsEmpty = False Then
		      If EntryString.EndsWith("_C") = False Then
		        Self.ShowAlert("Invalid Entry String", "Engram entry strings usually start with EngramEntry and always end with _C.")
		        Return False
		      End If
		      
		      Engram.EntryString = EntryString
		    Else
		      Engram.EntryString = ""
		    End If
		    
		    Var UnlocksByTek As Boolean = RequiredLevelString = "Tek"
		    Var RequireValidPoints As Boolean
		    If RequiredLevelString.IsEmpty = False Then 
		      If IsNumeric(RequiredLevelString) = False And UnlocksByTek = False Then
		        Self.ShowAlert("Invalid Required Level Value", "Required player level must be numeric or Tek.")
		        Return False
		      End If
		      
		      If UnlocksByTek Then
		        Engram.RequiredPlayerLevel = Nil
		      Else
		        Engram.RequiredPlayerLevel = Round(CDbl(RequiredLevelString))
		        RequireValidPoints = True
		      End If
		    Else
		      Engram.RequiredPlayerLevel = Nil
		    End If
		    
		    If RequiredPointsString.IsEmpty = False Then
		      If UnlocksByTek Then
		        Engram.RequiredUnlockPoints = Nil
		      ElseIf IsNumeric(RequiredPointsString) Then
		        Engram.RequiredUnlockPoints = Round(CDbl(RequiredPointsString))
		      Else
		        Self.ShowAlert("Invalid Points Value", "Required engram points must be numeric.")
		        Return False
		      End If
		    Else
		      If RequireValidPoints Then
		        Engram.RequiredUnlockPoints = 0
		      Else
		        Engram.RequiredUnlockPoints = Nil
		      End If
		    End If
		  ElseIf RequiredLevelString.IsEmpty = False Or RequiredPointsString.IsEmpty = False Then
		    Self.ShowAlert("Entry string is required to set level and point requirements.", "If you want to set level and point requirements for this engram, please provide the engram's entry string so Beacon can control it in the Engram Control editor.")
		    Return False
		  End If
		  
		  Var StackSizeString As String = Self.EngramStackSizeField.Text.Trim
		  If StackSizeString.IsEmpty = False Then
		    If IsNumeric(StackSizeString) = False Then
		      Self.ShowAlert("Invalid Stack Size", "The stack size value should be numeric.")
		      Return False
		    End If
		    
		    Engram.StackSize = CDbl(StackSizeString)
		  Else
		    Engram.StackSize = Nil
		  End If
		  
		  If Self.EngramCraftingCostList.RowCount > 0  Then
		    Var Ingredients() As Ark.CraftingCostIngredient
		    For Row As Integer = 0 To Self.EngramCraftingCostList.LastRowIndex
		      Ingredients.Add(Self.EngramCraftingCostList.RowTagAt(Row))
		    Next
		    Engram.Recipe = Ingredients
		  Else
		    Engram.Recipe = Nil
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UpdateBlueprint(Container As Ark.MutableLootContainer) As Boolean
		  Var Containers() As Ark.LootContainer = Self.DropEditor.Containers
		  If Containers.Count <> 1 Then
		    Return False
		  End If
		  
		  Var Source As Ark.LootContainer = Containers(0)
		  Container.Unpack(Source.Pack)
		  
		  Container.Multipliers = New Beacon.Range(Self.LootMinMultiplierField.DoubleValue, Self.LootMaxMultiplierField.DoubleValue)
		  Container.Experimental = Self.LootExperimentalCheckbox.Value
		  Container.IconID = Self.LootIconMenu.SelectedRowTag
		  Container.UIColor = Self.LootIconColorMenu.SelectedRowTag.StringValue.ToColor
		  Container.RequiredItemSetCount = Round(Self.LootRequiredItemSetsField.DoubleValue)
		  Container.Notes = Self.LootNotesArea.Text.Trim
		  Container.SortValue = Round(Self.LootSortField.DoubleValue)
		  If Container.SortValue = 0 Then
		    Container.SortValue = Self.SuggestLootSortValue(Container.Label)
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UpdateBlueprint(Point As Ark.MutableSpawnPoint) As Boolean
		  Var Points() As Ark.SpawnPoint = Self.SpawnPointEditor1.SpawnPoints
		  If Points.Count <> 1 Then
		    Return False
		  End If
		  
		  Var Source As Ark.SpawnPoint = Points(0)
		  Point.SetsString = Source.SetsString
		  Point.LimitsString = Source.LimitsString
		  
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCancelled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModifiedBlueprint As Ark.Blueprint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModUUID As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOriginalBlueprint As Ark.Blueprint
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResizeAnimation As AnimationKit.MoveTask
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSampleProject As Ark.Project
	#tag EndProperty


	#tag Constant, Name = CreatureStatColumnAdd, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureStatColumnAffinity, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureStatColumnBase, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureStatColumnLabel, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureStatColumnTamed, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureStatColumnWild, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureWindowWidth, Type = Double, Dynamic = False, Default = \"540", Scope = Private
	#tag EndConstant

	#tag Constant, Name = EngramWindowWidth, Type = Double, Dynamic = False, Default = \"540", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IndexCreature, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IndexEngram, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IndexLootContainer, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IndexSpawnPoint, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageCommonSettings, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageCreatureSettings, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageEngramSettings, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageLootContents, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageLootSettings, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PageSpawnSettings, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events MapSelector
	#tag Event
		Sub Changed()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TagsField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameField
	#tag Event
		Sub TextChange()
		  If Me.Text.Trim = "" Then
		    Self.Title = "New Blueprint"
		  Else
		    Self.Title = Me.Text.Trim
		  End If
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TypeMenu
	#tag Event
		Sub Change()
		  For Idx As Integer = Self.PageSelector.LastIndex DownTo 1
		    Self.PageSelector.Remove(Idx)
		  Next
		  
		  Var TargetWidth As Integer = 540
		  Var MinHeight As Integer = Self.AbsoluteMinimumHeight
		  
		  Select Case Me.SelectedRowIndex
		  Case Self.IndexEngram
		    Self.PageSelector.Append(OmniBarItem.CreateTab("PageEngram", "Advanced"))
		  Case Self.IndexCreature
		    Self.PageSelector.Append(OmniBarItem.CreateTab("PageCreature", "Advanced"))
		  Case Self.IndexSpawnPoint
		    Self.PageSelector.Append(OmniBarItem.CreateTab("PageSpawnContents", "Contents"))
		    TargetWidth = Max(TargetWidth, ArkSpawnPointEditor.MinEditorWidth, ArkLootDropEditor.MinEditorWidth)
		    MinHeight = Max(640, Self.AbsoluteMinimumHeight)
		  Case Self.IndexLootContainer
		    Self.PageSelector.Append(OmniBarItem.CreateTab("PageLootSettings", "Advanced"))
		    Self.PageSelector.Append(OmniBarItem.CreateTab("PageLootContents", "Contents"))
		    TargetWidth = Max(TargetWidth, ArkSpawnPointEditor.MinEditorWidth, ArkLootDropEditor.MinEditorWidth)
		    MinHeight = Max(640, Self.AbsoluteMinimumHeight)
		  End Select
		  
		  If (Self.mResizeAnimation Is Nil) = False Then
		    Self.mResizeAnimation.Cancel
		    Self.mResizeAnimation = Nil
		  End If
		  
		  If Self.Width <> TargetWidth Or Self.Height < MinHeight Then
		    Self.MinimumWidth = 540
		    Self.MinimumHeight = Self.AbsoluteMinimumHeight
		    Self.mResizeAnimation = New AnimationKit.MoveTask(Self)
		    Self.mResizeAnimation.Width = TargetWidth
		    If Self.Height < MinHeight Then
		      Self.mResizeAnimation.Height = MinHeight
		    End If
		    Self.mResizeAnimation.Curve = AnimationKit.Curve.CreateEaseOut
		    Self.mResizeAnimation.DurationInSeconds = 0.20
		    AddHandler mResizeAnimation.Completed, WeakAddressOf mResizeAnimation_Completed
		    Self.mResizeAnimation.Run
		  End If
		  
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PathField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramEntryStringField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramPlayerLevelField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramRequiredPointsField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramStackSizeField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramAddIngredient
	#tag Event
		Sub Action()
		  Var Engrams() As Ark.Engram
		  For Row As Integer = 0 To Self.EngramCraftingCostList.LastRowIndex
		    Engrams.Add(Ark.CraftingCostIngredient(Self.EngramCraftingCostList.RowTagAt(Row)).Engram)
		  Next
		  
		  Var Mods As New Beacon.StringList
		  Var NewEngrams() As Ark.Engram = ArkBlueprintSelectorDialog.Present(Self, "Resources", Engrams, Mods, ArkBlueprintSelectorDialog.SelectModes.ExplicitMultiple)
		  If NewEngrams = Nil Or NewEngrams.LastIndex = -1 Then
		    Return
		  End If
		  
		  For Each Engram As Ark.Engram In NewEngrams
		    If (Engram Is Nil) = False Then
		      Var Ingredient As New Ark.CraftingCostIngredient(Engram, 1, False)
		      Self.EngramCraftingCostList.AddRow(Engram.Label, "1")
		      Self.EngramCraftingCostList.RowTagAt(Self.EngramCraftingCostList.LastAddedRowIndex) = Ingredient
		    End If
		  Next
		  
		  Self.EngramCraftingCostList.Sort
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramEditIngredientButton
	#tag Event
		Sub Action()
		  If Self.EngramCraftingCostList.CanEdit Then
		    Self.EngramCraftingCostList.DoEdit
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramRemoveIngredientButton
	#tag Event
		Sub Action()
		  If Self.EngramCraftingCostList.CanDelete Then
		    Self.EngramCraftingCostList.DoClear
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureIncubationTimeField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureMatureTimeField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureIntervalMinTimeField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureIntervalMaxTimeField
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureAddStatButton
	#tag Event
		Sub Action()
		  Var UsedStats As UInt16
		  For Row As Integer = 0 To Self.CreatureStatsList.LastRowIndex
		    Var Values As Ark.CreatureStatValue = Self.CreatureStatsList.RowTagAt(Row)
		    UsedStats = UsedStats Or Values.Mask
		  Next
		  
		  Var NewStat As Ark.CreatureStatValue = DefineStatDialog.Present(Self, UsedStats)
		  If NewStat Is Nil Then
		    Return
		  End If
		  
		  Self.CreatureStatsList.AddRow("")
		  Self.ShowStatInRow(Self.CreatureStatsList.LastAddedRowIndex, NewStat)
		  Self.CreatureStatsList.Sort
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureEditStatButton
	#tag Event
		Sub Action()
		  Self.CreatureStatsList.DoEdit
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureDeleteStatButton
	#tag Event
		Sub Action()
		  Self.CreatureStatsList.DoClear
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EngramCraftingCostList
	#tag Event
		Sub Change()
		  Self.EngramRemoveIngredientButton.Enabled = Me.CanDelete
		  Self.EngramEditIngredientButton.Enabled = Me.CanEdit
		End Sub
	#tag EndEvent
	#tag Event
		Function CanDelete() As Boolean
		  Return Me.SelectedRowCount > 0
		End Function
	#tag EndEvent
	#tag Event
		Function CanEdit() As Boolean
		  Return Me.SelectedRowCount = 1
		End Function
	#tag EndEvent
	#tag Event
		Sub PerformEdit()
		  If Me.SelectedRowCount <> 1 Then
		    Return
		  End If
		  
		  Me.EditCellAt(Me.SelectedRowIndex, 1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PerformClear(Warn As Boolean)
		  Var Labels() As String
		  
		  If Warn Then
		    For Row As Integer = 0 To Me.LastRowIndex
		      If Me.Selected(Row) Then
		        Var Ingredient As Ark.CraftingCostIngredient = Me.RowTagAt(Row)
		        Labels.Add(Ingredient.Engram.Label)
		      End If
		    Next
		    
		    If Self.ShowDeleteConfirmation(Labels, "ingredient", "ingredients", False) = False Then
		      Return
		    End If
		  End If
		  
		  For Row As Integer = Me.LastRowIndex DownTo 0
		    If Me.Selected(Row) Then
		      Me.RemoveRowAt(Row)
		    End If
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ColumnAlignmentAt(1) = Listbox.Alignments.Right
		  Me.ColumnAlignmentAt(2) = Listbox.Alignments.Center
		  Me.ColumnTypeAt(1) = Listbox.CellTypes.TextField
		  Me.ColumnTypeAt(2) = Listbox.CellTypes.CheckBox
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Var Ingredient As Ark.CraftingCostIngredient = Me.RowTagAt(Row)
		  
		  Select Case Column
		  Case 1
		    Var Value As String = Me.CellValueAt(Row, Column)
		    Var Quantity As Integer = Round(CDbl(Value))
		    If IsNumeric(Value) = False Or Quantity <= 0 Then
		      System.Beep
		      Me.CellValueAt(Row, Column) = Ingredient.Quantity.ToString(Locale.Current, ",##0")
		      Return
		    End If
		    
		    Me.RowTagAt(Row) = New Ark.CraftingCostIngredient(Ingredient.Engram, Quantity, Ingredient.RequireExact)
		    Me.CellValueAt(Row, Column) = Quantity.ToString(Locale.Current, ",##0")
		  Case 2
		    Me.RowTagAt(Row) = New Ark.CraftingCostIngredient(Ingredient.Engram, Ingredient.Quantity, Me.CellCheckBoxValueAt(Row, Column))
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreatureStatsList
	#tag Event
		Sub Open()
		  Me.ColumnAlignmentAt(Self.CreatureStatColumnBase) = Listbox.Alignments.Right
		  Me.ColumnAlignmentAt(Self.CreatureStatColumnWild) = Listbox.Alignments.Right
		  Me.ColumnAlignmentAt(Self.CreatureStatColumnTamed) = Listbox.Alignments.Right
		  Me.ColumnAlignmentAt(Self.CreatureStatColumnAdd) = Listbox.Alignments.Right
		  Me.ColumnAlignmentAt(Self.CreatureStatColumnAffinity) = Listbox.Alignments.Right
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Var Values1 As Ark.CreatureStatValue = Me.RowTagAt(Row1)
		  Var Values2 As Ark.CreatureStatValue = Me.RowTagAt(Row2)
		  
		  Select Case Column
		  Case Self.CreatureStatColumnLabel
		    Result = CompareValues(Values1.Stat.Index, Values2.Stat.Index)
		  Case Self.CreatureStatColumnBase
		    Result = CompareValues(Values1.BaseValue, Values2.BaseValue)
		  Case Self.CreatureStatColumnWild
		    Result = CompareValues(Values1.WildMultiplier, Values2.WildMultiplier)
		  Case Self.CreatureStatColumnTamed
		    Result = CompareValues(Values1.TamedMultiplier, Values2.TamedMultiplier)
		  Case Self.CreatureStatColumnAdd
		    Result = CompareValues(Values1.AddMultiplier, Values2.AddMultiplier)
		  Case Self.CreatureStatColumnAffinity
		    Result = CompareValues(Values1.AffinityMultiplier, Values2.AffinityMultiplier)
		  Else
		    Return False
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CanDelete() As Boolean
		  Return Me.SelectedRowCount > 0
		End Function
	#tag EndEvent
	#tag Event
		Function CanEdit() As Boolean
		  Return Me.SelectedRowCount = 1
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  Self.CreatureEditStatButton.Enabled = Me.CanEdit
		  Self.CreatureDeleteStatButton.Enabled = Me.CanDelete
		End Sub
	#tag EndEvent
	#tag Event
		Sub PerformEdit()
		  Var Values As Ark.CreatureStatValue = Me.RowTagAt(Me.SelectedRowIndex)
		  
		  Var UsedStats As UInt16
		  For Row As Integer = 0 To Self.CreatureStatsList.LastRowIndex
		    UsedStats = UsedStats Or Ark.CreatureStatValue(Self.CreatureStatsList.RowTagAt(Row)).Mask
		  Next
		  
		  Var NewStat As Ark.CreatureStatValue = DefineStatDialog.Present(Self, UsedStats, Values)
		  If NewStat Is Nil Then
		    Return
		  End If
		  
		  Self.ShowStatInRow(Me.SelectedRowIndex, NewStat)
		  Self.CreatureStatsList.Sort
		  Self.Modified = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub PerformClear(Warn As Boolean)
		  #Pragma Unused Warn
		  
		  For Row As Integer = Me.LastRowIndex DownTo 0
		    If Me.Selected(Row) Then
		      Me.RemoveRowAt(Row)
		    End If
		  Next
		  
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SpawnPointEditor1
	#tag Event
		Sub Open()
		  Var Points(0) As Ark.SpawnPoint
		  Points(0) = New Ark.MutableSpawnPoint(Ark.UnknownBlueprintPath("SpawnPoints", "BlueprintEditor_C"), "8cdcd17e-b246-4973-a694-98e0dee33e25")
		  Me.SpawnPoints = Points
		End Sub
	#tag EndEvent
	#tag Event
		Function GetProject() As Ark.Project
		  Return Self.SampleProject()
		End Function
	#tag EndEvent
	#tag Event
		Sub Changed()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootMinMultiplierField
	#tag Event
		Sub GetRange(ByRef MinValue As Double, ByRef MaxValue As Double)
		  MinValue = 0
		  MaxValue = 1000
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootMaxMultiplierField
	#tag Event
		Sub GetRange(ByRef MinValue As Double, ByRef MaxValue As Double)
		  MinValue = 0
		  MaxValue = 1000
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootIconColorMenu
	#tag Event
		Sub Open()
		  Var LootColors() As Pair = Ark.LootColors
		  For Each LootColor As Pair In LootColors
		    Me.AddRow(LootColor.Left.StringValue, LootColor.Right.StringValue)
		  Next LootColor
		  Me.SelectedRowIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootIconMenu
	#tag Event
		Sub Open()
		  Var Icons() As Ark.LootContainerIcon = Ark.DataSource.SharedInstance.GetLootContainerIcons
		  If Icons.Count = 0 Then
		    Me.AddRow("Generic", "3a1f5d12-0b50-4761-9f89-277492dc00e0")
		    Return
		  End If
		  For Each Icon As Ark.LootContainerIcon In Icons
		    Me.AddRow(Icon.Label, Icon.UUID)
		  Next Icon
		  Try
		    Me.SelectRowWithTag("84d76c41-4386-467d-83e7-841dcaa4007d")
		  Catch Err As RuntimeException
		  End Try
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootExperimentalCheckbox
	#tag Event
		Sub Action()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DropEditor
	#tag Event
		Function GetProject() As Ark.Project
		  Return Self.SampleProject()
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Var Drops(0) As Ark.LootContainer
		  Drops(0) = New Ark.MutableLootContainer(Ark.UnknownBlueprintPath("LootContainers", "BlueprintEditor_C"), "8e25c4be-d496-4c94-b1bc-d4bef54834ad")
		  Me.Containers = Drops
		End Sub
	#tag EndEvent
	#tag Event
		Sub Updated()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootRequiredItemSetsField
	#tag Event
		Sub GetRange(ByRef MinValue As Double, ByRef MaxValue As Double)
		  MinValue = 1
		  MaxValue = 1000
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootNotesArea
	#tag Event
		Sub TextChange()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootSortField
	#tag Event
		Sub GetRange(ByRef MinValue As Double, ByRef MaxValue As Double)
		  MinValue = 1
		  MaxValue = 1000
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Self.Modified = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LootSortSuggestButton
	#tag Event
		Sub Action()
		  Self.LootSortField.DoubleValue = Self.SuggestLootSortValue(Self.NameField.Text.Trim)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PageSelector
	#tag Event
		Sub Open()
		  Var CommonItem As OmniBarItem = OmniBarItem.CreateTab("PageCommon", "Common")
		  CommonItem.Toggled = True
		  Me.Append(CommonItem)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ItemPressed(Item As OmniBarItem, ItemRect As Rect)
		  #Pragma Unused ItemRect
		  
		  For Idx As Integer = 0 To Me.LastIndex
		    Me.Item(Idx).Toggled = (Me.Item(Idx) = Item)
		  Next
		  
		  Select Case Item.Name
		  Case "PageCommon"
		    Self.Pages.SelectedPanelIndex = Self.PageCommonSettings
		  Case "PageEngram"
		    Self.Pages.SelectedPanelIndex = Self.PageEngramSettings
		  Case "PageCreature"
		    Self.Pages.SelectedPanelIndex = Self.PageCreatureSettings
		  Case "PageSpawnContents"
		    Self.Pages.SelectedPanelIndex = Self.PageSpawnSettings
		  Case "PageLootSettings"
		    Self.Pages.SelectedPanelIndex = Self.PageLootSettings
		  Case "PageLootContents"
		    Self.Pages.SelectedPanelIndex = Self.PageLootContents
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActionButton
	#tag Event
		Sub Action()
		  If Self.Save() Then
		    Self.mCancelled = False
		    Self.Hide
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Action()
		  Self.mCancelled = True
		  Self.Hide
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
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
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Visible"
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
#tag EndViewBehavior
