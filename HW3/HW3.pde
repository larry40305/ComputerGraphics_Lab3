import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

public Vector4 renderer_size;
static public float GH_FOV = 45.0f;
static public float GH_NEAR_MIN = 1e-3f;
static public float GH_NEAR_MAX = 1e-1f;
static public float GH_FAR = 1000.0f;

public boolean debug = true;

public float[] GH_DEPTH;
public PImage renderBuffer;

Engine engine;
Camera main_camera;
Vector3 cam_position;
Vector3 lookat;

void setup() {
    size(1000, 600);
    renderer_size = new Vector4(20, 50, 520, 550);
    cam_position = new Vector3(0, 0, -10);
    lookat = new Vector3(0, 0, 0);
    setDepthBuffer();
    main_camera = new Camera();
    engine = new Engine();

}

void setDepthBuffer(){
    renderBuffer = new PImage(int(renderer_size.z - renderer_size.x) , int(renderer_size.w - renderer_size.y));
    GH_DEPTH = new float[int(renderer_size.z - renderer_size.x) * int(renderer_size.w - renderer_size.y)];
    for(int i = 0 ; i < GH_DEPTH.length;i++){
        GH_DEPTH[i] = 1.0;
        renderBuffer.pixels[i] = color(1.0*250);
    }
}

void draw() {
    background(255);

    engine.run();
    cameraControl();
}

String selectFile() {
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.setCurrentDirectory(new File("."));
    fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
    FileNameExtensionFilter filter = new FileNameExtensionFilter("Obj Files", "obj");
    fileChooser.setFileFilter(filter);

    int result = fileChooser.showOpenDialog(null);
    if (result == JFileChooser.APPROVE_OPTION) {
        String filePath = fileChooser.getSelectedFile().getAbsolutePath();
        return filePath;
    }
    return "";
}

void cameraControl(){
    // You can write your own camera control function here.
    // Use setPositionOrientation(Vector3 position,Vector3 lookat) to modify the ViewMatrix.
    // Hint : Use keyboard event and mouse click event to change the position of the camera.       
        
    float moveSpeed = 0.1f; // 定義攝影機移動速度

    // 使用鍵盤控制攝影機位置
    if (keyPressed) {
        if (key == 'w' || key == 'W') {
            cam_position.z += moveSpeed; // 向前移動
            lookat.z += moveSpeed;
        }
        if (key == 's' || key == 'S') {
            cam_position.z -= moveSpeed; // 向後移動
            lookat.z -= moveSpeed;
        }
        if (key == 'a' || key == 'A') {
            cam_position.x -= moveSpeed; // 向左移動
            lookat.x -= moveSpeed;
        }
        if (key == 'd' || key == 'D') {
            cam_position.x += moveSpeed; // 向右移動
            lookat.x += moveSpeed;
        }
        if (key == 'q' || key == 'Q') {
            cam_position.y += moveSpeed; // 向上移動
            lookat.y += moveSpeed;
        }
        if (key == 'e' || key == 'E') {
            cam_position.y -= moveSpeed; // 向下移動
            lookat.y -= moveSpeed;
        }
    }
    
    // 更新攝影機的位置與方向
    main_camera.setPositionOrientation(cam_position, lookat);

}