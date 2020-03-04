//Create the end of level dialogue box
instance_create_depth(0,0,0,objEndLevelBox);

//Unlock the next level
switch room {
	case rmLevel1:
		global.level2Locked = false;
		break;
	case rmLevel2:
		global.level3Locked = false;
		break;
	case rmLevel3:
		global.level4Locked = false;
		break;
	case rmLevel4:
		global.level5Locked = false;
		break;
}