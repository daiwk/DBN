/* ========================================================================= *
 * Master thesis "Collaborative filtering, a neural network approach".
 *
 * Configuration file.
 *
 * - Author: LOUPPE Gilles
 * - Last changes: April 15, 2010
 * ========================================================================= */

#ifndef _CONFIGURATIONL_H_
#define _CONFIGURATION_H_

#include "Dataset.h"

using namespace std;


/* ========================================================================= *
 * Configuration
 * ========================================================================= */

namespace Config {
    namespace Netflix {
        const int NB_MOVIES = 17770;
        const int NB_USERS = 480189;
    }

    namespace Sets {
        static const string LS = "../../data/bin/LS.bin";
        static const string VS = "../../data/bin/VS.bin";
        static const string TS = "../../data/bin/TS.bin";
        static const string QS = "../../data/bin/QS.bin";
    }

    namespace RBM {
        /* Dimensions */
        static const int N = Netflix::NB_USERS;
        static const int M = Netflix::NB_MOVIES;
        static const int K = 5;
        static const int F = 20;

        /* Algorithm */
        static const bool CONDITIONAL = true;
        static const bool OPENMP = true;  // false;

        /* Training parameters */
        static const int EPOCHS = 100;
        static const int BATCH_SIZE = 50;  // 100;
        static const int CD_STEPS = 1;
        static const double EPS_W = 0.0015;
        static const double EPS_VB = 0.0012;
        static const double EPS_HB = 0.1;
        static const double EPS_D = 0.001;
        static const double WEIGHT_COST = 0.0001;
        static const double MOMENTUM = 0.9;
        static const bool ANNEALING = true;
        static const double ANNEALING_RATE = 3.;

        /* Misc */
        static const bool VERBOSE = false;
    }

    namespace RBM_P {
        /* Dimensions */
        static const int N = 1; // Netflix::NB_USERS;
        static const int M = 20;// 是前一个rbm的隐层节点个数。 Netflix::NB_MOVIES;
        static const int K = 1;
        static const int F = 20;// 当前rbm的隐层节点个数。

        /* Algorithm */
        static const bool CONDITIONAL = false; //d就不用更新了，也不用考虑QS这个数据源了
        static const bool OPENMP = true;// false;

        /* Training parameters */
        static const int EPOCHS = 10;
        static const int BATCH_SIZE = 1;
        static const int CD_STEPS = 1;
        static const double EPS_W = 0.0015;
        static const double EPS_VB = 0.0012;
        static const double EPS_HB = 0.1;
        static const double EPS_D = 0.001;
        static const double WEIGHT_COST = 0.0001;
        static const double MOMENTUM = 0.9;
        static const bool ANNEALING = true;
        static const double ANNEALING_RATE = 3.;

        /* Misc */
        static const bool VERBOSE = false;
    }

    namespace DBN {
        static const int TRAIN_EPOCHS = 1; // 只为DBN
    }
    namespace MapReduce {
        static const bool ROUNDROBIN = false;
    }

    namespace Ensemble {
        //static const int NB_RBMS = 10;
        static const int NB_MOVIES = Netflix::NB_MOVIES;
        static const int NB_USERS = Netflix::NB_USERS;
    }
}

#endif
