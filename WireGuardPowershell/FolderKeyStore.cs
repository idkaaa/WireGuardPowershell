using System.IO;


/// <summary>
/// Class to manage storing/retrieving public/private keys for 
/// WireGuard peers.
/// </summary>
public class FolderKeyStore
{
    /// <summary>
    /// The global singleton filesystem keystore for peer public/private keys
    /// </summary>
    public static FolderKeyStore KeyStore = new FolderKeyStore("./keys");

    /// <summary>
    /// Folder that stores the keys on the filesystem
    /// </summary>
    public string Folder { get; private set; }


    /// <summary>
    /// Constructor
    /// </summary>
    /// <param name="folderPath"></param>
    private FolderKeyStore(string folderPath)
    {
        Folder = folderPath;
    }

    /// <summary>
    /// Loads a public/private key from the store for a given peer.
    /// </summary>
    public Keypair Load(PeerID peer)
    {
        string privateKeyPath = Path.Combine(Folder, GetPrivateKeyFilename(peer));
        string publicKeyPath = Path.Combine(Folder, GetPublicKeyFilename(peer));
        try
        {
            string privateKey = File.ReadAllText(privateKeyPath);
            string publicKey = File.ReadAllText(publicKeyPath);
            return new Keypair(pub: publicKey, priv: privateKey);
        }
        catch (System.Exception)
        {
            return default;
        }
    }

    /// <summary>
    /// Tries to save a peer's public/private key to the store for later retrieval.
    /// </summary>
    /// <param name="peer"></param>
    /// <param name="kp"></param>
    /// <returns></returns>
    public bool TrySave(PeerID peer, Keypair kp)
    {
        string privateKeyPath = Path.Combine(Folder, GetPrivateKeyFilename(peer));
        string publicKeyPath = Path.Combine(Folder, GetPublicKeyFilename(peer));
        try
        {
            File.WriteAllText(privateKeyPath, kp.Private);
            File.WriteAllText(publicKeyPath, kp.Public);
            return true;
        }
        catch (System.Exception)
        {
            return false;
        }
    }

    private static string GetPrivateKeyFilename(PeerID peer)
    {
        return "ID_" + peer.Name.ToString();
    }
    private static string GetPublicKeyFilename(PeerID peer)
    {
        return GetPrivateKeyFilename(peer) + ".pub";
    }

}


