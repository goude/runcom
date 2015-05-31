Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.Namespace("C:\dev\fontinstall")
Set objFolderItem = objFolder.ParseName("powerline.ttf")
objFolderItem.InvokeVerb("Install")