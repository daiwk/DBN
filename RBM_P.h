// class: RBM_P
// Author: daiwenkai
// Date: Feb 24, 2014

#ifndef _RBM_P_H_
#define _RBM_P_H_


#include "RBM.h"

class RBM_P : public RBM {
// Constructors
public:
    RBM_P();
    RBM_P(string filename);
    virtual ~RBM_P();

// Methods
    virtual void train_full(bool reset, int rbmlayers_id);

// Attributes


};

#endif
