/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-misc-fixed-medium-*-normal-*-10-*-*-*-*-*-iso10646-*";
static const char normbordercolor[] = "#222222";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#888888";
static const char selbordercolor[]  = "#2a51b0";
static const char selbgcolor[]      = "#1c3571";
static const char selfgcolor[]      = "#ffffff";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const Bool showsystray       = True;     /* False means no systray */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "work", "web", "im", "mail", "music", "video", "misc", "ext", "nil", "~" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
  { "Pidgin",   NULL,       NULL,       1 << 2,       True,         -1 },
  { "Skype",    NULL,       NULL,       1 << 2,       True,         -1 },
  /* Browsers */
  { "Chromium", NULL,       NULL,       1 << 1,       False,        -1 },
  { NULL,       NULL,       "Firefox Preferences", 1 << 1, True,    -1 },
  { "Firefox",  NULL,       "Library",  1 << 1,       True,         -1 },
  { "Firefox",  NULL,       NULL,       1 << 1,       False,        -1 },
  /* Mail */
  { NULL,       NULL,       "mutt",     1 << 3,       False,        -1 },
  { "Thunderbird", NULL,    NULL,       1 << 3,       False,        -1 },
  /* Media */
  { NULL,       NULL,       "ncmpcpp",  1 << 4,       False,        -1 },
  { "MPlayer",  NULL,       NULL,       1 << 5,       True,         -1 },
  { "Smplayer", NULL,       NULL,       1 << 5,       True,         -1 },
  { "Vlc",      NULL,       NULL,       1 << 5,       False,        -1 },
  { "ffplay",   NULL,       NULL,       1 << 5,       True,         -1 },
  { "feh",      NULL,       NULL,       0,            True,         -1 },
  { "Gpodder",  NULL,       NULL,       1 << 6,       False,        -1 },
  /* Utils */
  { "Wicd-client.py", NULL, NULL,       1 << 6,       True,         -1 },
  { "Thunar",   NULL,       NULL,       1 << 6,       True,         -1 },
  { "Gksu",     NULL,       NULL,       0,            True,         -1 },
  { NULL,       NULL,       "su",       0,            True,         -1 },
  { NULL,       NULL,       "tilde-term", 1 << 9,     True,         -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
  { "[]|",      deck },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run",  "-p", "command:", "-fn", "-misc-fixed-medium-*-normal-*-10-*-*-*-*-*-*-*", "-l", "10", "-nb", "#151515", "-nf", normfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
/* media */
static const char *mutecmd[] = { "amixer", "sset", "Master,0", "toggle", NULL };
static const char *lowercmd[] = { "amixer", "sset", "Master,0", "1%-", NULL };
static const char *raisecmd[] = { "amixer", "sset", "Master,0", "1%+", NULL };
static const char *prevcmd[] = { "mpc", "prev", NULL };
static const char *playcmd[] = { "mpc", "toggle", NULL };
static const char *nextcmd[] = { "mpc", "next", NULL };
/* display, printscreen, calc */
static const char *dispcmd[] = { "/home/pepol/scripts/dispswitch.sh", NULL };
static const char *printcmd[] = { "scrot", "%Y-%m-%d-%H%M%S_$wx$h.png", "-e", "mv $f ~/screenshots/", NULL };
static const char *calccmd[] = { "st", "-e", "qalc", NULL };
/* lock, fm */
static const char *lockcmd[] = { "/home/pepol/scripts/lock.sh", NULL };
static const char *thunarcmd[] = { "thunar", NULL };
/* notif */
static const char *mpcnotifycmd[] = { "/home/pepol/scripts/mpdnotify.sh", NULL };
/* power */
static const char *rebootcmd[] = { "systemctl", "reboot", NULL };
static const char *poweroffcmd[] = { "systemctl", "poweroff", NULL };
static const char *suspendcmd[] = { "/home/pepol/scripts/suspend.sh", NULL };
static const char *hibernatecmd[] = { "/home/pepol/scripts/hibernate.sh", NULL };


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ Mod4Mask,                     XK_s,      spawn,          {.v = termcmd } },
  /* media keys */
  { 0,                            0x1008ff12, spawn,         {.v = mutecmd } },
  { 0,                            0x1008ff11, spawn,         {.v = lowercmd } },
  { 0,                            0x1008ff13, spawn,         {.v = raisecmd } },
  { 0,                            0x1008ff16, spawn,         {.v = prevcmd } },
  { 0,                            0x1008ff14, spawn,         {.v = playcmd } },
  { 0,                            0x1008ff17, spawn,         {.v = nextcmd } },
  /* disp, prtscr, calc */
  { 0,                            0x1008ff59, spawn,         {.v = dispcmd } },
  { 0,                            0xff61,     spawn,         {.v = printcmd } },
  { 0,                            0x1008ff1d, spawn,         {.v = calccmd } },
  /* lock, search, fm, notify */
  { Mod4Mask,                     XK_l,      spawn,          {.v = lockcmd } },
  { Mod4Mask,                     XK_f,      spawn,          {.v = dmenucmd } },
  { Mod4Mask,                     XK_e,      spawn,          {.v = thunarcmd } },
  { Mod4Mask,                     XK_m,      spawn,          {.v = mpcnotifycmd } },

  /* dwm */
  { MODKEY,                       XK_q,      killclient,     {0} },
  { Mod4Mask|ShiftMask,           XK_l,      quit,           {0} },
  { Mod4Mask|ShiftMask,           XK_r,      spawn,          {.v = rebootcmd } },
  { Mod4Mask|ShiftMask,           XK_p,      spawn,          {.v = poweroffcmd } },
  { Mod4Mask|ShiftMask,           XK_s,      spawn,          {.v = suspendcmd } },
  { Mod4Mask|ShiftMask,           XK_h,      spawn,          {.v = hibernatecmd } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05 } },
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_c,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
  { MODKEY,                       XK_grave,  toggleview,     {.ui = 1 << 9} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
