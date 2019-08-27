//#include <torch/torch.h>
#include <torch/script.h> // One-stop header.

#include <iostream>
#include <vector>
#include <memory>
#include <cmath>

#include <iostream>
#include <chrono>

#include <opencv2/core/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui/highgui.hpp>
// #include "opencv2/imgproc/imgproc_c.h"
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgproc/types_c.h>
#include <iostream>
#include <time.h>
#include <ostream>

#include "../../include/termcolor/termcolor.hpp"
#include "../../include/tqdm/tqdm.h"
//#include <include/termcolor/termcolor.hpp>

using namespace std;
//using namespace cv;
using namespace std::chrono;


int main(int argc, char *argv[]) { //./../res34_model_cpp.pt ./../imgs/RGB_00_001.jpg
    
    std::cout << termcolor::reset << std::endl;
    cout << termcolor::green<<  "OpenCV version : " << CV_VERSION << endl;
    cout << "Major version : " << CV_MAJOR_VERSION << endl;
    cout << "Minor version : " << CV_MINOR_VERSION << endl;
    cout << "Subminor version : " << CV_SUBMINOR_VERSION << endl;
    std::cout << termcolor::reset << std::endl;

}
