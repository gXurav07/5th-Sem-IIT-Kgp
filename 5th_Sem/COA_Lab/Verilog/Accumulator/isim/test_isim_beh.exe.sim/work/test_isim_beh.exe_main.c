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
    work_m_04189866455846866749_0209709607_init();
    work_m_09262010590735694361_2648124674_init();
    work_m_12970112173536758654_2830143875_init();
    work_m_17625849897343683476_3673085417_init();
    work_m_02967846213219870832_1756712915_init();
    work_m_15800317713626579329_1985558087_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_15800317713626579329_1985558087");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
