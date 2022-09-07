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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_09262010590735694361_2648124674_init();
    work_m_13770441268522199069_0967616311_init();
    work_m_06341958504635804885_4238183179_init();
    work_m_02723298529221284175_2543805730_init();
    work_m_11723006885467575655_0556247447_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_11723006885467575655_0556247447");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
