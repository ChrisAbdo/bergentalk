//View/window/camera setup

global.viewWidth = 960;
global.viewHeight = 540;

global.windowScale = 1;

window_set_size(global.viewWidth*global.windowScale,global.viewHeight*global.windowScale);
alarm[0] = 1;

surface_resize(application_surface,global.viewWidth*global.windowScale,global.viewHeight*global.windowScale);

//Set levels to default locked settings (all levels initially locked except level 1)
global.level1Locked = false;
global.level2Locked = true;
global.level3Locked = true;
global.level4Locked = true;
global.level5Locked = true;
global.level6Locked = true;

//Initialize score vars
global.coinsCollected = 0;
global.lifetimeScore = 0;

//Init text drawing settings
draw_set_font(fComicSans);
draw_set_color(c_red);