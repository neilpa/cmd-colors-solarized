param([Parameter(ValueFromPipelineByPropertyName=$true)][Alias("PSPath")][string]$Path) 
begin {

Add-Type -TypeDef @"
using System;
using System.IO;
using System.Text;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;

namespace Huddled.Interop
{
   [Flags()] // SHELL_LINK_DATA_FLAGS
   public enum ShellLinkFlags : uint {
     Default                            = 0x00000000,
     HasIdList                          = 0x00000001,
     HasLinkInfo                        = 0x00000002,
     HasName                            = 0x00000004,
     HasRelpath                         = 0x00000008,
     HasWorkingdir                      = 0x00000010,
     HasArgs                            = 0x00000020,
     HasIconLocation                    = 0x00000040,
     Unicode                            = 0x00000080,
     ForceNoLinkInfo                    = 0x00000100,
     HasExpSz                           = 0x00000200,
     RunInSeparate                      = 0x00000400,
     HasLogo3Id                         = 0x00000800,
     HasDarwinId                        = 0x00001000,
     RunasUser                          = 0x00002000,
     HasExpIconSz                       = 0x00004000,
     NoPidlAlias                        = 0x00008000,
     ForceUncname                       = 0x00010000,
     RunWithShimlayer                   = 0x00020000,
     ForceNoLinktrack                   = 0x00040000,
     EnableTargetMetadata               = 0x00080000,
     DisableLinkPathTracking            = 0x00100000,
     DisableKnownfolderRelativeTracking = 0x00200000,
     NoKFAlias                          = 0x00400000,
     AllowLinkToLink                    = 0x00800000,
     UnaliasOnSave                      = 0x01000000,
     PreferEnvironmentPath              = 0x02000000,
     KeepLocalIdListForUncTarget        = 0x04000000,
     Valid                              = 0x07fff7ff,
     Reserved                           = (uint)0x80000000
   }


   // IShellLink.ShowCmd fFlags
   [Flags()]
   public enum ShowCmd
   {
      Normal = 1,
      Maximized = 3,
      Minnoactive = 7
   }

   // IShellLink.Resolve fFlags SLR_FLAGS
   [Flags()]
   public enum ResolveFlags
   {
      NoUI = 0x1,
      AnyMatch = 0x2,
      Update = 0x4,
      NoUpdate = 0x8,
      NoSearch = 0x10,
      NoTrack = 0x20,
      NoLinkInfo = 0x40,
      InvokeMsi = 0x80
   }

   // IShellLink.GetPath fFlags SLGP_FLAGS
   [Flags()]
   public enum GetPathFlags
   {
      ShortPath = 0x1,
      UncPriority = 0x2,
      RawPath = 0x4
   }

   // Win32 COORD
   [StructLayout(LayoutKind.Sequential)]
   public struct COORD
   {
      public short X;
      public short Y;
   }

   // IShellDataLink NT_CONSOLE_PROPS
   [StructLayoutAttribute(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
   public struct NT_CONSOLE_PROPS
   {
      public int cbSize;             // Size of this extra data block
      public uint dwSignature;         // signature of this extra data block
      public ushort wFillAttribute;       // fill attribute for console
      public ushort wPopupFillAttribute;   // fill attribute for console popups
      public COORD dwScreenBufferSize;    // screen buffer size for console
      public COORD dwWindowSize;         // window size for console
      public COORD dwWindowOrigin;       // window origin for console
      public int nFont;
      public int nInputBufferSize;
      public COORD dwFontSize;
      public uint uFontFamily;
      public uint uFontWeight;
      [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
      public string FaceName;
      public uint uCursorSize;
      public bool bFullScreen;
      public bool bQuickEdit;
      public bool bInsertMode;
      public bool bAutoPosition;
      public uint uHistoryBufferSize;
      public uint uNumberOfHistoryBuffers;
      public bool bHistoryNoDup;
      [MarshalAs(UnmanagedType.ByValArray, SizeConst = 16)]
      public uint[] ColorTable;
   }

   // The CharSet must match the CharSet of the corresponding PInvoke signature
   [StructLayout(LayoutKind.Sequential, CharSet=CharSet.Auto)]
   public struct WIN32_FIND_DATA
   {
       public uint dwFileAttributes;
       public System.Runtime.InteropServices.ComTypes.FILETIME ftCreationTime;
       public System.Runtime.InteropServices.ComTypes.FILETIME ftLastAccessTime;
       public System.Runtime.InteropServices.ComTypes.FILETIME ftLastWriteTime;
       public uint nFileSizeHigh;
       public uint nFileSizeLow;
       public uint dwReserved0;
       public uint dwReserved1;
       [MarshalAs(UnmanagedType.ByValTStr, SizeConst=260)]
       public string cFileName;
       [MarshalAs(UnmanagedType.ByValTStr, SizeConst=14)]
       public string cAlternateFileName;
   }


   [ComImport(),
   InterfaceType(ComInterfaceType.InterfaceIsIUnknown),
   Guid("0000010B-0000-0000-C000-000000000046")]
   public interface IPersistFile
   {
      #region Methods inherited from IPersist

      void GetClassID(
         out Guid pClassID);

      #endregion

      [PreserveSig()]
      int IsDirty();

      void Load(
         [MarshalAs(UnmanagedType.LPWStr)] string pszFileName,
         int dwMode);

      void Save(
         [MarshalAs(UnmanagedType.LPWStr)] string pszFileName,
         [MarshalAs(UnmanagedType.Bool)] bool fRemember);

      void SaveCompleted(
         [MarshalAs(UnmanagedType.LPWStr)] string pszFileName);

      void GetCurFile(
         out IntPtr ppszFileName);

   }

   [ComImport(),
   InterfaceType(ComInterfaceType.InterfaceIsIUnknown),
   Guid("000214F9-0000-0000-C000-000000000046")]
   public interface IShellLinkW
   {
      void GetPath(
         [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszFile,
         int cchMaxPath,
         out WIN32_FIND_DATA pfd,
         GetPathFlags fFlags);

      void GetIDList(
         out IntPtr ppidl);

      void SetIDList(
         IntPtr pidl);

      void GetDescription(
         [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszName,
         int cchMaxName);

      void SetDescription(
         [MarshalAs(UnmanagedType.LPWStr)] string pszName);

      void GetWorkingDirectory(
         [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszDir,
         int cchMaxPath);

      void SetWorkingDirectory(
         [MarshalAs(UnmanagedType.LPWStr)] string pszDir);

      void GetArguments(
         [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszArgs,
         int cchMaxPath);

      void SetArguments(
         [MarshalAs(UnmanagedType.LPWStr)] string pszArgs);

      void GetHotkey(
         out short pwHotkey);

      void SetHotkey(
         short wHotkey);

      void GetShowCmd(
         out int piShowCmd);

      void SetShowCmd(
         int iShowCmd);

      void GetIconLocation(
         [Out(), MarshalAs(UnmanagedType.LPWStr)] StringBuilder pszIconPath,
         int cchIconPath,
         out int piIcon);

      void SetIconLocation(
         [MarshalAs(UnmanagedType.LPWStr)] string pszIconPath,
         int iIcon);

      void SetRelativePath(
         [MarshalAs(UnmanagedType.LPWStr)] string pszPathRel,
         int dwReserved);

      void Resolve(
         IntPtr hwnd,
         ResolveFlags fFlags);

      void SetPath(
         [MarshalAs(UnmanagedType.LPWStr)] string pszFile);

   }

   [ComImport(),
   InterfaceType(ComInterfaceType.InterfaceIsIUnknown),
   Guid("45E2b4AE-B1C3-11D0-B92F-00A0C90312E1")]
   public interface IShellLinkDataList
   {
      void AddDataBlock(IntPtr pDataBlock);

      void CopyDataBlock(uint dwSig, out IntPtr ppDataBlock);

      void RemoveDataBlock(uint dwSig);

      void GetFlags(out uint dwFlags);

      void SetFlags(uint dwFlags);
   }

   public class ShellLink
   {
      private IShellLinkW _ShellLink;
      private NT_CONSOLE_PROPS _ConsoleProperties;
      private ushort _ScreenFill;
      private ushort _PopUpFill;

      public Color[] ConsoleColors = new Color[16];

      public ShellLink(string Path) {
         _ShellLink = Activator.CreateInstance(Type.GetTypeFromCLSID(new Guid("00021401-0000-0000-C000-000000000046"))) as IShellLinkW;
         if (File.Exists(Path))
         {
            IntPtr pConsoleProperties = IntPtr.Zero;
            ((IPersistFile)_ShellLink).Load(Path, 0);

            try
            {
               // TODO: Fix memory leak here
               ((IShellLinkDataList)_ShellLink).CopyDataBlock(0xA0000002, out pConsoleProperties);
               _ConsoleProperties = (NT_CONSOLE_PROPS)Marshal.PtrToStructure(pConsoleProperties, typeof(NT_CONSOLE_PROPS));
               _ScreenFill = _ConsoleProperties.wFillAttribute;
               _PopUpFill = _ConsoleProperties.wPopupFillAttribute;

               for (int i = 0; i < 16; i++)
               {
                  ConsoleColors[i] = ColorTranslator.FromWin32((int)_ConsoleProperties.ColorTable[i]);
               }
            }
            catch (Exception)
            {
            }

         }
         else
         {
            ((IPersistFile)_ShellLink).Save(Path, true);
         }

         // TODO: Don't fake it, pull these values from the Registry
         // Initialize default Console Properties
         if (_ConsoleProperties.dwSignature != 0xA0000002)
         {
            _ConsoleProperties = new NT_CONSOLE_PROPS();
            _ConsoleProperties.cbSize = Marshal.SizeOf(_ConsoleProperties);
            _ConsoleProperties.dwSignature = 0xA0000002;
            _ConsoleProperties.ColorTable = new uint[16];

            _ConsoleProperties.dwWindowSize.X = 120;
            _ConsoleProperties.dwWindowSize.Y = 30;

            _ConsoleProperties.dwScreenBufferSize.X = 120;
            _ConsoleProperties.dwScreenBufferSize.Y = 8000;

            _ConsoleProperties.bQuickEdit = true;

            _ConsoleProperties.bAutoPosition = true;

            for (int i = 0; i < 16; i++)
            {
               _ConsoleProperties.ColorTable[i] = 0xffffffff;
            }
         }
      }
      
      public ShellLinkFlags Flags {
         get {
            uint flags;
            ((IShellLinkDataList)_ShellLink).GetFlags( out flags );
            return (ShellLinkFlags)flags;
         }
         set {
            ((IShellLinkDataList)_ShellLink).SetFlags( (uint)value );
         }
      }

      public void Save(string Path)
      {
         SetConsoleColors();
         ((IPersistFile)_ShellLink).Save(Path, true);
      }

      public void Save()
      {
         SetConsoleColors();
         ((IPersistFile)_ShellLink).Save(null, true);
      }

      public IShellLinkW GetShellLink()
      {
         return _ShellLink;
      }

      public string Path
      {
         get
         {
            StringBuilder sb = new StringBuilder(260);
            WIN32_FIND_DATA pfd = new WIN32_FIND_DATA();
            _ShellLink.GetPath(sb, 259, out pfd, GetPathFlags.RawPath);
            return sb.ToString();
         }
         set
         {
            _ShellLink.SetPath(value);
         }
      }

      public string Description
      {
         get
         {
            StringBuilder sb = new StringBuilder(2048);
            _ShellLink.GetDescription(sb, 2048);
            return sb.ToString();
         }
         set { _ShellLink.SetDescription(value); }
      }

      public string WorkingDirectory
      {
         get
         {
            StringBuilder sb = new StringBuilder(260);
            _ShellLink.GetWorkingDirectory(sb, 260);
            return sb.ToString();
         }
         set { _ShellLink.SetWorkingDirectory(value); }
      }

      public ShowCmd ShowCmd
      {
         get
         {
            int nShowCmd;
            _ShellLink.GetShowCmd(out nShowCmd);
            return (ShowCmd)Enum.ToObject(typeof(ShowCmd), nShowCmd);
         }
         set
         {
            _ShellLink.SetShowCmd((int)value);
         }
      }

      public bool QuickEditMode
      {
         get { return _ConsoleProperties.bQuickEdit; }
         set { _ConsoleProperties.bQuickEdit = value; }
      }

      public bool InsertMode
      {
         get { return _ConsoleProperties.bInsertMode; }
         set { _ConsoleProperties.bInsertMode = value; }
      }

      public bool AutoPosition
      {
         get { return _ConsoleProperties.bAutoPosition; }
         set { _ConsoleProperties.bAutoPosition = value; }
      }

      public void SetScreenBufferSize(short x, short y)
      {
         _ConsoleProperties.dwScreenBufferSize.X = x;
         _ConsoleProperties.dwScreenBufferSize.Y = y;
      }

      public void SetWindowSize(short x, short y)
      {
         _ConsoleProperties.dwWindowSize.X = x;
         _ConsoleProperties.dwWindowSize.Y = y;
      }

      public uint CommandHistoryBufferSize
      {
         get { return _ConsoleProperties.uHistoryBufferSize; }
         set { _ConsoleProperties.uHistoryBufferSize = value; }
      }

      public uint CommandHistoryBufferCount
      {
         get { return _ConsoleProperties.uNumberOfHistoryBuffers; }
         set { _ConsoleProperties.uNumberOfHistoryBuffers = value; }
      }

      public byte ScreenBackgroundColor
      {
         set
         {
            _ScreenFill &= 0x000f;
            _ScreenFill += (ushort)(value << 4);
         }
      }

      public byte ScreenTextColor
      {
         set
         {
            _ScreenFill &= 0x00f0;
            _ScreenFill += value;
         }
      }

      public byte PopUpBackgroundColor
      {
         set
         {
            _PopUpFill &= 0x000f;
            _PopUpFill += (ushort)(value << 4);
         }
      }

      public byte PopUpTextColor
      {
         set
         {
            _PopUpFill &= 0x00f0;
            _PopUpFill += value;
         }
      }

      // This does more than console colors
      private void SetConsoleColors()
      {
         for (int i = 0; i < 16; i++)
         {
            _ConsoleProperties.ColorTable[i] = (uint)ColorTranslator.ToWin32(ConsoleColors[i]);
         }
         _ConsoleProperties.wFillAttribute = _ScreenFill;
         _ConsoleProperties.wPopupFillAttribute = _PopUpFill; ;

         IntPtr pConsoleProperties = Marshal.AllocCoTaskMem(_ConsoleProperties.cbSize);
         Marshal.StructureToPtr(_ConsoleProperties, pConsoleProperties, true);
         ((IShellLinkDataList)_ShellLink).RemoveDataBlock(0xA0000002);
         ((IShellLinkDataList)_ShellLink).AddDataBlock(pConsoleProperties);
      }
   }
}
"@ -ReferencedAssemblies System.Drawing

function global:Get-Link { 
param([Parameter(ValueFromPipelineByPropertyName=$true)][Alias("PSPath")][string]$Path) 
process {
   New-Object Huddled.Interop.ShellLink (Convert-Path $Path)
}
}

}
process { 
   Get-Link $Path
}