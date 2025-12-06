const { app, BrowserWindow, globalShortcut } = require("electron");

let win = null;

function createWindow() {
  win = new BrowserWindow({
    width: 520,
    height: 680,
    frame: false,
    alwaysOnTop: true,
    roundedCorners: true,
    vibrancy: "sidebar",
  });

  win.loadURL("https://gemini.google.com/app");

  win.on("blur", () => {
    win.hide();
  });
}

app.whenReady().then(() => {
  createWindow();

  // Toggle window con CMD + SHIFT + SPACE
  globalShortcut.register("CommandOrControl+Shift+Space", () => {
    if (win.isVisible()) {
      win.hide();
    } else {
      win.show();
      win.focus();
    }
  });

  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on("will-quit", () => {
  globalShortcut.unregisterAll();
});
