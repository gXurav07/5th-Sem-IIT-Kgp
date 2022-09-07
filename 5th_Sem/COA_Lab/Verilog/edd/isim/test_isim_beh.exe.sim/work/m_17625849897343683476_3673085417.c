/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/gaurav/IIT_KGP_COURSES/5th_Sem/COA_Lab/Assignment-3(Verilog)/Verilog Demo/ISE Project/Accumulator/dff.v";
static unsigned int ng1[] = {0U, 0U};



static void Always_22_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 2680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 3000);
    *((int *)t2) = 1;
    t3 = (t0 + 2712);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(23, ng0);

LAB5:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(25, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 5, 0LL);
    goto LAB8;

}


extern void work_m_17625849897343683476_3673085417_init()
{
	static char *pe[] = {(void *)Always_22_0};
	xsi_register_didat("work_m_17625849897343683476_3673085417", "isim/test_isim_beh.exe.sim/work/m_17625849897343683476_3673085417.didat");
	xsi_register_executes(pe);
}