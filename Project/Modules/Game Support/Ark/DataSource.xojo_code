#tag Class
Protected Class DataSource
Inherits Beacon.DataSource
	#tag Event
		Sub BuildSchema()
		  Var ContentPackDeleteBehavior As String
		  #if DebugBuild
		    ContentPackDeleteBehavior = "RESTRICT"
		  #else
		    ContentPackDeleteBehavior = "CASCADE"
		  #endif
		  
		  Self.SQLExecute("CREATE TABLE content_packs (content_pack_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, name TEXT COLLATE NOCASE NOT NULL, console_safe INTEGER NOT NULL, default_enabled INTEGER NOT NULL, workshop_id INTEGER UNIQUE, is_local BOOLEAN NOT NULL);")
		  Self.SQLExecute("CREATE TABLE loot_icons (icon_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, icon_data BLOB NOT NULL);")
		  Self.SQLExecute("CREATE TABLE loot_containers (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, alternate_label TEXT COLLATE NOCASE, availability INTEGER NOT NULL, path TEXT COLLATE NOCASE NOT NULL, class_string TEXT COLLATE NOCASE NOT NULL, multiplier_min REAL NOT NULL, multiplier_max REAL NOT NULL, uicolor TEXT COLLATE NOCASE NOT NULL, sort_order INTEGER NOT NULL, icon TEXT COLLATE NOCASE NOT NULL REFERENCES loot_icons(icon_id) ON UPDATE CASCADE ON DELETE RESTRICT, experimental BOOLEAN NOT NULL, notes TEXT NOT NULL, requirements TEXT NOT NULL DEFAULT '{}', tags TEXT COLLATE NOCASE NOT NULL DEFAULT '');")
		  Self.SQLExecute("CREATE TABLE engrams (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, alternate_label TEXT COLLATE NOCASE, availability INTEGER NOT NULL, path TEXT COLLATE NOCASE NOT NULL, class_string TEXT COLLATE NOCASE NOT NULL, tags TEXT COLLATE NOCASE NOT NULL DEFAULT '', entry_string TEXT COLLATE NOCASE, required_level INTEGER, required_points INTEGER, stack_size INTEGER, item_id INTEGER, recipe TEXT NOT NULL DEFAULT '[]');")
		  Self.SQLExecute("CREATE TABLE loot_container_selectors (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, language TEXT COLLATE NOCASE NOT NULL, code TEXT NOT NULL);")
		  Self.SQLExecute("CREATE TABLE config_help (config_name TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, title TEXT COLLATE NOCASE NOT NULL, body TEXT COLLATE NOCASE NOT NULL, detail_url TEXT NOT NULL);")
		  Self.SQLExecute("CREATE TABLE game_variables (key TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, value TEXT NOT NULL);")
		  Self.SQLExecute("CREATE TABLE creatures (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, alternate_label TEXT COLLATE NOCASE, availability INTEGER NOT NULL, path TEXT COLLATE NOCASE NOT NULL, class_string TEXT COLLATE NOCASE NOT NULL, tags TEXT COLLATE NOCASE NOT NULL DEFAULT '', incubation_time REAL, mature_time REAL, stats TEXT, used_stats INTEGER, mating_interval_min REAL, mating_interval_max REAL);")
		  Self.SQLExecute("CREATE TABLE spawn_points (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, alternate_label TEXT COLLATE NOCASE, availability INTEGER NOT NULL, path TEXT COLLATE NOCASE NOT NULL, class_string TEXT COLLATE NOCASE NOT NULL, tags TEXT COLLATE NOCASE NOT NULL DEFAULT '', sets TEXT NOT NULL DEFAULT '[]', limits TEXT NOT NULL DEFAULT '{}');")
		  Self.SQLExecute("CREATE TABLE ini_options (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, alternate_label TEXT COLLATE NOCASE, tags TEXT COLLATE NOCASE NOT NULL DEFAULT '', native_editor_version INTEGER, file TEXT COLLATE NOCASE NOT NULL, header TEXT COLLATE NOCASE NOT NULL, key TEXT COLLATE NOCASE NOT NULL, value_type TEXT COLLATE NOCASE NOT NULL, max_allowed INTEGER, description TEXT NOT NULL, default_value TEXT, nitrado_path TEXT COLLATE NOCASE, nitrado_format TEXT COLLATE NOCASE, nitrado_deploy_style TEXT COLLATE NOCASE, ui_group TEXT COLLATE NOCASE, custom_sort TEXT COLLATE NOCASE, constraints TEXT);")
		  Self.SQLExecute("CREATE TABLE maps (object_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, content_pack_id TEXT COLLATE NOCASE NOT NULL REFERENCES content_packs(content_pack_id) ON DELETE " + ContentPackDeleteBehavior + " DEFERRABLE INITIALLY DEFERRED, label TEXT COLLATE NOCASE NOT NULL, ark_identifier TEXT COLLATE NOCASE NOT NULL UNIQUE, difficulty_scale REAL NOT NULL, official BOOLEAN NOT NULL, mask BIGINT NOT NULL UNIQUE, sort INTEGER NOT NULL);")
		  Self.SQLExecute("CREATE TABLE events (event_id TEXT COLLATE NOCASE NOT NULL PRIMARY KEY, label TEXT COLLATE NOCASE NOT NULL, ark_code TEXT NOT NULL, rates TEXT NOT NULL, colors TEXT NOT NULL, engrams TEXT NOT NULL);")
		  Self.SQLExecute("CREATE TABLE colors (color_id INTEGER NOT NULL PRIMARY KEY, color_uuid TEXT COLLATE NOCASE NOT NULL, label TEXT COLLATE NOCASE NOT NULL, hex_value TEXT COLLATE NOCASE NOT NULL);")
		  Self.SQLExecute("CREATE TABLE color_sets (color_set_id TEXT COLLATE NOCASE PRIMARY KEY, label TEXT COLLATE NOCASE NOT NULL, class_string TEXT COLLATE NOCASE NOT NULL);")
		  
		  Self.SQLExecute("CREATE VIRTUAL TABLE searchable_tags USING fts5(tags, object_id, source_table);")
		  
		  Self.SQLExecute("INSERT INTO content_packs (content_pack_id, name, console_safe, default_enabled, is_local) VALUES (?1, ?2, ?3, ?4, ?5);", Ark.UserContentPackUUID, Ark.UserContentPackName, True, True, True)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  If mInstance = Self Then
		    mInstance = Nil
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function DefineIndexes() As Beacon.DataIndex()
		  Var Indexes() As Beacon.DataIndex
		  Var Categories() As String = Ark.Categories
		  For Each Category As String In Categories
		    Indexes.Add(New Beacon.DataIndex(Category, True, "content_pack_id", "path"))
		    Indexes.Add(New Beacon.DataIndex(Category, False, "path"))
		    Indexes.Add(New Beacon.DataIndex(Category, False, "class_string"))
		    Indexes.Add(New Beacon.DataIndex(Category, False, "content_pack_id"))
		    Indexes.Add(New Beacon.DataIndex(Category, False, "label"))
		  Next
		  
		  Indexes.Add(New Beacon.DataIndex("maps", False, "content_pack_id"))
		  Indexes.Add(New Beacon.DataIndex("loot_containers", False, "sort_order"))
		  
		  Indexes.Add(New Beacon.DataIndex("engrams", False, "entry_string"))
		  Indexes.Add(New Beacon.DataIndex("ini_options", True, "file", "header", "key"))
		  Indexes.Add(New Beacon.DataIndex("events", True, "ark_code"))
		  Indexes.Add(New Beacon.DataIndex("events", False, "label"))
		  Indexes.Add(New Beacon.DataIndex("colors", True, "color_uuid"))
		  Indexes.Add(New Beacon.DataIndex("colors", False, "label"))
		  Indexes.Add(New Beacon.DataIndex("color_sets", False, "label"))
		  Indexes.Add(New Beacon.DataIndex("color_sets", True, "class_string"))
		  
		  Return Indexes
		End Function
	#tag EndEvent

	#tag Event
		Function GetSchemaVersion() As Integer
		  Return 100
		End Function
	#tag EndEvent

	#tag Event
		Function Import(ChangeDict As Dictionary, StatusData As Dictionary) As Boolean
		  Var BuildNumber As Integer = App.BuildNumber
		  
		  Var RequiredKeys() As String = Array("mods", "loot_source_icons", "loot_sources", "engrams", "presets", "preset_modifiers", "timestamp", "is_full", "beacon_version")
		  For Each RequiredKey As String In RequiredKeys
		    If Not ChangeDict.HasKey(RequiredKey) Then
		      App.Log("Cannot import blueprints because key '" + RequiredKey + "' is missing.")
		      Return False
		    End If
		  Next
		  
		  Self.DropIndexes()
		  
		  Var Mods() As Variant = ChangeDict.Value("mods")
		  For Each ModData As Dictionary In Mods
		    Var ModID As String = ModData.Value("mod_id").StringValue.Lowercase
		    Var ModName As String = ModData.Value("name").StringValue
		    Var ConsoleSafe As Boolean = ModData.Value("console_safe").BooleanValue
		    Var DefaultEnabled As Boolean = ModData.Value("default_enabled").BooleanValue
		    Var WorkshopID As UInt32 = ModData.Value("workshop_id").UInt32Value
		    If ModData.HasKey("min_version") And ModData.Value("min_version").IntegerValue > BuildNumber Then
		      // This mod is too new
		      Continue
		    End If
		    
		    Var Results As RowSet = Self.SQLSelect("SELECT content_pack_id FROM content_packs WHERE content_pack_id = ?1;", ModID)
		    If Results.RowCount = 1 Then
		      Self.SQLExecute("UPDATE content_packs SET name = ?2, console_safe = ?3, default_enabled = ?4, workshop_id = ?5 WHERE content_pack_id = ?1 AND (name != ?2 OR console_safe != ?3 OR default_enabled != ?4 OR workshop_id != ?5);", ModID, ModName, ConsoleSafe, DefaultEnabled, WorkshopID)
		    Else
		      Self.SQLExecute("INSERT INTO content_packs (content_pack_id, name, console_safe, default_enabled, workshop_id, is_local) VALUES (?1, ?2, ?3, ?4, ?5, ?6);", ModID, ModName, ConsoleSafe, DefaultEnabled, WorkshopID, False)
		    End If
		  Next
		  
		  // When deleting, loot_icons must be done after loot_sources
		  Var Deletions() As Variant = ChangeDict.Value("deletions")
		  Var DeleteIcons() As String
		  Var BlueprintsToDelete() As String
		  For Each Deletion As Dictionary In Deletions
		    Var ObjectID As String = Deletion.Value("object_id").StringValue
		    Select Case Deletion.Value("group")
		    Case Ark.CategoryEngrams, Ark.CategoryCreatures, Ark.CategorySpawnPoints, Ark.CategoryLootContainers, "loot_sources"
		      BlueprintsToDelete.Add(ObjectID)
		    Case "loot_icons"
		      DeleteIcons.Add(ObjectID)
		    Case "presets"
		      Self.SQLExecute("DELETE FROM official_presets WHERE object_id = ?1;", ObjectID)
		    Case "mods"
		      Self.SQLExecute("DELETE FROM content_packs WHERE content_pack_id = ?1;", ObjectID)
		    Case "maps"
		      Self.SQLExecute("DELETE FROM maps WHERE object_id = ?1;", ObjectID)
		    Case "colors"
		      Self.SQLExecute("DELETE FROM colors WHERE color_uuid = ?1;", ObjectID)
		    Case "events"
		      Self.SQLExecute("DELETE FROM events WHERE event_id = ?1;", ObjectID)
		    End Select
		  Next
		  For Each IconID As String In DeleteIcons
		    Self.SQLExecute("DELETE FROM loot_icons WHERE icon_id = ?1;", IconID)
		  Next
		  
		  Var BlueprintsToSave() As Ark.Blueprint
		  
		  Var LootSourceIcons() As Variant = ChangeDict.Value("loot_source_icons")
		  For Each Dict As Dictionary In LootSourceIcons
		    If Dict.Value("min_version") > BuildNumber Then
		      Continue
		    End If
		    
		    Var IconID As String = Dict.Value("id")
		    Var IconData As MemoryBlock = DecodeBase64(Dict.Value("icon_data"))
		    
		    IconID = IconID.Lowercase
		    
		    Var Results As RowSet = Self.SQLSelect("SELECT icon_id FROM loot_icons WHERE icon_id = ?1;", IconID)
		    If Results.RowCount = 1 Then
		      Self.SQLExecute("UPDATE loot_icons SET icon_data = ?2 WHERE icon_id = ?1;", IconID, IconData)
		    Else
		      Self.SQLExecute("INSERT INTO loot_icons (icon_id, icon_data) VALUES (?1, ?2);", IconID, IconData)
		    End If
		  Next
		  If LootSourceIcons.LastIndex > -1 Then
		    Self.mIconCache = Nil
		  End If
		  
		  Var LootSources() As Variant = ChangeDict.Value("loot_sources")
		  For Each Dict As Dictionary In LootSources
		    If Dict.Value("min_version") > BuildNumber Then
		      Continue
		    End If
		    
		    Var Container As Ark.Blueprint = Ark.UnpackBlueprint(Dict)
		    If (Container Is Nil) = False Then
		      BlueprintsToSave.Add(Container)
		    End If
		  Next
		  
		  If ChangeDict.HasKey("engrams") Then
		    Var Engrams() As Variant = ChangeDict.Value("engrams")
		    For Each Dict As Dictionary In Engrams
		      If Dict.Value("min_version") > BuildNumber Then
		        Continue
		      End If
		      
		      Var Engram As Ark.Blueprint = Ark.UnpackBlueprint(Dict)
		      If (Engram Is Nil) = False Then
		        BlueprintsToSave.Add(Engram)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("creatures") Then
		    Var Creatures() As Variant = ChangeDict.Value("creatures")
		    For Each Dict As Dictionary In Creatures
		      If Dict.Value("min_version") > BuildNumber Then
		        Continue
		      End If
		      
		      Var Creature As Ark.Blueprint = Ark.UnpackBlueprint(Dict)
		      If (Creature Is Nil) = False Then
		        BlueprintsToSave.Add(Creature)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("spawn_points") Then
		    Var SpawnPoints() As Variant = ChangeDict.Value("spawn_points")
		    For Each Dict As Dictionary In SpawnPoints
		      If Dict.Value("min_version") > BuildNumber Then
		        Continue
		      End If
		      
		      Var Point As Ark.Blueprint = Ark.UnpackBlueprint(Dict)
		      If (Point Is Nil) = False Then
		        BlueprintsToSave.Add(Point)
		      End If
		    Next
		  End If
		  
		  Var BlueprintSaveErrors As New Dictionary
		  Var EngramsChanged As Boolean = Self.SaveBlueprints(BlueprintsToSave, BlueprintsToDelete, BlueprintSaveErrors, False)
		  For Each Entry As DictionaryEntry In BlueprintSaveErrors
		    Var BlueprintUUID As String = Entry.Key
		    Var Err As RuntimeException = Entry.Value
		    App.Log("Unable to import blueprint " + BlueprintUUID + ": Error #" + Err.ErrorNumber.ToString(Locale.Raw, "0") + " " + Err.Message.NthField(EndOfLine, 1))
		  Next Entry
		  
		  If ChangeDict.HasKey("ini_options") Then
		    Self.mConfigKeyCache = New Dictionary
		    
		    Var Options() As Variant = ChangeDict.Value("ini_options")
		    For Each Dict As Dictionary In Options
		      If Dict.Value("min_version") > BuildNumber Then
		        Continue
		      End If
		      
		      Var ObjectID As v4UUID = Dict.Value("id").StringValue
		      Var ModID As v4UUID = Dictionary(Dict.Value("mod")).Value("id").StringValue
		      Var File As String = Dict.Value("file").StringValue
		      Var Header As String = Dict.Value("header").StringValue
		      Var Key As String = Dict.Value("key").StringValue
		      Var TagString, TagStringForSearching As String
		      Try
		        Var Tags() As String
		        Var Temp() As Variant = Dict.Value("tags")
		        For Each Tag As String In Temp
		          Tags.Add(Tag)
		        Next
		        TagString = Tags.Join(",")
		        Tags.AddAt(0, "object")
		        TagStringForSearching = Tags.Join(",")
		      Catch Err As RuntimeException
		        
		      End Try
		      
		      Var Values(18) As Variant
		      Values(0) = ObjectID.StringValue
		      Values(1) = Dict.Value("label")
		      Values(2) = ModID.StringValue
		      Values(3) = Dict.Value("native_editor_version")
		      Values(4) = File
		      Values(5) = Header
		      Values(6) = Key
		      Values(7) = Dict.Value("value_type")
		      Values(8) = Dict.Value("max_allowed")
		      Values(9) = Dict.Value("description")
		      Values(10) = Dict.Value("default_value")
		      Values(11) = Dict.Value("alternate_label")
		      If Dict.HasKey("nitrado_guided_equivalent") And IsNull(Dict.Value("nitrado_guided_equivalent")) = False Then
		        Var NitradoEq As Dictionary = Dict.Value("nitrado_guided_equivalent")
		        Values(12) = NitradoEq.Value("path")
		        Values(13) = NitradoEq.Value("format")
		        Values(14) = NitradoEq.Value("deploy_style")
		      Else
		        Values(12) = Nil
		        Values(13) = Nil
		        Values(14) = Nil
		      End If
		      Values(15) = TagString
		      If Dict.HasKey("ui_group") Then
		        Values(16) = Dict.Value("ui_group")
		      End If
		      If Dict.HasKey("custom_sort") Then
		        Values(17) = Dict.Value("custom_sort")
		      End If
		      If Dict.HasKey("constraints") And IsNull(Dict.Value("constraints")) = False Then
		        Try
		          Values(18) = Beacon.GenerateJSON(Dict.Value("constraints"), False)
		        Catch JSONErr As RuntimeException
		        End Try
		      End If
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT object_id FROM ini_options WHERE object_id = ?1 OR (file = ?2 AND header = ?3 AND key = ?4);", ObjectID.StringValue, File, Header, Key)
		      If Results.RowCount > 1 Then
		        Self.SQLExecute("DELETE FROM ini_options WHERE object_id = ?1 OR (file = ?2 AND header = ?3 AND key = ?4);", ObjectID.StringValue, File, Header, Key)
		      End If
		      If Results.RowCount = 1 Then
		        // Update
		        Var OriginalObjectID As v4UUID = Results.Column("object_id").StringValue
		        Values.Add(OriginalObjectID.StringValue)
		        Self.SQLExecute("UPDATE ini_options SET object_id = ?1, label = ?2, content_pack_id = ?3, native_editor_version = ?4, file = ?5, header = ?6, key = ?7, value_type = ?8, max_allowed = ?9, description = ?10, default_value = ?11, alternate_label = ?12, nitrado_path = ?13, nitrado_format = ?14, nitrado_deploy_style = ?15, tags = ?16, ui_group = ?17, custom_sort = ?18, constraints = ?19 WHERE object_id = ?20;", Values)
		      Else
		        // Insert
		        Self.SQLExecute("INSERT INTO ini_options (object_id, label, content_pack_id, native_editor_version, file, header, key, value_type, max_allowed, description, default_value, alternate_label, nitrado_path, nitrado_format, nitrado_deploy_style, tags, ui_group, custom_sort, constraints) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15, ?16, ?17, ?18, ?19);", Values)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("maps") Then
		    Var Maps() As Dictionary = ChangeDict.Value("maps").DictionaryArrayValue
		    For Each MapDict As Dictionary In Maps
		      Var MapID As String = MapDict.Value("map_id")
		      Var ModID As String = MapDict.Value("mod_id")
		      Var Label As String = MapDict.Value("label")
		      Var Identifier As String = MapDict.Value("identifier")
		      Var Difficulty As Double = MapDict.Value("difficulty")
		      Var Official As Boolean = MapDict.Value("official")
		      Var Mask As UInt64 = MapDict.Value("mask")
		      Var Sort As Integer = MapDict.Value("sort")
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT object_id FROM maps WHERE object_id = ?1;", MapID)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE maps SET content_pack_id = ?2, label = ?3, ark_identifier = ?4, difficulty_scale = ?5, official = ?6, mask = ?7, sort = ?8 WHERE object_id = ?1;", MapID, ModID, Label, Identifier, Difficulty, Official, Mask, Sort)
		      Else
		        Self.SQLExecute("INSERT INTO maps (object_id, content_pack_id, label, ark_identifier, difficulty_scale, official, mask, sort) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8);", MapID, ModID, Label, Identifier, Difficulty, Official, Mask, Sort)
		      End If
		    Next
		    Ark.Maps.ClearCache
		  End If
		  
		  #if Not DebugBuild
		    #Pragma Error "This won't work"
		  #endif
		  Var PresetModifiers() As Variant = ChangeDict.Value("preset_modifiers")
		  For Each Dict As Dictionary In PresetModifiers
		    If Dict.Value("min_version") > BuildNumber Then
		      Continue
		    End If
		    
		    Var ObjectID As v4UUID = Dict.Value("id").StringValue
		    Var Label As String = Dict.Value("label")
		    Var Pattern As String = Dict.Value("pattern")
		    Var AdvancedPattern As String = Dict.Lookup("advanced_pattern", "")
		    Var ModID As v4UUID = Dictionary(Dict.Value("mod")).Value("id").StringValue
		    
		    Var Language, Code As String
		    If AdvancedPattern.IsEmpty Then
		      Language = Ark.LootContainerSelector.LanguageJavaScript
		      Code = AdvancedPattern
		    Else
		      Language = Ark.LootContainerSelector.LanguageRegEx
		      Code = Pattern
		    End If
		    
		    Var Results As RowSet = Self.SQLSelect("SELECT object_id FROM loot_container_selectors WHERE object_id = ?1;", ObjectID.StringValue)
		    If Results.RowCount = 1 Then
		      Self.SQLExecute("UPDATE loot_container_selectors SET label = ?2, content_pack_id = ?3, language = ?4, code = ?5 WHERE object_id = ?1;", ObjectID.StringValue, Label, ModID.StringValue, Language, Code)
		    Else
		      Self.SQLExecute("INSERT INTO loot_container_selectors (object_id, label, content_pack_id, language, code) VALUES (?1, ?2, ?3, ?4, ?5);", ObjectID.StringValue, Label, ModID.StringValue, Language, Code)
		    End If
		  Next
		  
		  If ChangeDict.HasKey("help_topics") Then
		    Var HelpTopics() As Variant = ChangeDict.Value("help_topics")
		    For Each Dict As Dictionary In HelpTopics
		      Var ConfigName As String = Dict.Value("topic")
		      Var Title As String = Dict.Value("title")
		      Var Body As String = Dict.Value("body")
		      Var DetailURL As String
		      If Dict.Value("detail_url") <> Nil Then
		        DetailURL = Dict.Value("detail_url")
		      End If
		      
		      ConfigName = ConfigName.Lowercase
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT config_name FROM config_help WHERE config_name = ?1;", ConfigName)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE config_help SET title = ?2, body = ?3, detail_url = ?4 WHERE config_name = ?1;", ConfigName, Title, Body, DetailURL)
		      Else
		        Self.SQLExecute("INSERT INTO config_help (config_name, title, body, detail_url) VALUES (?1, ?2, ?3, ?4);", ConfigName, Title, Body, DetailURL)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("game_variables") Then
		    Var HelpTopics() As Variant = ChangeDict.Value("game_variables")
		    For Each Dict As Dictionary In HelpTopics
		      Var Key As String = Dict.Value("key")
		      Var Value As String = Dict.Value("value")
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT key FROM game_variables WHERE key = ?1;", Key)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE game_variables SET value = ?2 WHERE key = ?1;", Key, Value)
		      Else
		        Self.SQLExecute("INSERT INTO game_variables (key, value) VALUES (?1, ?2);", Key, Value)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("colors") Then
		    Var Colors() As Variant = ChangeDict.Value("colors")
		    For Each Dict As Dictionary In Colors
		      Var ColorID As Integer = Dict.Value("color_id")
		      Var ColorUUID As String = v4UUID.FromHash(Crypto.HashAlgorithms.MD5, "color " + ColorID.ToString(Locale.Raw, "0"))
		      Var Label As String = Dict.Value("label")
		      Var HexValue As String = Dict.Value("hex")
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT color_id FROM colors WHERE color_id = ?1;", ColorID)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE colors SET color_uuid = ?2, label = ?3, hex_value = ?4 WHERE color_id = ?1;", ColorID, ColorUUID, Label, HexValue)
		      Else
		        Self.SQLExecute("INSERT INTO colors (color_id, color_uuid, label, hex_value) VALUES (?1, ?2, ?3, ?4);", ColorID, ColorUUID, Label, HexValue)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("color_sets") Then
		    Var Sets() As Variant = ChangeDict.Value("color_sets")
		    For Each Dict As Dictionary In Sets
		      Var SetUUID As String = Dict.Value("color_set_id")
		      Var Label As String = Dict.Value("label")
		      Var ClassString As String = Dict.Value("class_string")
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT color_set_id FROM color_sets WHERE color_set_id = ?1;", SetUUID)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE color_sets SET label = ?2, class_string = ?3 WHERE color_set_id = ?1;", SetUUID, Label, ClassString)
		      Else
		        Self.SQLExecute("INSERT INTO color_sets (color_set_id, label, class_string) VALUES (?1, ?2, ?3);", SetUUID, Label, ClassString)
		      End If
		    Next
		  End If
		  
		  If ChangeDict.HasKey("events") Then
		    Var Events() As Variant = ChangeDict.Value("events")
		    For Each Dict As Dictionary In Events
		      Var EventID As String = Dict.Value("event_id")
		      Var Label As String = Dict.Value("label")
		      Var ArkCode As String = Dict.Value("ark_code")
		      Var Rates As String = Beacon.GenerateJSON(Dict.Value("rates"), False)
		      Var Colors As String = Beacon.GenerateJSON(Dict.Value("colors"), False)
		      Var Engrams As String = Beacon.GenerateJSON(Dict.Value("engrams"), False)
		      
		      Var Results As RowSet = Self.SQLSelect("SELECT event_id FROM events WHERE event_id = ?1;", EventID)
		      If Results.RowCount = 1 Then
		        Self.SQLExecute("UPDATE events SET label = ?2, ark_code = ?3, rates = ?4, colors = ?5, engrams = ?6 WHERE event_id = ?1;", EventID, Label, ArkCode, Rates, Colors, Engrams)
		      Else
		        Self.SQLExecute("INSERT INTO events (event_id, label, ark_code, rates, colors, engrams) VALUES (?1, ?2, ?3, ?4, ?5, ?6);", EventID, Label, ArkCode, Rates, Colors, Engrams)
		      End If
		    Next
		  End If
		  
		  Self.BuildIndexes()
		  
		  StatusData.Value("Engrams Changed") = EngramsChanged
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub ImportCleanup(StatusData As Dictionary)
		  Self.mContainerLabelCacheMask = 0
		  Self.mContainerLabelCacheDict = New Dictionary
		  Self.mSpawnLabelCacheMask = 0
		  Self.mSpawnLabelCacheDict = New Dictionary
		  
		  If StatusData.Lookup("Engrams Changed", False).BooleanValue Then
		    NotificationKit.Post(Self.Notification_EngramsChanged, Nil)
		  End If
		  
		  Self.mOfficialPlayerLevelData = Nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub ImportTruncate()
		  Self.SQLExecute("DELETE FROM blueprints WHERE content_pack_id != ?1;", Ark.UserContentPackUUID)
		  Self.SQLExecute("DELETE FROM ini_options WHERE content_pack_id != ?1;", Ark.UserContentPackUUID)
		  Self.SQLExecute("DELETE FROM content_packs WHERE is_local = 0") // Mods must be deleted last
		End Sub
	#tag EndEvent

	#tag Event
		Sub IndexesBuilt()
		  Self.SQLExecute("DROP VIEW IF EXISTS blueprints;")
		  Self.SQLExecute("CREATE VIEW blueprints AS SELECT object_id, class_string, path, label, tags, availability, content_pack_id, '" + Ark.CategoryEngrams + "' AS category FROM engrams UNION SELECT object_id, class_string, path, label, tags, availability, content_pack_id, '" + Ark.CategoryCreatures + "' AS category FROM creatures UNION SELECT object_id, class_string, path, label, tags, availability, content_pack_id, '" + Ark.CategorySpawnPoints + "' AS category FROM spawn_points UNION SELECT object_id, class_string, path, label, tags, availability, content_pack_id, '" + Ark.CategoryLootContainers + "' AS category FROM loot_containers")
		  Var DeleteStatements() As String
		  Var Categories() As String = Ark.Categories
		  For Each Category As String In Categories
		    DeleteStatements.Add("DELETE FROM " + Category + " WHERE object_id = OLD.object_id;")
		  Next
		  Self.SQLExecute("CREATE TRIGGER blueprints_delete_trigger INSTEAD OF DELETE ON blueprints FOR EACH ROW BEGIN " + String.FromArray(DeleteStatements, " ") + " DELETE FROM searchable_tags WHERE object_id = OLD.object_id; END;")
		  
		  Self.SQLExecute("DROP VIEW IF EXISTS loot_templates;")
		  Self.SQLExecute("CREATE VIEW loot_templates AS SELECT * FROM custom_loot_templates UNION SELECT * FROM official_loot_templates WHERE object_id NOT IN (SELECT object_id FROM custom_loot_templates);")
		End Sub
	#tag EndEvent

	#tag Event
		Sub TestPerformance()
		  Var TestDoc As New Ark.Project
		  Var Packs As Beacon.StringList = TestDoc.ContentPacks
		  Var Tags As String = Preferences.SelectedTag(Ark.CategoryEngrams, "8e58f9e4") // Use a strange subgroup here to always get the default
		  Call Self.GetBlueprints(Ark.CategoryEngrams, "", Packs, Tags)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddLootContainerSelector(ParamArray LootSelectors() As Ark.LootContainerSelector)
		  Self.AddLootContainerSelector(LootSelectors)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddLootContainerSelector(LootSelectors() As Ark.LootContainerSelector)
		  If LootSelectors Is Nil Or LootSelectors.Count = 0 Then
		    Return
		  End If
		  
		  Self.BeginTransaction()
		  
		  Var Rows As RowSet = Self.SQLSelect("SELECT changes();")
		  Var PreChanges As Integer = Rows.ColumnAt(0).IntegerValue
		  
		  For Each LootSelector As Ark.LootContainerSelector In LootSelectors
		    Var Results As RowSet = Self.SQLSelect("SELECT content_pack_id FROM loot_container_selectors WHERE object_id = ?1;", LootSelector.UUID)
		    If Results.RowCount = 1 Then
		      If Results.Column("content_pack_id").StringValue = Ark.UserContentPackUUID Then
		        Self.SQLExecute("UPDATE loot_container_selectors SET label = ?2, code = ?3, language = ?4 WHERE object_id = ?1 AND (label != ?2 OR code != OR language != ?4);", LootSelector.UUID, LootSelector.Label, LootSelector.Code, LootSelector.Language)
		      End If
		    Else
		      Self.SQLExecute("INSERT INTO loot_container_selectors (object_id, content_pack_id, label, code, language) VALUES (?1, ?2, ?3, ?4, ?5);", LootSelector.UUID, Ark.UserContentPackUUID, LootSelector.Label, LootSelector.Code, LootSelector.Language)
		    End If
		  Next
		  
		  Rows = Self.SQLSelect("SELECT changes();")
		  Var PostChanges As Integer = Rows.ColumnAt(0).IntegerValue
		  
		  Self.CommitTransaction()
		  
		  If PreChanges <> PostChanges Then
		    Self.BackupLootContainerSelectors()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BackupLootContainerSelectors()
		  If Self.InTransaction Then
		    // Do not write to disk while there is still a transaction running
		    Return
		  End If
		  
		  Var LootSelectors() As Ark.LootContainerSelector = Self.GetLootContainerSelectors(False, True)
		  Var Dictionaries() As Dictionary
		  For Each LootSelector As Ark.LootContainerSelector In LootSelectors
		    Dictionaries.Add(LootSelector.SaveData(False))
		  Next
		  
		  Var Content As String = Beacon.GenerateJSON(Dictionaries, True)
		  Call UserCloud.Write("/Modifiers.json", Content)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlueprintIsCustom(Item As Ark.Blueprint) As Boolean
		  If Item Is Nil Then
		    Return False
		  End If
		  
		  Var Rows As RowSet = Self.SQLSelect("SELECT is_local FROM content_packs WHERE content_pack_id = ?1;", Item.ContentPackUUID)
		  Return Rows.RowCount = 1 And Rows.Column("is_local").BooleanValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(Creatures() As Ark.Creature)
		  For Each Creature As Ark.Creature In Creatures
		    Self.mCreatureCache.Value(Creature.ObjectID) = Creature
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(Creature As Ark.Creature)
		  Var Arr(0) As Ark.Creature
		  Arr(0) = Creature
		  Self.Cache(Arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(Engrams() As Ark.Engram)
		  For Each Engram As Ark.Engram In Engrams
		    Self.mEngramCache.Value(Engram.ObjectID) = Engram
		    
		    If Engram.HasUnlockDetails Then
		      Var SimilarEngrams() As Ark.Engram
		      If Self.mEngramCache.HasKey(Engram.EntryString) Then
		        SimilarEngrams = Self.mEngramCache.Value(Engram.EntryString)
		      End If
		      
		      Var Found As Boolean
		      For Idx As Integer = 0 To SimilarEngrams.LastIndex
		        If SimilarEngrams(Idx).ObjectID = Engram.ObjectID Then
		          SimilarEngrams(Idx) = Engram
		          Found = True
		          Exit For Idx
		        End If
		      Next
		      If Not Found Then
		        SimilarEngrams.Add(Engram)
		      End If
		      Self.mEngramCache.Value(Engram.EntryString) = SimilarEngrams
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(Engram As Ark.Engram)
		  Var Arr(0) As Ark.Engram
		  Arr(0) = Engram
		  Self.Cache(Arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(LootContainers() As Ark.LootContainer)
		  For Each LootContainer As Ark.LootContainer In LootContainers
		    Self.mLootContainerCache.Value(LootContainer.ObjectID) = LootContainer
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(LootContainer As Ark.LootContainer)
		  Var Arr(0) As Ark.LootContainer
		  Arr(0) = LootContainer
		  Self.Cache(Arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(SpawnPoints() As Ark.SpawnPoint)
		  For Each SpawnPoint As Ark.SpawnPoint In SpawnPoints
		    Self.mSpawnPointCache.Value(SpawnPoint.ObjectID) = SpawnPoint
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Cache(SpawnPoint As Ark.SpawnPoint)
		  Var Arr(0) As Ark.SpawnPoint
		  Arr(0) = SpawnPoint
		  Self.Cache(Arr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Self.mEngramCache = New Dictionary
		  Self.mCreatureCache = New Dictionary
		  Self.mSpawnPointCache = New Dictionary
		  Self.mLootContainerCache = New Dictionary
		  Self.mConfigKeyCache = New Dictionary
		  Self.mSpawnLabelCacheDict = New Dictionary
		  Self.mLootTemplateCache = New Dictionary
		  Self.mIconCache = New Dictionary
		  Self.mContainerLabelCacheDict = New Dictionary
		  Self.mContainerLabelCacheMask = 0
		  
		  Super.Constructor()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateLocalContentPack(PackName As String) As Ark.ContentPack
		  Var PackUUID As String = New v4UUID
		  Var WorkshopID As UInt32 = CRC_32OfStrMBS(PackUUID)
		  Var Details As New Ark.ContentPack(PackUUID, PackName, False, False, True, WorkshopID)
		  Self.BeginTransaction()
		  Self.SQLExecute("INSERT OR IGNORE INTO content_packs (content_pack_id, name, workshop_id, console_safe, default_enabled, is_user_mod) VALUES (?1, ?2, ?3, ?4, ?5, ?6);", PackUUID, PackName, WorkshopID, True, False, True)
		  Self.CommitTransaction()
		  Self.SyncUserEngrams()
		  Return Details
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteContentPack(Pack As Ark.ContentPack) As Boolean
		  Return Self.DeleteContentPack(Pack.UUID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteContentPack(ContentPackUUID As String) As Boolean
		  Self.BeginTransaction()
		  
		  Var Rows As RowSet = Self.SQLSelect("SELECT content_pack_id FROM content_packs WHERE content_pack_id = ?1 AND is_local = 1;", ContentPackUUID)
		  If Rows.RowCount = 0 Then
		    Self.RollbackTransaction()
		    Return False
		  End If
		  
		  Self.DeleteDataForContentPack(ContentPackUUID)
		  Self.SQLExecute("DELETE FROM content_packs WHERE content_pack_id = ?1;", ContentPackUUID)
		  Self.CommitTransaction()
		  Self.SyncUserEngrams()
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteDataForContentPack(ContentPackUUID As String)
		  Self.BeginTransaction()
		  Self.SQLExecute("DELETE FROM blueprints WHERE content_pack_id = ?1;", ContentPackUUID)
		  Self.SQLExecute("DELETE FROM loot_container_selectors WHERE content_pack_id = ?1;", ContentPackUUID)
		  Self.CommitTransaction()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteLootContainerSelector(ParamArray LootSelectors() As Ark.LootContainerSelector) As Boolean
		  Return Self.DeleteLootContainerSelector(LootSelectors)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteLootContainerSelector(LootSelectors() As Ark.LootContainerSelector) As Boolean
		  Self.BeginTransaction()
		  For Each LootSelector As Ark.LootContainerSelector In LootSelectors
		    // Make sure this modifier is not in use
		    Self.SQLExecute("DELETE FROM loot_container_selectors WHERE content_pack_id = ?1 AND object_id = ?2;", Ark.UserContentPackUUID, LootSelector.UUID)
		  Next
		  Self.CommitTransaction()
		  Self.BackupLootContainerSelectors()
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBlueprints(SearchText As String = "", ContentPacks As Beacon.StringList = Nil, Tags As String = "") As Ark.Blueprint()
		  Var Categories() As String = Ark.Categories
		  Var Blueprints() As Ark.Blueprint
		  For Each Category As String In Categories
		    Var Results() As Ark.Blueprint = Self.GetBlueprints(Category, SearchText, ContentPacks, Tags)
		    For Each Result As Ark.Blueprint In Results
		      Blueprints.Add(Result)
		    Next
		  Next
		  Return Blueprints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBlueprints(Category As String, SearchText As String, ContentPacks As Beacon.StringList, Tags As String) As Ark.Blueprint()
		  Var ExtraClauses() As String
		  Var ExtraValues() As Variant
		  Return Self.GetBlueprints(Category, SearchText, ContentPacks, Tags, ExtraClauses, ExtraValues)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBlueprints(Category As String, SearchText As String, ContentPacks As Beacon.StringList, Tags As String, ExtraClauses() As String, ExtraValues() As Variant) As Ark.Blueprint()
		  Var Blueprints() As Ark.Blueprint
		  
		  Try
		    Var NextPlaceholder As Integer = 1
		    Var Clauses() As String
		    Var Values As New Dictionary
		    If SearchText <> "" Then
		      Clauses.Add("label LIKE ?" + NextPlaceholder.ToString(Locale.Raw, "0") + " ESCAPE '\' OR (alternate_label IS NOT NULL AND alternate_label LIKE ?" + NextPlaceholder.ToString(Locale.Raw, "0") + " ESCAPE '\') OR class_string LIKE ?" + NextPlaceholder.ToString(Locale.Raw, "0") + " ESCAPE '\'")
		      Values.Value(NextPlaceholder) = "%" + Self.EscapeLikeValue(SearchText) + "%"
		      NextPlaceholder = NextPlaceholder + 1
		    End If
		    
		    Var SQL As String
		    Select Case Category
		    Case Ark.CategoryEngrams
		      SQL = Self.EngramSelectSQL
		    Case Ark.CategoryCreatures
		      SQL = Self.CreatureSelectSQL
		    Case Ark.CategorySpawnPoints
		      SQL = Self.SpawnPointSelectSQL
		    Case Ark.CategoryLootContainers
		      SQL = Self.LootContainerSelectSQL
		    Else
		      Return Blueprints
		    End Select
		    
		    If ContentPacks <> Nil And ContentPacks.LastRowIndex > -1 Then
		      Var Placeholders() As String
		      For Each ContentPackUUIDID As String In ContentPacks
		        Placeholders.Add("?" + NextPlaceholder.ToString)
		        Values.Value(NextPlaceholder) = ContentPackUUIDID
		        NextPlaceholder = NextPlaceholder + 1
		      Next
		      Clauses.Add("content_packs.content_pack_id IN (" + Placeholders.Join(", ") + ")")
		    End If
		    If Tags <> "" Then
		      SQL = SQL.Replace(Category + " INNER JOIN content_packs", Category + " INNER JOIN searchable_tags ON (searchable_tags.object_id = " + Category + ".object_id AND searchable_tags.source_table = '" + Category + "') INNER JOIN content_packs")
		      Clauses.Add("searchable_tags.tags MATCH ?" + NextPlaceholder.ToString(Locale.Raw, "0"))
		      Values.Value(NextPlaceholder) = Tags
		      NextPlaceholder = NextPlaceholder + 1
		    End If
		    
		    If ExtraClauses.LastIndex > -1 And ExtraClauses.LastIndex = ExtraValues.LastIndex Then
		      For I As Integer = 0 To ExtraClauses.LastIndex
		        If ExtraClauses(I).IndexOf(":placeholder:") > -1 Then
		          Var Clause As String = ExtraClauses(I).ReplaceAll(":placeholder:", "?" + NextPlaceholder.ToString)
		          Var Value As Variant = ExtraValues(I)
		          Clauses.Add(Clause)
		          Values.Value(NextPlaceholder) = Value
		          NextPlaceholder = NextPlaceholder + 1
		        Else
		          Clauses.Add(ExtraClauses(I))
		        End If
		      Next
		    End If
		    
		    If Clauses.LastIndex > -1 Then
		      SQL = SQL + " WHERE (" + Clauses.Join(") AND (") + ")"
		    End If
		    SQL = SQL + " ORDER BY label;"
		    
		    Var Results As RowSet
		    #if false
		      Var StartTime As Double = System.Microseconds
		    #endif
		    If Values.KeyCount = 0 Then
		      Results = Self.SQLSelect(SQL)
		    Else
		      Results = Self.SQLSelect(SQL, Values)
		    End If
		    #if false
		      Var Duration As Double = System.Microseconds - StartTime
		      System.DebugLog("Searching for blueprints took " + Duration.ToString(Locale.Raw, "0") + " microseconds")
		      System.DebugLog("EXPLAIN QUERY PLAN " + SQL)
		    #endif
		    
		    Select Case Category
		    Case Ark.CategoryEngrams
		      Var Engrams() As Ark.Engram = Self.RowSetToEngram(Results)
		      Self.Cache(Engrams)
		      For Each Engram As Ark.Engram In Engrams
		        Blueprints.Add(Engram)
		      Next Engram
		    Case Ark.CategoryCreatures
		      Var Creatures() As Ark.Creature = Self.RowSetToCreature(Results)
		      Self.Cache(Creatures)
		      For Each Creature As Ark.Creature In Creatures
		        Blueprints.Add(Creature)
		      Next Creature
		    Case Ark.CategorySpawnPoints
		      Var SpawnPoints() As Ark.SpawnPoint = Self.RowSetToSpawnPoint(Results)
		      Self.Cache(SpawnPoints)
		      For Each SpawnPoint As Ark.SpawnPoint In SpawnPoints
		        Blueprints.Add(SpawnPoint)
		      Next SpawnPoint
		    Case Ark.CategoryLootContainers
		      Var LootContainers() As Ark.LootContainer = Self.RowSetToLootContainer(Results)
		      Self.Cache(LootContainers)
		      For Each LootContainer As Ark.LootContainer In LootContainers
		        Blueprints.Add(LootContainer)
		      Next LootContainer
		    End Select
		  Catch Err As RuntimeException
		    
		  End Try
		  
		  Return Blueprints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBooleanVariable(Key As String, Default As Boolean = False) As Boolean
		  Var Value As Variant = Self.GetVariable(Key, Default)
		  Return Value.BooleanValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigHelp(ConfigName As String, ByRef Title As String, ByRef Body As String, ByRef DetailURL As String) As Boolean
		  Try
		    Var Results As RowSet
		    Results = Self.SQLSelect("SELECT title, body, detail_url FROM config_help WHERE config_name = ?1;", ConfigName)
		    If Results.RowCount <> 1 Then
		      Return False
		    End If
		    
		    Title = Results.Column("title").StringValue
		    Body = Results.Column("body").StringValue
		    DetailURL = If(Results.Column("detail_url").Value <> Nil, Results.Column("detail_url").StringValue, "")
		    
		    Return True
		  Catch Err As RuntimeException
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigKey(KeyUUID As String) As Ark.ConfigKey
		  If Self.mConfigKeyCache.HasKey(KeyUUID) Then
		    Return Self.mConfigKeyCache.Value(KeyUUID)
		  End If
		  
		  Var Rows As RowSet = Self.SQLSelect(Self.ConfigKeySelectSQL + " WHERE object_id = ?1;", KeyUUID)
		  If Rows.RowCount <> 1 Then
		    Return Nil
		  End If
		  
		  Var Results() As Ark.ConfigKey = Self.RowSetToConfigKeys(Rows)
		  If Results.Count = 1 Then
		    Return Results(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigKey(File As String, Header As String, Key As String) As Ark.ConfigKey
		  Var Results() As Ark.ConfigKey = Self.GetConfigKeys(File, Header, Key, False)
		  If Results.Count = 1 Then
		    Return Results(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigKeys(File As String, Header As String, Key As String, SortHuman As Boolean) As Ark.ConfigKey()
		  Var Clauses() As String
		  Var Values As New Dictionary
		  Var Idx As Integer = 1
		  
		  If File = Ark.ConfigFileGameUserSettings Then
		    If Header.IsEmpty = False Then
		      Clauses.Add("((file = 'GameUserSettings.ini' AND header = ?" + Idx.ToString + ") OR file IN ('CommandLineFlag', 'CommandLineOption'))")
		      Values.Value(Idx) = Header
		      Idx = Idx + 1
		    Else
		      Clauses.Add("file IN ('GameUserSettings.ini', 'CommandLineFlag', 'CommandLineOption')")
		    End If
		  Else
		    If File.IsEmpty = False Then
		      If File = "CommandLine" Then
		        Clauses.Add("file IN ('CommandLineFlag', 'CommandLineOption')")
		      ElseIf File.IndexOf("*") > -1 Then
		        Values.Value(Idx) = Self.EscapeLikeValue(File).ReplaceAll("*", "%")
		        Clauses.Add("file LIKE ?" + Idx.ToString + " ESCAPE '\'")
		        Idx = Idx + 1
		      Else
		        Values.Value(Idx) = File
		        Clauses.Add("file = ?" + Idx.ToString)
		        Idx = Idx + 1
		      End If
		    End If
		    If Header.IsEmpty = False Then
		      Values.Value(Idx) = Header
		      Clauses.Add("header = ?" + Idx.ToString)
		      Idx = Idx + 1
		    End If
		  End If
		  If Key.IsEmpty = False Then
		    If Key.IndexOf("*") > -1 Then
		      Values.Value(Idx) = Self.EscapeLikeValue(Key).ReplaceAll("*", "%")
		      Clauses.Add("key LIKE ?" + Idx.ToString + " ESCAPE '\'")
		    Else
		      Values.Value(Idx) = Key
		      Clauses.Add("key = ?" + Idx.ToString)
		    End If
		    Idx = Idx + 1
		  End If
		  
		  Var SQL As String = Self.ConfigKeySelectSQL
		  If Clauses.Count > 0 Then
		    SQL = SQL + " WHERE " + Clauses.Join(" AND ")
		  End If
		  If SortHuman Then
		    SQL = SQL + " ORDER BY COALESCE(custom_sort, label)"
		  Else
		    SQL = SQL + " ORDER BY key"
		  End If
		  
		  Var Results() As Ark.ConfigKey
		  Try
		    Results = Self.RowSetToConfigKeys(Self.SQLSelect(SQL, Values))
		  Catch Err As RuntimeException
		    App.ReportException(Err)
		  End Try
		  Return Results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentPacks() As Ark.ContentPack()
		  Var Packs() As Ark.ContentPack
		  Var Results As RowSet = Self.SQLSelect("SELECT content_pack_id, name, console_safe, default_enabled, workshop_id, is_local FROM content_packs ORDER BY name;")
		  While Not Results.AfterLastRow
		    Packs.Add(New Ark.ContentPack(Results.Column("content_pack_id").StringValue, Results.Column("name").StringValue, Results.Column("console_safe").BooleanValue, Results.Column("default_enabled").BooleanValue, Results.Column("is_local").BooleanValue, NullableDouble.FromVariant(Results.Column("workshop_id").Value)))
		    Results.MoveToNextRow
		  Wend
		  Return Packs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentPackWithUUID(ContentPackUUID As String) As Ark.ContentPack
		  If v4UUID.IsValid(ContentPackUUID) = False Then
		    Return Nil
		  End If
		  
		  Var Results As RowSet = Self.SQLSelect("SELECT content_pack_id, name, console_safe, default_enabled, workshop_id, is_local FROM content_packs WHERE content_pack_id = ?1;", ContentPackUUID)
		  If Results.RowCount = 1 Then
		    Return New Ark.ContentPack(Results.Column("content_pack_id").StringValue, Results.Column("name").StringValue, Results.Column("console_safe").BooleanValue, Results.Column("default_enabled").BooleanValue, Results.Column("is_local").BooleanValue, NullableDouble.FromVariant(Results.Column("workshop_id").Value))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentPackWithWorkshopID(WorkshopID As Integer) As Ark.ContentPack
		  Var Results As RowSet = Self.SQLSelect("SELECT content_pack_id, name, console_safe, default_enabled, workshop_id, is_local FROM content_packs WHERE workshop_id IS NOT NULL AND workshop_id = ?1;", WorkshopID)
		  If Results.RowCount = 1 Then
		    Return New Ark.ContentPack(Results.Column("content_pack_id").StringValue, Results.Column("name").StringValue, Results.Column("console_safe").BooleanValue, Results.Column("default_enabled").BooleanValue, Results.Column("is_local").BooleanValue, NullableDouble.FromVariant(Results.Column("workshop_id").Value))
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureByUUID(CreatureID As String) As Ark.Creature
		  If Self.mCreatureCache.HasKey(CreatureID) Then
		    Return Self.mCreatureCache.Value(CreatureID)
		  End If
		  
		  Try
		    Var Results As RowSet = Self.SQLSelect(Self.CreatureSelectSQL + " WHERE object_id = ?1;", CreatureID)
		    If Results.RowCount <> 1 Then
		      Return Nil
		    End If
		    
		    Var Creatures() As Ark.Creature = Self.RowSetToCreature(Results)
		    Self.Cache(Creatures)
		    Return Creatures(0)
		  Catch Err As RuntimeException
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureColorByUUID(ID As Integer) As Ark.CreatureColor
		  Var Rows As RowSet = Self.SQLSelect(Self.CreatureColorSelectSQL + " WHERE color_id = ?1;", ID)
		  Var Colors() As Ark.CreatureColor = Self.RowSetToCreatureColors(Rows)
		  If Colors.Count = 1 Then
		    Return Colors(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureColors(Label As String = "") As Ark.CreatureColor()
		  Var Rows As RowSet = Self.SQLSelect(Self.CreatureColorSelectSQL + " WHERE label LIKE ?1 ESCAPE '\' ORDER BY label;", "%" + Self.EscapeLikeValue(Label) + "%")
		  Return Self.RowSetToCreatureColors(Rows)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureColorSetByClass(ClassString As String) As Ark.CreatureColorSet
		  Var Rows As RowSet = Self.SQLSelect(Self.CreatureColorSetSelectSQL + " WHERE class_string = ?1;", ClassString)
		  Var Sets() As Ark.CreatureColorSet = Self.RowSetToCreatureColorSets(Rows)
		  If Sets.Count = 1 Then
		    Return Sets(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureColorSetByUUID(UUID As String) As Ark.CreatureColorSet
		  Var Rows As RowSet = Self.SQLSelect(Self.CreatureColorSetSelectSQL + " WHERE color_set_id = ?1;", UUID)
		  Var Sets() As Ark.CreatureColorSet = Self.RowSetToCreatureColorSets(Rows)
		  If Sets.Count = 1 Then
		    Return Sets(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatureColorSets(Label As String = "") As Ark.CreatureColorSet()
		  Var Rows As RowSet = Self.SQLSelect(Self.CreatureColorSetSelectSQL + " WHERE label LIKE ?1 ESCAPE '\' ORDER BY label;", "%" + Self.EscapeLikeValue(Label) + "%")
		  Return Self.RowSetToCreatureColorSets(Rows)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreatures(SearchText As String = "", ContentPacks As Beacon.StringList = Nil, Tags As String = "") As Ark.Creature()
		  If ContentPacks Is Nil Then
		    ContentPacks = New Beacon.StringList
		  End If
		  Var Blueprints() As Ark.Blueprint = Self.GetBlueprints(Ark.CategoryCreatures, SearchText, ContentPacks, Tags)
		  Var Creatures() As Ark.Creature
		  For Each Blueprint As Ark.Blueprint In Blueprints
		    If Blueprint IsA Ark.Creature Then
		      Creatures.Add(Ark.Creature(Blueprint))
		    End If
		  Next
		  Return Creatures
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreaturesByClass(ClassString As String, ContentPacks As Beacon.StringList) As Ark.Creature()
		  Var SQL As String = Self.CreatureSelectSQL + " WHERE creatures.class_string = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND creatures.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, ClassString)
		  Var Creatures() As Ark.Creature = Self.RowSetToCreature(Rows)
		  Self.Cache(Creatures)
		  Return Creatures
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCreaturesByPath(Path As String, ContentPacks As Beacon.StringList) As Ark.Creature()
		  Var SQL As String = Self.CreatureSelectSQL + " WHERE creatures.path = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND creatures.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, Path)
		  Var Creatures() As Ark.Creature = Self.RowSetToCreature(Rows)
		  Self.Cache(Creatures)
		  Return Creatures
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDoubleVariable(Key As String, Default As Double = 0.0) As Double
		  Var Value As Variant = Self.GetVariable(Key, Default)
		  Return Value.DoubleValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramByItemID(ItemID As Integer) As Ark.Engram
		  Try
		    Var Results As RowSet = Self.SQLSelect(Self.EngramSelectSQL + " WHERE item_id = ?1;", ItemID)
		    If Results.RowCount = 0 Then
		      Return Nil
		    End If
		    
		    Var Engrams() As Ark.Engram = Self.RowSetToEngram(Results)
		    If Engrams.Count = 1 Then
		      Return Engrams(0)
		    End If
		  Catch Err As RuntimeException
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramByUUID(EngramID As String) As Ark.Engram
		  If Self.mEngramCache.HasKey(EngramID) = False Then
		    Try
		      Var Results As RowSet = Self.SQLSelect(Self.EngramSelectSQL + " WHERE object_id = ?1;", EngramID)
		      If Results.RowCount <> 1 Then
		        Return Nil
		      End If
		      
		      Var Engrams() As Ark.Engram = Self.RowSetToEngram(Results)
		      Self.Cache(Engrams)
		    Catch Err As RuntimeException
		      Return Nil
		    End Try
		  End If
		  Return Self.mEngramCache.Value(EngramID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramEntries(SearchText As String, ContentPacks As Beacon.StringList, Tags As String) As Ark.Engram()
		  Var ExtraClauses() As String = Array("entry_string IS NOT NULL")
		  Var ExtraValues(0) As Variant
		  Var Blueprints() As Ark.Blueprint = Self.GetBlueprints(Ark.CategoryEngrams, SearchText, ContentPacks, Tags, ExtraClauses, ExtraValues)
		  Var Engrams() As Ark.Engram
		  For Each Blueprint As Ark.Blueprint In Blueprints
		    If Blueprint IsA Ark.Engram Then
		      Engrams.Add(Ark.Engram(Blueprint))
		    End If
		  Next
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngrams(SearchText As String = "", ContentPacks As Beacon.StringList = Nil, Tags As String = "") As Ark.Engram()
		  If ContentPacks Is Nil Then
		    ContentPacks = New Beacon.StringList
		  End If
		  Var Blueprints() As Ark.Blueprint = Self.GetBlueprints(Ark.CategoryEngrams, SearchText, ContentPacks, Tags)
		  Var Engrams() As Ark.Engram
		  For Each Blueprint As Ark.Blueprint In Blueprints
		    If Blueprint IsA Ark.Engram Then
		      Engrams.Add(Ark.Engram(Blueprint))
		    End If
		  Next
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramsByClass(ClassString As String, ContentPacks As Beacon.StringList) As Ark.Engram()
		  Var SQL As String = Self.EngramSelectSQL + " WHERE engrams.class_string = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND engrams.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, ClassString)
		  Var Engrams() As Ark.Engram = Self.RowSetToEngram(Rows)
		  Self.Cache(Engrams)
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramsByEntryString(EntryString As String, ContentPacks As Beacon.StringList) As Ark.Engram()
		  If EntryString.Length < 2 Or EntryString.Right(2) <> "_C" Then
		    EntryString = EntryString + "_C"
		  End If
		  
		  Var Engrams() As Ark.Engram
		  If Self.mEngramCache.HasKey(EntryString) Then
		    Engrams = Self.mEngramCache.Value(EntryString)
		  Else
		    Var SQL As String = Self.EngramSelectSQL + " WHERE engrams.entry_string = ?1;"
		    If (ContentPacks Is Nil) = False Then
		      SQL = SQL.Left(SQL.Length - 1) + " AND engrams.content_pack_id IN (" + ContentPacks.SQLValue + ");"
		    End If
		    
		    Try
		      Var Results As RowSet = Self.SQLSelect(SQL, EntryString)
		      If Results.RowCount = 0 Then
		        Return Engrams
		      End If
		      
		      Engrams = Self.RowSetToEngram(Results)
		      Self.Cache(Engrams)
		    Catch Err As RuntimeException
		    End Try
		  End If
		  
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramsByPath(Path As String, ContentPacks As Beacon.StringList) As Ark.Engram()
		  Var SQL As String = Self.EngramSelectSQL + " WHERE engrams.path = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND engrams.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, Path)
		  Var Engrams() As Ark.Engram = Self.RowSetToEngram(Rows)
		  Self.Cache(Engrams)
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEngramUUIDsThatHaveCraftingCosts(ContentPacks As Beacon.StringList, Mask As UInt64) As String()
		  // I hate the name of this method
		  
		  Var SQL As String = "SELECT object_id FROM engrams WHERE recipe != '[]' AND (availability & " + Mask.ToString + ") > 0"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    Var List() As String
		    For Each ContentPackUUID As String In ContentPacks
		      List.Add("'" + ContentPackUUID + "'")
		    Next
		    SQL = SQL + " AND content_pack_id IN (" + List.Join(",") + ")"
		  End If
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL)
		  Var Results() As String
		  While Not Rows.AfterLastRow
		    Results.Add(Rows.Column("object_id").StringValue)
		    Rows.MoveToNextRow
		  Wend
		  Return Results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGameEventByArkCode(ArkCode As String) As Ark.GameEvent
		  Var Rows As RowSet = Self.SQLSelect(Self.GameEventSelectSQL + " WHERE ark_code = ?1;", ArkCode)
		  Var GameEvents() As Ark.GameEvent = Self.RowSetToGameEvents(Rows)
		  If GameEvents.Count = 1 Then
		    Return GameEvents(0)
		  Else
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGameEventByUUID(EventUUID As String) As Ark.GameEvent
		  Var Rows As RowSet = Self.SQLSelect(Self.GameEventSelectSQL + " WHERE event_id = ?1;", EventUUID)
		  Var GameEvents() As Ark.GameEvent = Self.RowSetToGameEvents(Rows)
		  If GameEvents.Count = 1 Then
		    Return GameEvents(0)
		  Else
		    Return Nil
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGameEvents(Label As String = "") As Ark.GameEvent()
		  Var Rows As RowSet = Self.SQLSelect(Self.GameEventSelectSQL + " WHERE label LIKE ?1 ESCAPE '\' ORDER BY label;", "%" + Self.EscapeLikeValue(Label) + "%")
		  Return Self.RowSetToGameEvents(Rows)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIntegerVariable(Key As String, Default As Integer = 0) As Integer
		  Var Value As Variant = Self.GetVariable(Key, Default)
		  Return Value.IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainerByUUID(LootContainerUUID As String) As Ark.LootContainer
		  If Self.mLootContainerCache.HasKey(LootContainerUUID) = False Then
		    Try
		      Var Results As RowSet = Self.SQLSelect(Self.LootContainerSelectSQL + " WHERE object_id = ?1;", LootContainerUUID)
		      If Results.RowCount <> 1 Then
		        Return Nil
		      End If
		      
		      Var LootContainers() As Ark.LootContainer = Self.RowSetToLootContainer(Results)
		      Self.Cache(LootContainers)
		    Catch Err As RuntimeException
		      Return Nil
		    End Try
		  End If
		  Return Self.mLootContainerCache.Value(LootContainerUUID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainerIcon(Container As Ark.LootContainer, BackgroundColor As Color) As Picture
		  Var ForegroundColor As Color = Container.UIColor
		  Select Case ForegroundColor
		  Case &cFFF02A00
		    ForegroundColor = SystemColors.SystemYellowColor
		  Case &cE6BAFF00
		    ForegroundColor = SystemColors.SystemPurpleColor
		  Case &c00FF0000
		    ForegroundColor = SystemColors.SystemGreenColor
		  Case &cFFBABA00
		    ForegroundColor = SystemColors.SystemRedColor
		  Case &c88C8FF00
		    ForegroundColor = SystemColors.SystemBlueColor
		  Case &c00FFFF00
		    ForegroundColor = SystemColors.SystemTealColor
		  Case &cFFA50000
		    ForegroundColor = SystemColors.SystemOrangeColor
		  End Select
		  
		  Return Self.GetLootContainerIcon(Container, ForegroundColor, BackgroundColor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainerIcon(Container As Ark.LootContainer, ForegroundColor As Color, BackgroundColor As Color) As Picture
		  // "Fix" background color to account for opacity. It's not perfect, but it's good.
		  Var BackgroundOpacity As Double = (255 - BackgroundColor.Alpha) / 255
		  BackgroundColor = SystemColors.UnderPageBackgroundColor.BlendWith(Color.RGB(BackgroundColor.Red, BackgroundColor.Green, BackgroundColor.Blue), BackgroundOpacity)
		  
		  Var AccentColor As Color
		  Var IconID As String
		  Var SpriteSheet, BadgeSheet As Picture
		  Var Results As RowSet
		  Try
		    Results = Self.SQLSelect("SELECT loot_icons.icon_id, loot_icons.icon_data, loot_containers.experimental FROM loot_containers INNER JOIN loot_icons ON (loot_containers.icon = loot_icons.icon_id) WHERE loot_containers.content_pack_id = ?1 AND loot_conatiners.path = ?2 LIMIT 1;", Container.ContentPackUUID, Container.Path)
		  Catch Err As RuntimeException
		    App.Log(Err, CurrentMethodName, "ContentPackUUID: " + Container.ContentPackUUID + " Path: " + Container.Path)
		  End Try
		  If (Results Is Nil) = False And Results.RowCount = 1 Then
		    SpriteSheet = Results.Column("icon_data").PictureValue
		    IconID = Results.Column("icon_id").StringValue
		  Else
		    SpriteSheet = App.GenericLootSourceIcon()
		    IconID = "3a1f5d12-0b50-4761-9f89-277492dc00e0"
		  End If
		  AccentColor = BackgroundColor
		  
		  IconID = IconID + ForegroundColor.ToHex + BackgroundColor.ToHex
		  If Self.mIconCache.HasKey(IconID) Then
		    Return Self.mIconCache.Value(IconID)
		  End If
		  
		  ForegroundColor = BeaconUI.FindContrastingColor(BackgroundColor, ForegroundColor)
		  
		  Var Height As Integer = (SpriteSheet.Height / 2) / 3
		  Var Width As Integer = (SpriteSheet.Width / 2) / 3
		  
		  If BadgeSheet <> Nil Then
		    Var BadgesMask As New Picture(BadgeSheet.Width, BadgeSheet.Height)
		    BadgesMask.Graphics.DrawingColor = &cFFFFFF
		    BadgesMask.Graphics.FillRectangle(0, 0, BadgesMask.Width, BadgesMask.Height)
		    BadgesMask.Graphics.DrawPicture(BadgeSheet, 0, 0)
		    
		    Var Badges As Picture = New Picture(BadgeSheet.Width, BadgeSheet.Height)
		    Badges.Graphics.DrawingColor = &cFFFFFF
		    Badges.Graphics.FillRectangle(0, 0, Badges.Graphics.Width, Badges.Graphics.Height)
		    Badges.ApplyMask(BadgesMask)
		    
		    Var Sprites As Picture = New Picture(SpriteSheet.Width, SpriteSheet.Height)
		    Sprites.Graphics.DrawPicture(SpriteSheet, 0, 0)
		    Sprites.Graphics.DrawPicture(Badges.Piece(0, 0, Width, Height), 0, Height)
		    Sprites.Graphics.DrawPicture(Badges.Piece(Width, 0, Width * 2, Height * 2), Width, Height * 2)
		    Sprites.Graphics.DrawPicture(Badges.Piece(Width * 3, 0, Width * 3, Height * 3), Width * 3, Height * 3)
		    Badges.Graphics.DrawingColor = &c000000
		    Badges.Graphics.FillRectangle(0, 0, Badges.Graphics.Width, Badges.Graphics.Height)
		    Sprites.Graphics.DrawPicture(Badges, 0, 0)
		    
		    SpriteSheet = Sprites
		  End If
		  
		  Var Highlight1x As Picture = SpriteSheet.Piece(0, 0, Width, Height)
		  Var Highlight2x As Picture = SpriteSheet.Piece(Width, 0, Width * 2, Height * 2)
		  Var Highlight3x As Picture = SpriteSheet.Piece(Width * 3, 0, Width * 3, Height * 3)
		  Var HighlightMask As New Picture(Width, Height, Array(Highlight1x, Highlight2x, Highlight3x))
		  
		  Var Color1x As Picture = SpriteSheet.Piece(0, Height, Width, Height)
		  Var Color2x As Picture = SpriteSheet.Piece(Width, Height * 2, Width * 2, Height * 2)
		  Var Color3x As Picture = SpriteSheet.Piece(Width * 3, Height * 3, Width * 3, Height * 3)
		  Var ColorMask As New Picture(Width, Height, Array(Color1x, Color2x, Color3x))
		  
		  Var Highlight As Picture = HighlightMask.WithColor(ForegroundColor)
		  Var Fill As Picture = ColorMask.WithColor(AccentColor)
		  
		  Var Bitmaps() As Picture
		  For Factor As Integer = 1 To 3
		    Var HighlightRep As Picture = Highlight.BestRepresentation(Width, Height, Factor)
		    Var ColorRep As Picture = Fill.BestRepresentation(Width, Height, Factor)
		    
		    Var Combined As New Picture(Width * Factor, Width * Factor)
		    Combined.VerticalResolution = 72 * Factor
		    Combined.HorizontalResolution = 72 * Factor
		    Combined.Graphics.DrawPicture(HighlightRep, 0, 0, Combined.Width, Combined.Height, 0, 0, HighlightRep.Width, HighlightRep.Height)
		    Combined.Graphics.DrawPicture(ColorRep, 0, 0, Combined.Width, Combined.Height, 0, 0, ColorRep.Width, ColorRep.Height)
		    
		    Bitmaps.Add(Combined)
		  Next
		  
		  Var Icon As New Picture(Width, Height, Bitmaps)
		  Self.mIconCache.Value(IconID) = Icon
		  Return Icon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainers(SearchText As String = "", ContentPacks As Beacon.StringList = Nil, Tags As String = "", IncludeExperimental As Boolean = False) As Ark.LootContainer()
		  #Pragma Unused Tags
		  #Pragma Warning "Tags could be used here"
		  
		  Var Containers() As Ark.LootContainer
		  
		  Try
		    Var Clauses() As String
		    Var Values As New Dictionary
		    Var NextPlaceholder As Integer = 1
		    If (ContentPacks Is Nil) = False And CType(ContentPacks.Count, Integer) > 0 Then
		      Var Placeholders() As String
		      For Each ContentPackUUID As String In ContentPacks
		        Placeholders.Add("?" + NextPlaceholder.ToString(Locale.Raw, "0"))
		        Values.Value(NextPlaceholder) = ContentPackUUID
		        NextPlaceholder = NextPlaceholder + 1
		      Next
		      Clauses.Add("content_packs.content_pack_id IN (" + Placeholders.Join(", ") + ")")
		    End If
		    If SearchText.IsEmpty = False Then
		      Clauses.Add("label LIKE ?" + NextPlaceholder.ToString(Locale.Raw, "0") + " ESCAPE '\' OR class_string LIKE ?" + NextPlaceholder.ToString(Locale.Raw, "0") + " ESCAPE '\'")
		      Values.Value(NextPlaceholder) = "%" + Self.EscapeLikeValue(SearchText) + "%"
		      NextPlaceholder = NextPlaceholder + 1
		    End If
		    If IncludeExperimental = False Then
		      Clauses.Add("experimental = 0")
		    End If
		    
		    Var SQL As String = Self.LootContainerSelectSQL
		    If Clauses.LastIndex > -1 Then
		      SQL = SQL + " WHERE (" + Clauses.Join(") AND (") + ")"
		    End If
		    SQL = SQL + " ORDER BY loot_containers.sort_order, loot_containers.label;"
		    
		    Var Results As RowSet
		    If Values.KeyCount > 0 Then
		      Results = Self.SQLSelect(SQL, Values)
		    Else
		      Results = Self.SQLSelect(SQL)
		    End If
		    
		    Containers = Self.RowSetToLootContainer(Results)
		  Catch Err As RuntimeException
		    
		  End Try
		  
		  Return Containers
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainersByClass(ClassString As String, ContentPacks As Beacon.StringList) As Ark.LootContainer()
		  Var SQL As String = Self.LootContainerSelectSQL + " WHERE loot_containers.class_string = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND loot_containers.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, ClassString)
		  Var LootContainers() As Ark.LootContainer = Self.RowSetToLootContainer(Rows)
		  Self.Cache(LootContainers)
		  Return LootContainers
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainersByPath(Path As String, ContentPacks As Beacon.StringList) As Ark.LootContainer()
		  Var SQL As String = Self.LootContainerSelectSQL + " WHERE loot_containers.path = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND loot_containers.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, Path)
		  Var LootContainers() As Ark.LootContainer = Self.RowSetToLootContainer(Rows)
		  Self.Cache(LootContainers)
		  Return LootContainers
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainerSelector(SelectorUUID As String) As Ark.LootContainerSelector
		  Var Results As RowSet = Self.SQLSelect("SELECT object_id, label, language, code FROM loot_container_selectors WHERE object_id = ?1;", SelectorUUID)
		  If Results.RowCount <> 1 Then
		    Return Nil
		  End If
		  
		  Return New Ark.LootContainerSelector(Results.Column("object_id").StringValue, Results.Column("label").StringValue, Results.Column("language").StringValue, Results.Column("code").StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootContainerSelectors(IncludeOfficial As Boolean = True, IncludeCustom As Boolean = True) As Ark.LootContainerSelector()
		  Var Selectors() As Ark.LootContainerSelector
		  
		  Var SQL As String = "SELECT object_id, label, language, code FROM loot_container_selectors"
		  If IncludeOfficial = False And IncludeCustom = True Then
		    SQL = SQL + " WHERE content_pack_id = '" + Ark.UserContentPackUUID + "'"
		  ElseIf IncludeOfficial = True And IncludeCustom = False Then
		    SQL = SQL + " WHERE content_pack_id != '" + Ark.UserContentPackUUID + "'"
		  ElseIf IncludeOfficial = False And IncludeCustom = False Then
		    Return Selectors
		  End If
		  SQL = SQL + " ORDER BY label;"
		  
		  Var Results As RowSet = Self.SQLSelect(SQL)
		  While Not Results.AfterLastRow
		    Selectors.Add(New Ark.LootContainerSelector(Results.Column("object_id").StringValue, Results.Column("label").StringValue, Results.Column("language").StringValue, Results.Column("code").StringValue))
		    Results.MoveToNextRow
		  Wend
		  Return Selectors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootTemplateByUUID(UUID As String) As Ark.LootTemplate
		  If Self.mLootTemplateCache.HasKey(UUID) Then
		    Return Self.mLootTemplateCache.Value(UUID)
		  End If
		  
		  Var Rows As RowSet = Self.SQLSelect("SELECT contents FROM custom_loot_templates WHERE object_id = ?1;", UUID)
		  If Rows.RowCount = 0 Then
		    Rows = Self.SQLSelect("SELECT contents FROM official_loot_templates WHERE object_id = ?1;", UUID)
		    If Rows.RowCount = 0 Then
		      Return Nil
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLootTemplates(Filter As String = "") As Ark.LootTemplate()
		  Var Rows As RowSet = Self.SQLSelect("SELECT object_id, contents FROM loot_templates WHERE label LIKE ?1 ESCAPE '\';", Self.EscapeLikeValue(Filter))
		  Var Templates() As Ark.LootTemplate
		  While Rows.AfterLastRow = False
		    Var UUID As String = Rows.Column("object_id").StringValue
		    If Self.mLootTemplateCache.HasKey(UUID) Then
		      Templates.Add(Self.mLootTemplateCache.Value(UUID))
		      Rows.MoveToNextRow
		      Continue
		    End If
		    
		    
		    
		    Rows.MoveToNextRow
		  Wend
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMap(Named As String) As Ark.Map
		  Var Rows As RowSet = Self.SQLSelect("SELECT * FROM maps WHERE label = ?1 OR ark_identifier = ?1 LIMIT 1;", Named)
		  If Rows.RowCount <> 1 Then
		    Return Nil
		  End If
		  
		  Return New Ark.Map(Rows.Column("label").StringValue, Rows.Column("ark_identifier").StringValue, Rows.Column("mask").Value.UInt64Value, Rows.Column("difficulty_scale").DoubleValue, Rows.Column("official").BooleanValue, Rows.Column("content_pack_id").StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMaps() As Ark.Map()
		  Var Rows As RowSet = Self.SQLSelect("SELECT * FROM maps ORDER BY official DESC, sort;")
		  Var Maps() As Ark.Map
		  While Rows.AfterLastRow = False
		    Maps.Add(New Ark.Map(Rows.Column("label").StringValue, Rows.Column("ark_identifier").StringValue, Rows.Column("mask").Value.UInt64Value, Rows.Column("difficulty_scale").DoubleValue, Rows.Column("official").BooleanValue, Rows.Column("content_pack_id").StringValue))
		    Rows.MoveToNextRow
		  Wend
		  Return Maps
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMaps(Mask As UInt64) As Ark.Map()
		  Var Rows As RowSet = Self.SQLSelect("SELECT * FROM maps WHERE (mask & ?1) = mask ORDER BY official DESC, sort;", Mask)
		  Var Maps() As Ark.Map
		  While Rows.AfterLastRow = False
		    Maps.Add(New Ark.Map(Rows.Column("label").StringValue, Rows.Column("ark_identifier").StringValue, Rows.Column("mask").Value.UInt64Value, Rows.Column("difficulty_scale").DoubleValue, Rows.Column("official").BooleanValue, Rows.Column("content_pack_id").StringValue))
		    Rows.MoveToNextRow
		  Wend
		  Return Maps
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPointByUUID(SpawnPointID As String) As Ark.SpawnPoint
		  If Self.mSpawnPointCache.HasKey(SpawnPointID) = False Then
		    Try
		      Var Results As RowSet = Self.SQLSelect(Self.SpawnPointSelectSQL + " WHERE object_id = ?1;", SpawnPointID)
		      If Results.RowCount <> 1 Then
		        Return Nil
		      End If
		      
		      Var SpawnPoints() As Ark.SpawnPoint = Self.RowSetToSpawnPoint(Results)
		      Self.Cache(SpawnPoints)
		    Catch Err As RuntimeException
		      Return Nil
		    End Try
		  End If
		  Return Self.mSpawnPointCache.Value(SpawnPointID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPointLabels(Availability As UInt64) As Dictionary
		  If Self.mSpawnLabelCacheMask <> Availability Then
		    Var Points() As Ark.SpawnPoint = Self.GetSpawnPoints()
		    Var Labels() As String
		    Var Dict As New Dictionary
		    Labels.ResizeTo(Points.LastIndex)
		    
		    For I As Integer = 0 To Points.LastIndex
		      If Points(I).ValidForMask(Availability) = False Then
		        Continue
		      End If
		      
		      Var Label As String = Points(I).Label
		      Var Idx As Integer = Labels.IndexOf(Label)
		      Labels(I) = Label
		      If Idx > -1 Then
		        Var Filtered As UInt64 = Points(Idx).Availability And Availability
		        Var Maps() As Ark.Map = Self.GetMaps(Filtered)
		        Dict.Value(Points(Idx).ObjectID) = Points(Idx).Label.Disambiguate(Maps.Label)
		        
		        Filtered = Points(I).Availability And Availability
		        Maps = Self.GetMaps(Filtered)
		        Label = Label.Disambiguate(Maps.Label)
		      End If
		      
		      Dict.Value(Points(I).ObjectID) = Label
		    Next
		    
		    Self.mSpawnLabelCacheDict = Dict
		    Self.mSpawnLabelCacheMask = Availability
		  End If
		  
		  Return Self.mSpawnLabelCacheDict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPoints(SearchText As String = "", ContentPacks As Beacon.StringList = Nil, Tags As String = "") As Ark.SpawnPoint()
		  If ContentPacks Is Nil Then
		    ContentPacks = New Beacon.StringList
		  End If
		  Var Blueprints() As Ark.Blueprint = Self.GetBlueprints(Ark.CategorySpawnPoints, SearchText, ContentPacks, Tags)
		  Var Points() As Ark.SpawnPoint
		  For Each Blueprint As Ark.Blueprint In Blueprints
		    If Blueprint IsA Ark.SpawnPoint Then
		      Points.Add(Ark.SpawnPoint(Blueprint))
		    End If
		  Next
		  Return Points
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPointsByClass(ClassString As String, ContentPacks As Beacon.StringList) As Ark.SpawnPoint()
		  Var SQL As String = Self.SpawnPointSelectSQL + " WHERE spawn_points.class_string = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND spawn_points.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, ClassString)
		  Var SpawnPoints() As Ark.SpawnPoint = Self.RowSetToSpawnPoint(Rows)
		  Self.Cache(SpawnPoints)
		  Return SpawnPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPointsByPath(Path As String, ContentPacks As Beacon.StringList) As Ark.SpawnPoint()
		  Var SQL As String = Self.SpawnPointSelectSQL + " WHERE spawn_points.path = ?1"
		  If (ContentPacks Is Nil) = False And ContentPacks.Count > CType(0, UInteger) Then
		    SQL = SQL + " AND spawn_points.content_pack_id IN (" + ContentPacks.SQLValue + ")"
		  End If
		  SQL = SQL + ";"
		  
		  Var Rows As RowSet = Self.SQLSelect(SQL, Path)
		  Var SpawnPoints() As Ark.SpawnPoint = Self.RowSetToSpawnPoint(Rows)
		  Self.Cache(SpawnPoints)
		  Return SpawnPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSpawnPointsForCreature(Creature As Ark.Creature, ContentPacks As Beacon.StringList, Tags As String) As Ark.SpawnPoint()
		  Var Clauses() As String
		  Var Values() As Variant
		  Clauses.Add("spawn_points.sets LIKE :placeholder:")
		  Values.Add("%" + Creature.ObjectID + "%")
		  
		  Var Blueprints() As Ark.Blueprint = Self.GetBlueprints(Ark.CategorySpawnPoints, "", ContentPacks, Tags, Clauses, Values)
		  Var SpawnPoints() As Ark.SpawnPoint
		  For Each Blueprint As Ark.Blueprint In Blueprints
		    If Blueprint IsA Ark.SpawnPoint Then
		      SpawnPoints.Add(Ark.SpawnPoint(Blueprint))
		    End If
		  Next
		  
		  Return SpawnPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringVariable(Key As String, Default As String = "") As String
		  Var Value As Variant = Self.GetVariable(Key, Default)
		  Var StringValue As String = Value.StringValue
		  If StringValue.Encoding = Nil Then
		    If Encodings.UTF8.IsValidData(StringValue) Then
		      StringValue = StringValue.DefineEncoding(Encodings.UTF8)
		    Else
		      Return Default
		    End If
		  End If
		  Return StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTags(Category As String = "") As String()
		  Var Results As RowSet
		  If Category <> "" Then
		    Results = Self.SQLSelect("SELECT DISTINCT tags FROM searchable_tags WHERE source_table = ?1 AND tags != '';", Category)
		  Else
		    Results = Self.SQLSelect("SELECT DISTINCT tags FROM searchable_tags WHERE tags != '';")
		  End If
		  Var Dict As New Dictionary
		  While Not Results.AfterLastRow
		    Var Tags() As String = Results.Column("tags").StringValue.Split(",")
		    For Each Tag As String In Tags
		      If Tag <> "object" Then
		        Dict.Value(Tag) = True
		      End If
		    Next
		    Results.MoveToNextRow
		  Wend
		  
		  Var Keys() As Variant = Dict.Keys
		  Var Tags() As String
		  For Each Key As String In Keys
		    Tags.Add(Key)
		  Next
		  Tags.Sort
		  
		  Return Tags
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVariable(Key As String, Default As Variant = Nil) As Variant
		  Var Results As RowSet = Self.SQLSelect("SELECT value FROM game_variables WHERE key = ?1;", Key)
		  If Results.RowCount = 1 Then
		    Return Results.Column("value").Value
		  Else
		    Return Default
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasExperimentalLootContainers(ContentPacks As Beacon.StringList) As Boolean
		  Try
		    Var Clauses(0) As String
		    Clauses(0) = "experimental = 1"
		    
		    Var Values As New Dictionary
		    Var NextPlaceholder As Integer = 1
		    If ContentPacks.LastRowIndex > -1 Then
		      Var Placeholders() As String
		      For Each PackUUID As String In ContentPacks
		        Placeholders.Add("?" + NextPlaceholder.ToString(Locale.Raw, "0"))
		        Values.Value(NextPlaceholder) = PackUUID
		        NextPlaceholder = NextPlaceholder + 1
		      Next
		      Clauses.Add("content_packs.content_pack_id IN (" + Placeholders.Join(", ") + ")")
		    End If
		    
		    Var SQL As String = "SELECT COUNT(loot_containers.object_id) FROM loot_containers INNER JOIN content_packs ON (loot_containers.content_pack_id = content_packs.content_pack_id) WHERE (" + Clauses.Join(") AND (") + ");"
		    Var Results As RowSet
		    If Values.KeyCount > 0 Then
		      Results = Self.SQLSelect(SQL, Values)
		    Else
		      Results = Self.SQLSelect(SQL)
		    End If
		    Return Results.ColumnAt(0).IntegerValue > 0
		  Catch Err As RuntimeException
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Identifier() As String
		  Return Ark.Identifier
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDefaults(SpawnPoint As Ark.MutableSpawnPoint)
		  If SpawnPoint Is Nil Then
		    Return
		  End If
		  
		  Var Rows As RowSet = Self.SQLSelect("SELECT sets, limits FROM spawn_points WHERE object_id = ?1;", SpawnPoint.ObjectID)
		  If Rows.RowCount = 0 Then
		    Return
		  End If
		  
		  SpawnPoint.SetsString = Rows.Column("sets").StringValue
		  SpawnPoint.LimitsString = Rows.Column("limits").StringValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadIngredientsForEngram(Engram As Ark.Engram) As Ark.CraftingCostIngredient()
		  Var Ingredients() As Ark.CraftingCostIngredient
		  If (Engram Is Nil) = False Then
		    Var Results As RowSet = Self.SQLSelect("SELECT recipe FROM engrams WHERE object_id = ?1;", Engram.ObjectID)
		    If Results.RowCount = 1 Then
		      Ingredients = Ark.CraftingCostIngredient.FromVariant(Results.Column("recipe").Value, Nil)
		    End If
		  End If
		  Return Ingredients
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OfficialPlayerLevelData() As Ark.PlayerLevelData
		  If Self.mOfficialPlayerLevelData Is Nil Then
		    Self.mOfficialPlayerLevelData = Ark.PlayerLevelData.FromString(Self.GetStringVariable("Player Leveling"))
		  End If
		  Return Self.mOfficialPlayerLevelData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResolvePathFromClassString(ClassString As String) As String
		  Var Results As RowSet = Self.SQLSelect("SELECT path FROM blueprints WHERE class_string = ?1;", ClassString)
		  If Results.RowCount = 0 Then
		    Return ""
		  End If
		  
		  Return Results.Column("path").StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToConfigKeys(Results As RowSet) As Ark.ConfigKey()
		  Var Keys() As Ark.ConfigKey
		  Try
		    While Results.AfterLastRow = False
		      Var ObjectID As String = Results.Column("object_id").StringValue
		      If Self.mConfigKeyCache.HasKey(ObjectID) Then
		        Results.MoveToNextRow
		        Keys.Add(Self.mConfigKeyCache.Value(ObjectID))
		        Continue
		      End If
		      
		      Var Label As String = Results.Column("label").StringValue
		      Var ConfigFile As String = Results.Column("file").StringValue
		      Var ConfigHeader As String = Results.Column("header").StringValue
		      Var ConfigKey As String = Results.Column("key").StringValue
		      Var ValueType As Ark.ConfigKey.ValueTypes
		      Select Case Results.Column("value_type").StringValue
		      Case "Numeric"
		        ValueType = Ark.ConfigKey.ValueTypes.TypeNumeric
		      Case "Array"
		        ValueType = Ark.ConfigKey.ValueTypes.TypeArray
		      Case "Structure"
		        ValueType = Ark.ConfigKey.ValueTypes.TypeStructure
		      Case "Boolean"
		        ValueType = Ark.ConfigKey.ValueTypes.TypeBoolean
		      Case "Text"
		        ValueType = Ark.ConfigKey.ValueTypes.TypeText
		      End Select
		      Var MaxAllowed As NullableDouble
		      If IsNull(Results.Column("max_allowed").Value) = False Then
		        MaxAllowed = Results.Column("max_allowed").IntegerValue
		      End If
		      Var Description As String = Results.Column("description").StringValue
		      Var DefaultValue As Variant = Results.Column("default_value").Value
		      Var NitradoPath As NullableString
		      Var NitradoFormat As Ark.ConfigKey.NitradoFormats = Ark.ConfigKey.NitradoFormats.Unsupported
		      Var NitradoDeployStyle As Ark.ConfigKey.NitradoDeployStyles = Ark.ConfigKey.NitradoDeployStyles.Unsupported
		      If IsNull(Results.Column("nitrado_format").Value) = False Then
		        NitradoPath = Results.Column("nitrado_path").StringValue
		        Select Case Results.Column("nitrado_format").StringValue
		        Case "Line"
		          NitradoFormat = Ark.ConfigKey.NitradoFormats.Line
		        Case "Value"
		          NitradoFormat = Ark.ConfigKey.NitradoFormats.Value
		        End Select
		        Select Case Results.Column("nitrado_deploy_style").StringValue
		        Case "Guided"
		          NitradoDeployStyle = Ark.ConfigKey.NitradoDeployStyles.Guided
		        Case "Expert"
		          NitradoDeployStyle = Ark.ConfigKey.NitradoDeployStyles.Expert
		        Case "Both"
		          NitradoDeployStyle = Ark.ConfigKey.NitradoDeployStyles.Both
		        End Select
		      End If
		      Var NativeEditorVersion As NullableDouble = NullableDouble.FromVariant(Results.Column("native_editor_version").Value)
		      Var UIGroup As NullableString = NullableString.FromVariant(Results.Column("ui_group").Value)
		      Var CustomSort As NullableString = NullableString.FromVariant(Results.Column("custom_sort").Value)
		      Var ContentPackUUIDID As String = Results.Column("content_pack_id").StringValue
		      
		      Var Constraints As Dictionary
		      If IsNull(Results.Column("constraints").Value) = False Then
		        Try
		          Var Parsed As Variant = Beacon.ParseJSON(Results.Column("constraints").StringValue)
		          If IsNull(Parsed) = False And Parsed IsA Dictionary Then
		            Constraints = Parsed
		          End If
		        Catch JSONErr As JSONException
		        End Try
		      End If
		      
		      Var Key As New Ark.ConfigKey(ObjectID, Label, ConfigFile, ConfigHeader, ConfigKey, ValueType, MaxAllowed, Description, DefaultValue, NitradoPath, NitradoFormat, NitradoDeployStyle, NativeEditorVersion, UIGroup, CustomSort, Constraints, ContentPackUUIDID)
		      Self.mConfigKeyCache.Value(ObjectID) = Key
		      Keys.Add(Key)
		      Results.MoveToNextRow
		    Wend
		  Catch Err As RuntimeException
		    App.ReportException(Err)
		    Keys.ResizeTo(-1)
		  End Try
		  Return Keys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToCreature(Results As RowSet) As Ark.Creature()
		  Var Creatures() As Ark.Creature
		  While Not Results.AfterLastRow
		    Var CreatureID As String = Results.Column("object_id").StringValue
		    If Self.mCreatureCache.HasKey(CreatureID) = False Then
		      Var Creature As New Ark.MutableCreature(Results.Column("path").StringValue, CreatureID)
		      Creature.Label = Results.Column("label").StringValue
		      If IsNull(Results.Column("alternate_label").Value) = False Then
		        Creature.AlternateLabel = Results.Column("alternate_label").StringValue
		      End If
		      Creature.Availability = Results.Column("availability").Value
		      Creature.TagString = Results.Column("tags").StringValue
		      Creature.ContentPackUUID = Results.Column("content_pack_id").StringValue
		      Creature.ContentPackName = Results.Column("content_pack_name").StringValue
		      If Results.Column("stats").Value <> Nil And Results.Column("used_stats").Value <> Nil Then
		        Creature.ConsumeStats(Results.Column("stats").StringValue)
		        Creature.StatsMask = Results.Column("used_stats").Value
		      End If
		      
		      If Results.Column("incubation_time").Value <> Nil Then
		        Creature.IncubationTime = Results.Column("incubation_time").DoubleValue
		      End If
		      If Results.Column("mature_time").Value <> Nil Then
		        Creature.MatureTime = Results.Column("mature_time").DoubleValue
		      End If
		      If Results.Column("mating_interval_min").Value <> Nil And Results.Column("mating_interval_max").Value <> Nil Then
		        Creature.MinMatingInterval = Results.Column("mating_interval_min").DoubleValue
		        Creature.MaxMatingInterval = Results.Column("mating_interval_max").DoubleValue
		      End If
		      
		      Self.mCreatureCache.Value(CreatureID) = Creature.ImmutableVersion
		    End If
		    
		    Creatures.Add(Self.mCreatureCache.Value(CreatureID))
		    Results.MoveToNextRow
		  Wend
		  Return Creatures
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToCreatureColors(Rows As RowSet) As Ark.CreatureColor()
		  Var CreatureColors() As Ark.CreatureColor
		  While Rows.AfterLastRow = False
		    Var Label As String = Rows.Column("label").StringValue
		    Var ID As Integer = Rows.Column("color_id").IntegerValue
		    Var HexValue As String = Rows.Column("hex_value").StringValue
		    CreatureColors.Add(New Ark.CreatureColor(ID, Label, HexValue))
		    Rows.MoveToNextRow
		  Wend
		  Return CreatureColors
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToCreatureColorSets(Rows As RowSet) As Ark.CreatureColorSet()
		  Var Sets() As Ark.CreatureColorSet
		  While Rows.AfterLastRow = False
		    Var Label As String = Rows.Column("label").StringValue
		    Var UUID As String = Rows.Column("color_set_id").StringValue
		    Var ClassString As String = Rows.Column("class_string").StringValue
		    Sets.Add(New Ark.CreatureColorSet(UUID, Label, ClassString))
		    Rows.MoveToNextRow
		  Wend
		  Return Sets
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToEngram(Results As RowSet) As Ark.Engram()
		  Var Engrams() As Ark.Engram
		  While Not Results.AfterLastRow
		    Var EngramID As String = Results.Column("object_id").StringValue
		    If Self.mEngramCache.HasKey(EngramID) = False Then
		      Var Engram As New Ark.MutableEngram(Results.Column("path").StringValue, EngramID)
		      Engram.Label = Results.Column("label").StringValue
		      If IsNull(Results.Column("alternate_label").Value) = False Then
		        Engram.AlternateLabel = Results.Column("alternate_label").StringValue
		      End If
		      Engram.Availability = Results.Column("availability").Value
		      Engram.TagString = Results.Column("tags").StringValue
		      Engram.ContentPackUUID = Results.Column("content_pack_id").StringValue
		      Engram.ContentPackName = Results.Column("content_pack_name").StringValue
		      If IsNull(Results.Column("entry_string").Value) = False And Results.Column("entry_string").StringValue.IsEmpty = False Then
		        Engram.EntryString = Results.Column("entry_string").StringValue
		        
		        If IsNull(Results.Column("required_points").Value) = False And IsNull(Results.Column("required_level").Value) = False Then
		          Engram.RequiredPlayerLevel = Results.Column("required_level").IntegerValue
		          Engram.RequiredUnlockPoints = Results.Column("required_points").IntegerValue
		        End If
		      End If
		      If IsNull(Results.Column("stack_size").Value) = False Then
		        Engram.StackSize = Results.Column("stack_size").IntegerValue
		      End If
		      If IsNull(Results.Column("item_id").Value) = False Then
		        Engram.ItemID = Results.Column("item_id").IntegerValue
		      End If
		      Self.mEngramCache.Value(EngramID) = Engram.ImmutableVersion
		    End If
		    
		    Engrams.Add(Self.mEngramCache.Value(EngramID))
		    Results.MoveToNextRow
		  Wend
		  Return Engrams
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToGameEvents(Rows As RowSet) As Ark.GameEvent()
		  Var GameEvents() As Ark.GameEvent
		  While Rows.AfterLastRow = False
		    Var Label As String = Rows.Column("label").StringValue
		    Var EventUUID As String = Rows.Column("event_id").StringValue
		    Var ArkCode As String = Rows.Column("ark_code").StringValue
		    Var ColorsJSON As String = Rows.Column("colors").StringValue
		    Var RatesJSON As String = Rows.Column("rates").StringValue
		    Var EngramsJSON As String = Rows.Column("engrams").StringValue
		    GameEvents.Add(New Ark.GameEvent(EventUUID, Label, ArkCode, ColorsJSON, RatesJSON, EngramsJSON))
		    Rows.MoveToNextRow
		  Wend
		  Return GameEvents
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToLootContainer(Results As RowSet) As Ark.LootContainer()
		  Var Sources() As Ark.LootContainer
		  While Not Results.AfterLastRow
		    Var HexColor As String = Results.Column("uicolor").StringValue
		    Var RedHex, GreenHex, BlueHex, AlphaHex As String = "00"
		    If HexColor.Length = 3 Then
		      RedHex = HexColor.Middle(0, 1) + HexColor.Middle(0, 1)
		      GreenHex = HexColor.Middle(1, 1) + HexColor.Middle(1, 1)
		      BlueHex = HexColor.Middle(2, 1) + HexColor.Middle(2, 1)
		    ElseIf HexColor.Length = 4 Then
		      RedHex = HexColor.Middle(0, 1) + HexColor.Middle(0, 1)
		      GreenHex = HexColor.Middle(1, 1) + HexColor.Middle(1, 1)
		      BlueHex = HexColor.Middle(2, 1) + HexColor.Middle(2, 1)
		      AlphaHex = HexColor.Middle(3, 1) + HexColor.Middle(3, 1)
		    ElseIf HexColor.Length = 6 Then
		      RedHex = HexColor.Middle(0, 2)
		      GreenHex = HexColor.Middle(2, 2)
		      BlueHex = HexColor.Middle(4, 2)
		    ElseIf HexColor.Length = 8 Then
		      RedHex = HexColor.Middle(0, 2)
		      GreenHex = HexColor.Middle(2, 2)
		      BlueHex = HexColor.Middle(4, 2)
		      AlphaHex = HexColor.Middle(6, 2)
		    End If
		    
		    Var Requirements As Dictionary
		    #Pragma BreakOnExceptions Off
		    Try
		      Requirements = Beacon.ParseJSON(Results.Column("requirements").StringValue)
		    Catch Err As RuntimeException
		      
		    End Try
		    #Pragma BreakOnExceptions Default
		    
		    Var Source As New Ark.MutableLootContainer
		    Source.Label = Results.Column("label").StringValue
		    Source.Path = Results.Column("path").StringValue
		    Source.Availability = Results.Column("availability").Value
		    Source.Multipliers = New Beacon.Range(Results.Column("multiplier_min").DoubleValue, Results.Column("multiplier_max").DoubleValue)
		    Source.UIColor = Color.RGB(Integer.FromHex(RedHex), Integer.FromHex(GreenHex), Integer.FromHex(BlueHex), Integer.FromHex(AlphaHex))
		    Source.SortValue = Results.Column("sort_order").IntegerValue
		    Source.Experimental = Results.Column("experimental").BooleanValue
		    Source.Notes = Results.Column("notes").StringValue
		    Source.ContentPackUUID = Results.Column("content_pack_id").StringValue
		    Source.ContentPackName = Results.Column("content_pack_name").StringValue
		    Source.TagString = Results.Column("tags").StringValue
		    
		    If Requirements.HasKey("min_item_sets") And IsNull(Requirements.Value("min_item_sets")) = False Then
		      Source.RequiredItemSetCount = Requirements.Value("min_item_sets")
		    End If
		    
		    Source.Modified = False
		    Sources.Add(Source.ImmutableVersion)
		    Results.MoveToNextRow
		  Wend
		  Return Sources
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowSetToSpawnPoint(Results As RowSet) As Ark.SpawnPoint()
		  Var SpawnPoints() As Ark.SpawnPoint
		  While Not Results.AfterLastRow
		    Var PointID As String = Results.Column("object_id").StringValue
		    If Self.mSpawnPointCache.HasKey(PointID) = False Then
		      Var Point As New Ark.MutableSpawnPoint(Results.Column("path").StringValue, PointID)
		      Point.Label = Results.Column("label").StringValue
		      If IsNull(Results.Column("alternate_label").Value) = False Then
		        Point.AlternateLabel = Results.Column("alternate_label").StringValue
		      End If
		      Point.Availability = Results.Column("availability").Value
		      Point.TagString = Results.Column("tags").StringValue
		      Point.ContentPackUUID = Results.Column("content_pack_id").StringValue
		      Point.ContentPackName = Results.Column("content_pack_name").StringValue
		      Point.Modified = False
		      Self.mSpawnPointCache.Value(PointID) = Point.ImmutableVersion
		    End If
		    
		    SpawnPoints.Add(Self.mSpawnPointCache.Value(PointID))
		    Results.MoveToNextRow
		  Wend
		  Return SpawnPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveBlueprints(BlueprintsToSave() As Ark.Blueprint, BlueprintsToDelete() As Ark.Blueprint, ErrorDict As Dictionary) As Boolean
		  Var DeleteUUIDs() As String
		  For Each Blueprint As Ark.Blueprint In BlueprintsToDelete
		    DeleteUUIDs.Add(Blueprint.ObjectID)
		  Next Blueprint
		  
		  Return Self.SaveBlueprints(BlueprintsToSave, DeleteUUIDs, ErrorDict, True)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveBlueprints(BlueprintsToSave() As Ark.Blueprint, BlueprintsToDelete() As String, ErrorDict As Dictionary) As Boolean
		  Return Self.SaveBlueprints(BlueprintsToSave, BlueprintsToDelete, ErrorDict, True)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SaveBlueprints(BlueprintsToSave() As Ark.Blueprint, BlueprintsToDelete() As String, ErrorDict As Dictionary, LocalModsOnly As Boolean) As Boolean
		  Var CountSuccess, CountErrors As Integer
		  
		  Self.BeginTransaction()
		  For Each BlueprintUUID As String In BlueprintsToDelete
		    Var TransactionStarted As Boolean
		    Try
		      Self.BeginTransaction()
		      TransactionStarted = True
		      If LocalModsOnly Then
		        Self.SQLExecute("DELETE FROM blueprints WHERE object_id = ?1 AND content_pack_id IN (SELECT content_pack_id FROM content_packs WHERE is_local = 1);", BlueprintUUID)
		      Else
		        Self.SQLExecute("DELETE FROM blueprints WHERE object_id = ?1;", BlueprintUUID)
		      End If
		      Self.CommitTransaction()
		      TransactionStarted = False
		      CountSuccess = CountSuccess + 1
		    Catch Err As RuntimeException
		      If TransactionStarted Then
		        Self.RollbackTransaction()
		      End If
		      If (ErrorDict Is Nil) = False Then
		        ErrorDict.Value(BlueprintUUID) = Err
		      End If
		      CountErrors = CountErrors + 1
		    End Try
		  Next
		  
		  For Each Blueprint As Ark.Blueprint In BlueprintsToSave
		    Var TransactionStarted As Boolean
		    Try
		      Var UpdateObjectID As String
		      Var Results As RowSet
		      If LocalModsOnly Then
		        Results = Self.SQLSelect("SELECT object_id, content_pack_id IN (SELECT content_pack_id FROM content_packs WHERE is_local = 1) AS is_user_blueprint FROM blueprints WHERE object_id = ?1;", Blueprint.ObjectID)
		      Else
		        Results = Self.SQLSelect("SELECT object_id FROM blueprints WHERE object_id = ?1;", Blueprint.ObjectID)
		      End If
		      Var CacheDict As Dictionary
		      If Results.RowCount = 1 Then
		        If LocalModsOnly And Results.Column("is_user_blueprint").BooleanValue = False Then
		          Continue
		        End If
		        UpdateObjectID = Results.Column("object_id").StringValue
		      ElseIf Results.RowCount > 1 Then
		        // What the hell?
		        Continue
		      End If
		      
		      If Blueprint.Path.IsEmpty Or Blueprint.ClassString.IsEmpty Then
		        Continue
		      End If
		      
		      Var Category As String = Blueprint.Category
		      Var Columns As New Dictionary
		      Columns.Value("object_id") = Blueprint.ObjectID
		      Columns.Value("path") = Blueprint.Path
		      Columns.Value("class_string") = Blueprint.ClassString
		      Columns.Value("label") = Blueprint.Label
		      Columns.Value("tags") = Blueprint.TagString
		      Columns.Value("availability") = Blueprint.Availability
		      Columns.Value("content_pack_id") = Blueprint.ContentPackUUID
		      
		      Select Case Blueprint
		      Case IsA Ark.Creature
		        Var Creature As Ark.Creature = Ark.Creature(Blueprint)
		        If Creature.IncubationTime > 0 And Creature.MatureTime > 0 Then
		          Columns.Value("incubation_time") = Creature.IncubationTime
		          Columns.Value("mature_time") = Creature.MatureTime
		        Else
		          Columns.Value("incubation_time") = Nil
		          Columns.Value("mature_time") = Nil
		        End If
		        If Creature.MinMatingInterval > 0 And Creature.MaxMatingInterval > 0 Then
		          Columns.Value("mating_interval_min") = Creature.MinMatingInterval
		          Columns.Value("mating_interval_max") = Creature.MaxMatingInterval
		        Else
		          Columns.Value("mating_interval_min") = Nil
		          Columns.Value("mating_interval_max") = Nil
		        End If
		        Columns.Value("used_stats") = Creature.StatsMask
		        
		        Var StatDicts() As Dictionary
		        Var StatValues() As Ark.CreatureStatValue = Creature.AllStatValues
		        For Each StatValue As Ark.CreatureStatValue In StatValues
		          StatDicts.Add(StatValue.SaveData)
		        Next
		        Columns.Value("stats") = Beacon.GenerateJSON(StatDicts, False)
		        
		        CacheDict = Self.mCreatureCache
		      Case IsA Ark.SpawnPoint
		        Columns.Value("sets") = Ark.SpawnPoint(Blueprint).SetsString(False)
		        Columns.Value("limits") = Ark.SpawnPoint(Blueprint).LimitsString(False)
		        CacheDict = Self.mSpawnPointCache
		      Case IsA Ark.Engram
		        Var Engram As Ark.Engram = Ark.Engram(Blueprint)
		        Columns.Value("recipe") = Ark.CraftingCostIngredient.ToJSON(Engram.Recipe, False)
		        If Engram.EntryString.IsEmpty Then
		          Columns.Value("entry_string") = Nil
		        Else
		          Columns.Value("entry_string") = Engram.EntryString
		        End If
		        If Engram.RequiredPlayerLevel Is Nil Then
		          Columns.Value("required_level") = Nil
		        Else
		          Columns.Value("required_level") = Engram.RequiredPlayerLevel.IntegerValue
		        End If
		        If Engram.RequiredUnlockPoints Is Nil Then
		          Columns.Value("required_points") = Nil
		        Else
		          Columns.Value("required_points") = Engram.RequiredUnlockPoints.IntegerValue
		        End If
		        If Engram.StackSize Is Nil Then
		          Columns.Value("stack_size") = Nil
		        Else
		          Columns.Value("stack_size") = Engram.StackSize.IntegerValue
		        End If
		        CacheDict = Self.mEngramCache
		      Case IsA Ark.LootContainer
		        #if DebugBuild
		          #Pragma Warning "Incomplete"
		        #else
		          #Pragma Error "Incomplete"
		        #endif
		      End Select
		      
		      Self.BeginTransaction()
		      TransactionStarted = True
		      If UpdateObjectID.IsEmpty = False Then
		        Var Assignments() As String
		        Var Values() As Variant
		        Var NextPlaceholder As Integer = 1
		        Var WhereClause As String
		        For Each Entry As DictionaryEntry In Columns
		          If Entry.Key = "object_id" Then
		            WhereClause = "object_id = ?" + NextPlaceholder.ToString
		          Else
		            Assignments.Add(Entry.Key.StringValue + " = ?" + NextPlaceholder.ToString)
		          End If
		          Values.Add(Entry.Value)
		          NextPlaceholder = NextPlaceholder + 1
		        Next
		        
		        Self.SQLExecute("UPDATE " + Category + " SET " + Assignments.Join(", ") + " WHERE " + WhereClause + ";", Values)
		        Self.SQLExecute("UPDATE searchable_tags SET tags = ?3 WHERE object_id = ?2 AND source_table = ?1;", Category, UpdateObjectID, Blueprint.TagString)
		      Else
		        Var ColumnNames(), Placeholders() As String
		        Var Values() As Variant
		        Var NextPlaceholder As Integer = 1
		        For Each Entry As DictionaryEntry In Columns
		          ColumnNames.Add(Entry.Key.StringValue)
		          Placeholders.Add("?" + NextPlaceholder.ToString)
		          Values.Add(Entry.Value)
		          NextPlaceholder = NextPlaceholder + 1
		        Next
		        
		        Self.SQLExecute("INSERT INTO " + Category + " (" + ColumnNames.Join(", ") + ") VALUES (" + Placeholders.Join(", ") + ");", Values)
		        Self.SQLExecute("INSERT INTO searchable_tags (source_table, object_id, tags) VALUES (?1, ?2, ?3);", Category, Blueprint.ObjectID, Blueprint.TagString)
		      End If
		      Self.CommitTransaction()
		      TransactionStarted = False
		      
		      If (CacheDict Is Nil) = False Then
		        If CacheDict.HasKey(Blueprint.ObjectID) Then
		          CacheDict.Remove(Blueprint.ObjectID)
		        End If
		        If CacheDict.HasKey(Blueprint.Path) Then
		          CacheDict.Remove(Blueprint.Path)
		        End If
		        If CacheDict.HasKey(Blueprint.ClassString) Then
		          CacheDict.Remove(Blueprint.ClassString)
		        End If
		        If Blueprint IsA Ark.Engram And Ark.Engram(Blueprint).HasUnlockDetails And CacheDict.HasKey(Ark.Engram(Blueprint).EntryString) Then
		          CacheDict.Remove(Ark.Engram(Blueprint).EntryString)
		        End If
		      End If
		      
		      CountSuccess = CountSuccess + 1
		    Catch Err As RuntimeException
		      If TransactionStarted Then
		        Self.RollbackTransaction()
		      End If
		      If (ErrorDict Is Nil) = False Then
		        ErrorDict.Value(Blueprint.ObjectID) = Err
		      End If
		      CountErrors = CountErrors + 1
		    End Try
		  Next
		  If CountErrors = 0 And CountSuccess > 0 Then
		    Self.CommitTransaction()
		    
		    Self.SyncUserEngrams()
		    NotificationKit.Post(Self.Notification_EngramsChanged, Nil)
		    
		    Return True
		  Else
		    Self.RollbackTransaction()
		    
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SharedInstance(Create As Boolean = True) As Ark.DataSource
		  If mInstance Is Nil And Create = True Then
		    mInstance = New Ark.DataSource
		  End If
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SyncURL(ForceRefresh As Boolean) As String
		  Var CheckURL As String = BeaconAPI.URL("/deltas?version=" + Self.DeltaFormat.ToString(Locale.Raw, "0") + "&game=" + Self.Identifier.Lowercase)
		  
		  If ForceRefresh = False Then
		    Var LastSync As String = Self.Variable("sync_time")
		    If LastSync.IsEmpty = False Then
		      CheckURL = CheckURL + "&since=" + EncodeURLComponent(LastSync)
		    End If
		  End If
		  
		  If (App.IdentityManager Is Nil) = False And (App.IdentityManager.CurrentIdentity Is Nil) = False Then
		    CheckURL = CheckURL + "&user_id=" + EncodeURLComponent(App.IdentityManager.CurrentIdentity.UserID)
		  End If
		  
		  Return CheckURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SyncUserEngrams()
		  // This way changing lots of engrams rapidly won't require a write to disk
		  // after each action
		  
		  If Self.mSyncUserEngramsKey <> "" Then
		    CallLater.Cancel(Self.mSyncUserEngramsKey)
		    Self.mSyncUserEngramsKey = ""
		  End If
		  
		  Self.mSyncUserEngramsKey = CallLater.Schedule(250, AddressOf SyncUserEngramsActual)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SyncUserEngramsActual()
		  Var Packed() As Dictionary
		  
		  Var UserPacks() As Ark.ContentPack = Self.GetContentPacks()
		  If UserPacks.Count > 0 Then
		    Var Packs As New Beacon.StringList()
		    For Each Pack As Ark.ContentPack In UserPacks
		      If Pack.IsLocal = False Then
		        Continue
		      End If
		      
		      Packs.Append(Pack.UUID)
		      
		      Var Dict As New Dictionary
		      Dict.Value("content_pack_id") = Pack.UUID
		      Dict.Value("name") = Pack.Name
		      Dict.Value("workshop_id") = Pack.WorkshopID
		      Packed.Add(Dict)
		    Next
		    
		    Var Engrams() As Ark.Engram = Self.GetEngrams("", Packs, "")
		    For Each Engram As Ark.Engram In Engrams
		      Var Dict As Dictionary = Engram.Pack
		      If Dict Is Nil Then
		        Continue
		      End If
		      
		      Packed.Add(Dict)
		    Next
		    
		    Var Creatures() As Ark.Creature = Self.GetCreatures("", Packs, "")
		    For Each Creature As Ark.Creature In Creatures
		      Var Dict As Dictionary = Creature.Pack
		      If Dict Is Nil Then
		        Continue
		      End If
		      
		      Packed.Add(Dict)
		    Next
		    
		    Var SpawnPoints() As Ark.SpawnPoint = Self.GetSpawnPoints("", Packs, "")
		    For Each SpawnPoint As Ark.SpawnPoint In SpawnPoints
		      Var Dict As Dictionary = SpawnPoint.Pack
		      If Dict Is Nil Then
		        Continue
		      End If
		      
		      Packed.Add(Dict)
		    Next
		    
		    Var Containers() As Ark.LootContainer = Self.GetLootContainers("", Packs, "")
		    For Each Container As Ark.LootContainer In Containers
		      Var Dict As Dictionary = Container.Pack
		      If Dict Is Nil Then
		        Continue
		      End If
		      
		      Packed.Add(Dict)
		    Next
		  End If
		  
		  If Packed.Count > 0 Then
		    Var Content As String = Beacon.GenerateJSON(Packed, True)
		    Call UserCloud.Write("Blueprints.json", Content)
		  Else
		    Call UserCloud.Delete("Blueprints.json")
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConfigKeyCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContainerLabelCacheDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContainerLabelCacheMask As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCreatureCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEngramCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIconCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As Ark.DataSource
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLootContainerCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLootTemplateCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOfficialPlayerLevelData As Ark.PlayerLevelData
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSpawnLabelCacheDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSpawnLabelCacheMask As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSpawnPointCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyncUserEngramsKey As String
	#tag EndProperty


	#tag Constant, Name = ConfigKeySelectSQL, Type = String, Dynamic = False, Default = \"SELECT object_id\x2C label\x2C file\x2C header\x2C key\x2C value_type\x2C max_allowed\x2C description\x2C default_value\x2C nitrado_path\x2C nitrado_format\x2C nitrado_deploy_style\x2C native_editor_version\x2C ui_group\x2C custom_sort\x2C constraints\x2C content_pack_id FROM ini_options", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureColorSelectSQL, Type = String, Dynamic = False, Default = \"SELECT colors.color_id\x2C colors.label\x2C colors.hex_value FROM colors", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureColorSetSelectSQL, Type = String, Dynamic = False, Default = \"SELECT color_sets.color_set_id\x2C color_sets.label\x2C color_sets.class_string FROM color_sets", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CreatureSelectSQL, Type = String, Dynamic = False, Default = \"SELECT creatures.object_id\x2C creatures.path\x2C creatures.label\x2C creatures.alternate_label\x2C creatures.availability\x2C creatures.tags\x2C creatures.incubation_time\x2C creatures.mature_time\x2C creatures.stats\x2C creatures.mating_interval_min\x2C creatures.mating_interval_max\x2C creatures.used_stats\x2C content_packs.content_pack_id\x2C content_packs.name AS content_pack_name FROM creatures INNER JOIN content_packs ON (creatures.content_pack_id \x3D content_packs.content_pack_id)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = EngramSelectSQL, Type = String, Dynamic = False, Default = \"SELECT engrams.object_id\x2C engrams.path\x2C engrams.label\x2C engrams.alternate_label\x2C engrams.availability\x2C engrams.tags\x2C engrams.entry_string\x2C engrams.required_level\x2C engrams.required_points\x2C engrams.stack_size\x2C engrams.item_id\x2C content_packs.content_pack_id\x2C content_packs.name AS content_pack_name FROM engrams INNER JOIN content_packs ON (engrams.content_pack_id \x3D content_packs.content_pack_id)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = GameEventSelectSQL, Type = String, Dynamic = False, Default = \"SELECT events.event_id\x2C events.label\x2C events.ark_code\x2C events.colors\x2C events.rates\x2C events.engrams FROM events", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LootContainerSelectSQL, Type = String, Dynamic = False, Default = \"SELECT loot_containers.path\x2C loot_containers.class_string\x2C loot_containers.alternate_label\x2C loot_containers.availability\x2C loot_containers.multiplier_min\x2C loot_containers.multiplier_max\x2C loot_containers.uicolor\x2C loot_containers.sort_order\x2C loot_containers.experimental\x2C loot_containers.notes\x2C loot_containers.requirements\x2C loot_containers.content_pack_id\x2C loot_containers.tags FROM loot_containers INNER JOIN content_packs ON (loot_containers.content_pack_id \x3D content_packs.content_pack_id)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Notification_EngramsChanged, Type = String, Dynamic = False, Default = \"Engrams Changed", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SpawnPointSelectSQL, Type = String, Dynamic = False, Default = \"SELECT spawn_points.object_id\x2C spawn_points.path\x2C spawn_points.label\x2C spawn_points.alternate_label\x2C spawn_points.availability\x2C spawn_points.tags\x2C content_packs.content_pack_id\x2C content_packs.name AS content_pack_name FROM spawn_points INNER JOIN content_packs ON (spawn_points.content_pack_id \x3D content_packs.content_pack_id)", Scope = Private
	#tag EndConstant


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass
