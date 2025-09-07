// Function specifiers in case library is build/used as a shared library (Windows)
// NOTE: Microsoft specifiers to tell compiler that symbols are imported/exported from a .dll
#if defined(_WIN32)
    #if defined(BUILD_LIBTYPE_SHARED)
        #if defined(__TINYC__)
            #define __declspec(x) __attribute__((x))
        #endif
        #define RLAPI __declspec(dllexport)     // We are building the library as a Win32 shared library (.dll)
    #elif defined(USE_LIBTYPE_SHARED)
        #define RLAPI __declspec(dllimport)     // We are using the library as a Win32 shared library (.dll)
    #endif
#endif


#ifndef RLAPI
    #define RLAPI       // Functions defined as 'extern' by default (implicit specifiers)
#endif

typedef struct Model {} Model;
typedef struct ModelAnimation {} ModelAnimation;
typedef struct Vector2 {} Vector2;
typedef struct Vector3 {} Vector3;
typedef struct BoundingBox {} BoundingBox;
typedef struct Rectangle {} Rectangle;
typedef struct Image {} Image;
typedef struct Mesh {} Mesh;
typedef struct Font {} Font;
typedef struct Wave {} Wave;
typedef struct Sound {} Sound;
typedef struct Music {} Music;
typedef struct AudioStream {} AudioStream;
typedef enum bool { false = 0, true = !false } bool;

// Input-related functions: gamepads
RLAPI bool WindowShouldClose(void);                               // Check if KEY_ESCAPE pressed or Close icon pressed
RLAPI bool IsWindowReady(void);                                   // Check if window has been initialized successfully
RLAPI bool IsWindowFullscreen(void);                              // Check if window is currently fullscreen
RLAPI bool IsWindowHidden(void);                                  // Check if window is currently hidden (only PLATFORM_DESKTOP)
RLAPI bool IsWindowMinimized(void);                               // Check if window is currently minimized (only PLATFORM_DESKTOP)
RLAPI bool IsWindowMaximized(void);                               // Check if window is currently maximized (only PLATFORM_DESKTOP)
RLAPI bool IsWindowFocused(void);                                 // Check if window is currently focused (only PLATFORM_DESKTOP)
RLAPI bool IsWindowResized(void);                                 // Check if window has been resized last frame
RLAPI bool IsWindowState(unsigned int flag);                      // Check if one specific window flag is enabled
RLAPI bool IsCursorHidden(void);                                  // Check if cursor is not visible
RLAPI bool IsCursorOnScreen(void);                                // Check if cursor is on the screen
RLAPI bool SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite);   // Save data to file from byte array (write), returns true on success
RLAPI bool ExportDataAsCode(const char *data, unsigned int size, const char *fileName); // Export data to code (.h), returns true on success
RLAPI bool SaveFileText(const char *fileName, char *text);        // Save text data to file (write), string must be '\0' terminated, returns true on success
RLAPI bool FileExists(const char *fileName);                      // Check if file exists
RLAPI bool DirectoryExists(const char *dirPath);                  // Check if a directory path exists
RLAPI bool IsFileExtension(const char *fileName, const char *ext); // Check file extension (including point: .png, .wav)
RLAPI bool ChangeDirectory(const char *dir);                      // Change working directory, return true on success
RLAPI bool IsPathFile(const char *path);                          // Check if a given path is a file or a directory
RLAPI bool IsFileDropped(void);                                   // Check if a file has been dropped into window
RLAPI bool IsKeyPressed(int key);                             // Check if a key has been pressed once
RLAPI bool IsKeyDown(int key);                                // Check if a key is being pressed
RLAPI bool IsKeyReleased(int key);                            // Check if a key has been released once
RLAPI bool IsKeyUp(int key);                                  // Check if a key is NOT being pressed
RLAPI bool IsGamepadAvailable(int gamepad);                   // Check if a gamepad is available
RLAPI bool IsGamepadButtonPressed(int gamepad, int button);   // Check if a gamepad button has been pressed once
RLAPI bool IsGamepadButtonDown(int gamepad, int button);      // Check if a gamepad button is being pressed
RLAPI bool IsGamepadButtonReleased(int gamepad, int button);  // Check if a gamepad button has been released once
RLAPI bool IsGamepadButtonUp(int gamepad, int button);        // Check if a gamepad button is NOT being pressed
RLAPI bool IsMouseButtonPressed(int button);                  // Check if a mouse button has been pressed once
RLAPI bool IsMouseButtonDown(int button);                     // Check if a mouse button is being pressed
RLAPI bool IsMouseButtonReleased(int button);                 // Check if a mouse button has been released once
RLAPI bool IsMouseButtonUp(int button);                       // Check if a mouse button is NOT being pressed
RLAPI bool IsGestureDetected(int gesture);              // Check if a gesture have been detected
RLAPI bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles
RLAPI bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles
RLAPI bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);                         // Check collision between circle and rectangle
RLAPI bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
RLAPI bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle
RLAPI bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle
RLAPI bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference
RLAPI bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);                // Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
RLAPI bool ExportImage(Image image, const char *fileName);                                               // Export image data to file, returns true on success
RLAPI bool ExportImageAsCode(Image image, const char *fileName);                                         // Export image as code file defining an array of bytes, returns true on success
RLAPI bool ExportFontAsCode(Font font, const char *fileName);                               // Export font as code file, returns true on success
RLAPI bool TextIsEqual(const char *text1, const char *text2);                               // Check if two text string are equal
RLAPI bool ExportMesh(Mesh mesh, const char *fileName);                                     // Export mesh data to file, returns true on success
RLAPI bool IsModelAnimationValid(Model model, ModelAnimation anim);                         // Check model animation skeleton match
RLAPI bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2);   // Check collision between two spheres
RLAPI bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);                                 // Check collision between two bounding boxes
RLAPI bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);                  // Check collision between box and sphere
RLAPI bool IsAudioDeviceReady(void);                                  // Check if audio device has been initialized successfully
RLAPI bool ExportWave(Wave wave, const char *fileName);               // Export wave data to file, returns true on success
RLAPI bool ExportWaveAsCode(Wave wave, const char *fileName);         // Export wave sample data to code (.h), returns true on success
RLAPI bool IsSoundPlaying(Sound sound);                               // Check if a sound is currently playing
RLAPI bool IsMusicStreamPlaying(Music music);                         // Check if music is playing
RLAPI bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
RLAPI bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
