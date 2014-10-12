#include <jni.h>
#include <android/log.h>
#include "fann.h"
#include "floatfann.h"

#define  LOG_TAG "FANN TEST"
#define  LOG(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)

using namespace std;

extern "C" {
JNIEXPORT void JNICALL Java_de_vion_fanntest_MainActivity_testFann(JNIEnv* jenv,
		jclass) {

	//Init fann
	struct fann* ann;
	ann = fann_create_standard(2, 10, 2);
	fann_set_training_algorithm(ann, FANN_TRAIN_INCREMENTAL);
	fann_set_activation_function_output(ann, FANN_SIGMOID);

	//train fann with some data
	for (int j = 0; j < 20; j++) {
		for (int i = 0; i < 11; i++) {
			fann_type input[10];
			input[0] = float(i) / 10.0f;
			input[1] = float(i) / 10.0f;
			input[2] = float(i) / 10.0f;
			input[3] = float(i) / 10.0f;
			input[4] = float(i) / 10.0f;
			input[5] = float(i) / 10.0f;
			input[6] = float(i) / 10.0f;
			input[7] = float(i) / 10.0f;
			input[8] = float(i) / 10.0f;
			input[9] = float(i) / 10.0f;

			fann_type output[2] = { float(i) / 10.0f, float(i) / 10.0f };
			fann_train(ann, input, output);
		}
	}

	// Calculate values based on the training
	for (int i = 0; i < 11; i++) {
		fann_type input[10];
		input[0] = float(i) / 10.0f;
		input[1] = float(i) / 10.0f;
		input[2] = float(i) / 10.0f;
		input[3] = float(i) / 10.0f;
		input[4] = float(i) / 10.0f;
		input[5] = float(i) / 10.0f;
		input[6] = float(i) / 10.0f;
		input[7] = float(i) / 10.0f;
		input[8] = float(i) / 10.0f;
		input[9] = float(i) / 10.0f;

		fann_type* calc_out = fann_run(ann, input);
		LOG("Test (%f,%f) -> (%f %f)\n", input[0], input[1], calc_out[0],
				calc_out[1]);
	}
}
}
