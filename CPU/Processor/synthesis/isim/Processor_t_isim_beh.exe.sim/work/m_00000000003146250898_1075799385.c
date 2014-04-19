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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//vboxsrv/VirtualShare/CPU/src/BranchPredictor.v";
static unsigned int ng1[] = {2U, 0U};
static unsigned int ng2[] = {3U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};



static void Always_29_0(char *t0)
{
    char t9[8];
    char t10[8];
    char t13[8];
    char t24[8];
    char t33[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;

LAB0:    t1 = (t0 + 3712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 4528);
    *((int *)t2) = 1;
    t3 = (t0 + 3744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 2632);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2792);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(31, ng0);
    t11 = (t0 + 1752U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    t11 = (t12 + 4);
    t14 = *((unsigned int *)t11);
    t15 = (~(t14));
    t16 = *((unsigned int *)t12);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t11) != 0)
        goto LAB20;

LAB21:    t20 = (t13 + 4);
    t21 = *((unsigned int *)t13);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB22;

LAB23:    memcpy(t41, t13, 8);

LAB24:    memset(t10, 0, 8);
    t73 = (t41 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 & 1U);
    if (t78 != 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t73) != 0)
        goto LAB38;

LAB39:    t80 = (t10 + 4);
    t81 = *((unsigned int *)t10);
    t82 = *((unsigned int *)t80);
    t83 = (t81 || t82);
    if (t83 > 0)
        goto LAB40;

LAB41:    t85 = *((unsigned int *)t10);
    t86 = (~(t85));
    t87 = *((unsigned int *)t80);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t80) > 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t10) > 0)
        goto LAB46;

LAB47:    memcpy(t9, t89, 8);

LAB48:    t90 = (t0 + 2792);
    xsi_vlogvar_assign_value(t90, t9, 0, 0, 2);
    goto LAB17;

LAB9:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 1752U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t3) != 0)
        goto LAB51;

LAB52:    t7 = (t10 + 4);
    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t7);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB53;

LAB54:    t44 = *((unsigned int *)t10);
    t48 = (~(t44));
    t49 = *((unsigned int *)t7);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t7) > 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t10) > 0)
        goto LAB59;

LAB60:    memcpy(t9, t32, 8);

LAB61:    t34 = (t0 + 2792);
    xsi_vlogvar_assign_value(t34, t9, 0, 0, 2);
    goto LAB17;

LAB11:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 1752U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB75;

LAB76:    if (*((unsigned int *)t3) != 0)
        goto LAB77;

LAB78:    t7 = (t10 + 4);
    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t7);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB79;

LAB80:    t44 = *((unsigned int *)t10);
    t48 = (~(t44));
    t49 = *((unsigned int *)t7);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t7) > 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t10) > 0)
        goto LAB85;

LAB86:    memcpy(t9, t32, 8);

LAB87:    t34 = (t0 + 2792);
    xsi_vlogvar_assign_value(t34, t9, 0, 0, 2);
    goto LAB17;

LAB13:    xsi_set_current_line(34, ng0);
    t3 = (t0 + 1752U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t3 = (t4 + 4);
    t14 = *((unsigned int *)t3);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB101;

LAB102:    if (*((unsigned int *)t3) != 0)
        goto LAB103;

LAB104:    t7 = (t13 + 4);
    t21 = *((unsigned int *)t13);
    t22 = *((unsigned int *)t7);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB105;

LAB106:    memcpy(t33, t13, 8);

LAB107:    memset(t10, 0, 8);
    t40 = (t33 + 4);
    t68 = *((unsigned int *)t40);
    t69 = (~(t68));
    t70 = *((unsigned int *)t33);
    t71 = (t70 & t69);
    t72 = (t71 & 1U);
    if (t72 != 0)
        goto LAB115;

LAB116:    if (*((unsigned int *)t40) != 0)
        goto LAB117;

LAB118:    t46 = (t10 + 4);
    t74 = *((unsigned int *)t10);
    t75 = *((unsigned int *)t46);
    t76 = (t74 || t75);
    if (t76 > 0)
        goto LAB119;

LAB120:    t77 = *((unsigned int *)t10);
    t78 = (~(t77));
    t81 = *((unsigned int *)t46);
    t82 = (t78 || t81);
    if (t82 > 0)
        goto LAB121;

LAB122:    if (*((unsigned int *)t46) > 0)
        goto LAB123;

LAB124:    if (*((unsigned int *)t10) > 0)
        goto LAB125;

LAB126:    memcpy(t9, t55, 8);

LAB127:    t56 = (t0 + 2792);
    xsi_vlogvar_assign_value(t56, t9, 0, 0, 2);
    goto LAB17;

LAB18:    *((unsigned int *)t13) = 1;
    goto LAB21;

LAB20:    t19 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB21;

LAB22:    t25 = (t0 + 1912U);
    t26 = *((char **)t25);
    memset(t24, 0, 8);
    t25 = (t26 + 4);
    t27 = *((unsigned int *)t25);
    t28 = (~(t27));
    t29 = *((unsigned int *)t26);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB28;

LAB26:    if (*((unsigned int *)t25) == 0)
        goto LAB25;

LAB27:    t32 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t32) = 1;

LAB28:    memset(t33, 0, 8);
    t34 = (t24 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t24);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t34) != 0)
        goto LAB31;

LAB32:    t42 = *((unsigned int *)t13);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t45 = (t13 + 4);
    t46 = (t33 + 4);
    t47 = (t41 + 4);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    *((unsigned int *)t47) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB24;

LAB25:    *((unsigned int *)t24) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t33) = 1;
    goto LAB32;

LAB31:    t40 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB32;

LAB33:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t41) = (t53 | t54);
    t55 = (t13 + 4);
    t56 = (t33 + 4);
    t57 = *((unsigned int *)t13);
    t58 = (~(t57));
    t59 = *((unsigned int *)t55);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t56);
    t64 = (~(t63));
    t65 = (t58 & t60);
    t66 = (t62 & t64);
    t67 = (~(t65));
    t68 = (~(t66));
    t69 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t69 & t67);
    t70 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB35;

LAB36:    *((unsigned int *)t10) = 1;
    goto LAB39;

LAB38:    t79 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t79) = 1;
    goto LAB39;

LAB40:    t84 = ((char*)((ng2)));
    goto LAB41;

LAB42:    t89 = ((char*)((ng1)));
    goto LAB43;

LAB44:    xsi_vlog_unsigned_bit_combine(t9, 2, t84, 2, t89, 2);
    goto LAB48;

LAB46:    memcpy(t9, t84, 8);
    goto LAB48;

LAB49:    *((unsigned int *)t10) = 1;
    goto LAB52;

LAB51:    t5 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB52;

LAB53:    t11 = (t0 + 1912U);
    t12 = *((char **)t11);
    memset(t24, 0, 8);
    t11 = (t12 + 4);
    t27 = *((unsigned int *)t11);
    t28 = (~(t27));
    t29 = *((unsigned int *)t12);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t11) != 0)
        goto LAB64;

LAB65:    t20 = (t24 + 4);
    t35 = *((unsigned int *)t24);
    t36 = *((unsigned int *)t20);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB66;

LAB67:    t38 = *((unsigned int *)t24);
    t39 = (~(t38));
    t42 = *((unsigned int *)t20);
    t43 = (t39 || t42);
    if (t43 > 0)
        goto LAB68;

LAB69:    if (*((unsigned int *)t20) > 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t24) > 0)
        goto LAB72;

LAB73:    memcpy(t13, t26, 8);

LAB74:    goto LAB54;

LAB55:    t32 = ((char*)((ng2)));
    goto LAB56;

LAB57:    xsi_vlog_unsigned_bit_combine(t9, 2, t13, 2, t32, 2);
    goto LAB61;

LAB59:    memcpy(t9, t13, 8);
    goto LAB61;

LAB62:    *((unsigned int *)t24) = 1;
    goto LAB65;

LAB64:    t19 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB65;

LAB66:    t25 = ((char*)((ng1)));
    goto LAB67;

LAB68:    t26 = ((char*)((ng3)));
    goto LAB69;

LAB70:    xsi_vlog_unsigned_bit_combine(t13, 2, t25, 2, t26, 2);
    goto LAB74;

LAB72:    memcpy(t13, t25, 8);
    goto LAB74;

LAB75:    *((unsigned int *)t10) = 1;
    goto LAB78;

LAB77:    t5 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB78;

LAB79:    t11 = (t0 + 1912U);
    t12 = *((char **)t11);
    memset(t24, 0, 8);
    t11 = (t12 + 4);
    t27 = *((unsigned int *)t11);
    t28 = (~(t27));
    t29 = *((unsigned int *)t12);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB88;

LAB89:    if (*((unsigned int *)t11) != 0)
        goto LAB90;

LAB91:    t20 = (t24 + 4);
    t35 = *((unsigned int *)t24);
    t36 = *((unsigned int *)t20);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB92;

LAB93:    t38 = *((unsigned int *)t24);
    t39 = (~(t38));
    t42 = *((unsigned int *)t20);
    t43 = (t39 || t42);
    if (t43 > 0)
        goto LAB94;

LAB95:    if (*((unsigned int *)t20) > 0)
        goto LAB96;

LAB97:    if (*((unsigned int *)t24) > 0)
        goto LAB98;

LAB99:    memcpy(t13, t26, 8);

LAB100:    goto LAB80;

LAB81:    t32 = ((char*)((ng3)));
    goto LAB82;

LAB83:    xsi_vlog_unsigned_bit_combine(t9, 2, t13, 2, t32, 2);
    goto LAB87;

LAB85:    memcpy(t9, t13, 8);
    goto LAB87;

LAB88:    *((unsigned int *)t24) = 1;
    goto LAB91;

LAB90:    t19 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB91;

LAB92:    t25 = ((char*)((ng2)));
    goto LAB93;

LAB94:    t26 = ((char*)((ng4)));
    goto LAB95;

LAB96:    xsi_vlog_unsigned_bit_combine(t13, 2, t25, 2, t26, 2);
    goto LAB100;

LAB98:    memcpy(t13, t25, 8);
    goto LAB100;

LAB101:    *((unsigned int *)t13) = 1;
    goto LAB104;

LAB103:    t5 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB104;

LAB105:    t11 = (t0 + 1912U);
    t12 = *((char **)t11);
    memset(t24, 0, 8);
    t11 = (t12 + 4);
    t27 = *((unsigned int *)t11);
    t28 = (~(t27));
    t29 = *((unsigned int *)t12);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB108;

LAB109:    if (*((unsigned int *)t11) != 0)
        goto LAB110;

LAB111:    t35 = *((unsigned int *)t13);
    t36 = *((unsigned int *)t24);
    t37 = (t35 & t36);
    *((unsigned int *)t33) = t37;
    t20 = (t13 + 4);
    t25 = (t24 + 4);
    t26 = (t33 + 4);
    t38 = *((unsigned int *)t20);
    t39 = *((unsigned int *)t25);
    t42 = (t38 | t39);
    *((unsigned int *)t26) = t42;
    t43 = *((unsigned int *)t26);
    t44 = (t43 != 0);
    if (t44 == 1)
        goto LAB112;

LAB113:
LAB114:    goto LAB107;

LAB108:    *((unsigned int *)t24) = 1;
    goto LAB111;

LAB110:    t19 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB111;

LAB112:    t48 = *((unsigned int *)t33);
    t49 = *((unsigned int *)t26);
    *((unsigned int *)t33) = (t48 | t49);
    t32 = (t13 + 4);
    t34 = (t24 + 4);
    t50 = *((unsigned int *)t13);
    t51 = (~(t50));
    t52 = *((unsigned int *)t32);
    t53 = (~(t52));
    t54 = *((unsigned int *)t24);
    t57 = (~(t54));
    t58 = *((unsigned int *)t34);
    t59 = (~(t58));
    t65 = (t51 & t53);
    t66 = (t57 & t59);
    t60 = (~(t65));
    t61 = (~(t66));
    t62 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t62 & t60);
    t63 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t63 & t61);
    t64 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t64 & t60);
    t67 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t67 & t61);
    goto LAB114;

LAB115:    *((unsigned int *)t10) = 1;
    goto LAB118;

LAB117:    t45 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB118;

LAB119:    t47 = ((char*)((ng3)));
    goto LAB120;

LAB121:    t55 = ((char*)((ng4)));
    goto LAB122;

LAB123:    xsi_vlog_unsigned_bit_combine(t9, 2, t47, 2, t55, 2);
    goto LAB127;

LAB125:    memcpy(t9, t47, 8);
    goto LAB127;

}

static void Always_40_1(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 3960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 4544);
    *((int *)t2) = 1;
    t3 = (t0 + 3992);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t5 = (t0 + 2232U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2792);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 2632);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 2, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(42, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 2632);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 2, 0LL);
    goto LAB12;

}

static void Cont_49_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 4208U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2632);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t5, 0, 8);
    t6 = (t5 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t5) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t6) = t13;
    t14 = (t0 + 4640);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t18, 0, 8);
    t19 = 1U;
    t20 = t19;
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t5);
    t19 = (t19 & t22);
    t23 = *((unsigned int *)t21);
    t20 = (t20 & t23);
    t24 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 | t19);
    t26 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t26 | t20);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t27 = (t0 + 4560);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void work_m_00000000003146250898_1075799385_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Always_40_1,(void *)Cont_49_2};
	xsi_register_didat("work_m_00000000003146250898_1075799385", "isim/Processor_t_isim_beh.exe.sim/work/m_00000000003146250898_1075799385.didat");
	xsi_register_executes(pe);
}
