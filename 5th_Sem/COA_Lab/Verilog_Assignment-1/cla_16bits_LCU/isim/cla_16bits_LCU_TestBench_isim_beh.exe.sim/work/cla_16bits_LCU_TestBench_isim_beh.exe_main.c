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
    work_m_16223417201525060475_1170524573_init();
    work_m_01237263699303992164_4054363102_init();
    work_m_05025070089737793154_2774494425_init();
    work_m_09558223181719457225_2543805730_init();
    work_m_01063860211404631943_2620537792_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_01063860211404631943_2620537792");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
