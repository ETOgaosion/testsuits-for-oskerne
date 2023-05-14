
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/waitpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0fa0006f          	j	10fc <__start_main>

0000000000001006 <test_waitpid>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

int i = 1000;
void test_waitpid(void){
    1006:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	03050513          	addi	a0,a0,48 # 2038 <__clone+0x2c>
void test_waitpid(void){
    1010:	f406                	sd	ra,40(sp)
    1012:	f022                	sd	s0,32(sp)
    1014:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1016:	2e6000ef          	jal	ra,12fc <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	0e650513          	addi	a0,a0,230 # 2100 <__func__.1187>
    1022:	2da000ef          	jal	ra,12fc <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	02a50513          	addi	a0,a0,42 # 2050 <__clone+0x44>
    102e:	2ce000ef          	jal	ra,12fc <puts>
    int cpid, wstatus;
    cpid = fork();
    1032:	5cf000ef          	jal	ra,1e00 <fork>
    assert(cpid != -1);
    1036:	54fd                	li	s1,-1
    cpid = fork();
    1038:	842a                	mv	s0,a0
    assert(cpid != -1);
    103a:	04950963          	beq	a0,s1,108c <test_waitpid+0x86>
    if(cpid == 0){
    103e:	e93d                	bnez	a0,10b4 <test_waitpid+0xae>
	while(i--);
    1040:	00001797          	auipc	a5,0x1
    1044:	0e97a223          	sw	s1,228(a5) # 2124 <i>
	sched_yield();
    1048:	5ad000ef          	jal	ra,1df4 <sched_yield>
	printf("This is child process\n");
    104c:	00001517          	auipc	a0,0x1
    1050:	03450513          	addi	a0,a0,52 # 2080 <__clone+0x74>
    1054:	2ca000ef          	jal	ra,131e <printf>
        exit(3);
    1058:	450d                	li	a0,3
    105a:	5cb000ef          	jal	ra,1e24 <exit>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
	else
	    printf("waitpid error.\n");

    }
    TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	07250513          	addi	a0,a0,114 # 20d0 <__clone+0xc4>
    1066:	296000ef          	jal	ra,12fc <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	09650513          	addi	a0,a0,150 # 2100 <__func__.1187>
    1072:	28a000ef          	jal	ra,12fc <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	fda50513          	addi	a0,a0,-38 # 2050 <__clone+0x44>
    107e:	27e000ef          	jal	ra,12fc <puts>
}
    1082:	70a2                	ld	ra,40(sp)
    1084:	7402                	ld	s0,32(sp)
    1086:	64e2                	ld	s1,24(sp)
    1088:	6145                	addi	sp,sp,48
    108a:	8082                	ret
    assert(cpid != -1);
    108c:	00001517          	auipc	a0,0x1
    1090:	fd450513          	addi	a0,a0,-44 # 2060 <__clone+0x54>
    1094:	52e000ef          	jal	ra,15c2 <panic>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    1098:	4601                	li	a2,0
    109a:	006c                	addi	a1,sp,12
    109c:	557d                	li	a0,-1
    109e:	591000ef          	jal	ra,1e2e <waitpid>
	assert(ret != -1);
    10a2:	00850f63          	beq	a0,s0,10c0 <test_waitpid+0xba>
	    printf("waitpid error.\n");
    10a6:	00001517          	auipc	a0,0x1
    10aa:	01a50513          	addi	a0,a0,26 # 20c0 <__clone+0xb4>
    10ae:	270000ef          	jal	ra,131e <printf>
    10b2:	b775                	j	105e <test_waitpid+0x58>
	pid_t ret = waitpid(cpid, &wstatus, 0);
    10b4:	4601                	li	a2,0
    10b6:	006c                	addi	a1,sp,12
    10b8:	577000ef          	jal	ra,1e2e <waitpid>
	assert(ret != -1);
    10bc:	00951963          	bne	a0,s1,10ce <test_waitpid+0xc8>
    10c0:	00001517          	auipc	a0,0x1
    10c4:	fa050513          	addi	a0,a0,-96 # 2060 <__clone+0x54>
    10c8:	4fa000ef          	jal	ra,15c2 <panic>
    10cc:	557d                	li	a0,-1
	if(ret == cpid && WEXITSTATUS(wstatus) == 3)
    10ce:	fca41ce3          	bne	s0,a0,10a6 <test_waitpid+0xa0>
    10d2:	00d14703          	lbu	a4,13(sp)
    10d6:	478d                	li	a5,3
    10d8:	fcf717e3          	bne	a4,a5,10a6 <test_waitpid+0xa0>
	    printf("waitpid successfully.\nwstatus: %x\n", WEXITSTATUS(wstatus));
    10dc:	458d                	li	a1,3
    10de:	00001517          	auipc	a0,0x1
    10e2:	fba50513          	addi	a0,a0,-70 # 2098 <__clone+0x8c>
    10e6:	238000ef          	jal	ra,131e <printf>
    10ea:	bf95                	j	105e <test_waitpid+0x58>

00000000000010ec <main>:

int main(void){
    10ec:	1141                	addi	sp,sp,-16
    10ee:	e406                	sd	ra,8(sp)
    test_waitpid();
    10f0:	f17ff0ef          	jal	ra,1006 <test_waitpid>
    return 0;
}
    10f4:	60a2                	ld	ra,8(sp)
    10f6:	4501                	li	a0,0
    10f8:	0141                	addi	sp,sp,16
    10fa:	8082                	ret

00000000000010fc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10fc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10fe:	4108                	lw	a0,0(a0)
{
    1100:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1102:	05a1                	addi	a1,a1,8
{
    1104:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1106:	fe7ff0ef          	jal	ra,10ec <main>
    110a:	51b000ef          	jal	ra,1e24 <exit>
	return 0;
}
    110e:	60a2                	ld	ra,8(sp)
    1110:	4501                	li	a0,0
    1112:	0141                	addi	sp,sp,16
    1114:	8082                	ret

0000000000001116 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1116:	7179                	addi	sp,sp,-48
    1118:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    111a:	12054e63          	bltz	a0,1256 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    111e:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1122:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1124:	02b7f6bb          	remuw	a3,a5,a1
    1128:	00001717          	auipc	a4,0x1
    112c:	fe870713          	addi	a4,a4,-24 # 2110 <digits>
    buf[16] = 0;
    1130:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1134:	1682                	slli	a3,a3,0x20
    1136:	9281                	srli	a3,a3,0x20
    1138:	96ba                	add	a3,a3,a4
    113a:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    113e:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1142:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1146:	16b7e363          	bltu	a5,a1,12ac <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    114a:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    114e:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1152:	1602                	slli	a2,a2,0x20
    1154:	9201                	srli	a2,a2,0x20
    1156:	963a                	add	a2,a2,a4
    1158:	00064603          	lbu	a2,0(a2)
    115c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1160:	0007861b          	sext.w	a2,a5
    1164:	12b6e863          	bltu	a3,a1,1294 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1168:	02b7f6bb          	remuw	a3,a5,a1
    116c:	1682                	slli	a3,a3,0x20
    116e:	9281                	srli	a3,a3,0x20
    1170:	96ba                	add	a3,a3,a4
    1172:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1176:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    117a:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    117e:	10b66e63          	bltu	a2,a1,129a <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1182:	02b876bb          	remuw	a3,a6,a1
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96ba                	add	a3,a3,a4
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1194:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1198:	10b86463          	bltu	a6,a1,12a0 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    119c:	02b676bb          	remuw	a3,a2,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ae:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11b2:	0eb66a63          	bltu	a2,a1,12a6 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11b6:	02b876bb          	remuw	a3,a6,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c8:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11cc:	0cb86163          	bltu	a6,a1,128e <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11d0:	02b676bb          	remuw	a3,a2,a1
    11d4:	1682                	slli	a3,a3,0x20
    11d6:	9281                	srli	a3,a3,0x20
    11d8:	96ba                	add	a3,a3,a4
    11da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11de:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11e2:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11e6:	0cb66563          	bltu	a2,a1,12b0 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ea:	02b876bb          	remuw	a3,a6,a1
    11ee:	1682                	slli	a3,a3,0x20
    11f0:	9281                	srli	a3,a3,0x20
    11f2:	96ba                	add	a3,a3,a4
    11f4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f8:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11fc:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1200:	0ab86b63          	bltu	a6,a1,12b6 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1204:	02b676bb          	remuw	a3,a2,a1
    1208:	1682                	slli	a3,a3,0x20
    120a:	9281                	srli	a3,a3,0x20
    120c:	96ba                	add	a3,a3,a4
    120e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1212:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1216:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    121a:	0ab66163          	bltu	a2,a1,12bc <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    121e:	1782                	slli	a5,a5,0x20
    1220:	9381                	srli	a5,a5,0x20
    1222:	97ba                	add	a5,a5,a4
    1224:	0007c703          	lbu	a4,0(a5)
    1228:	4599                	li	a1,6
    122a:	4795                	li	a5,5
    122c:	00e10723          	sb	a4,14(sp)

    if (sign)
    1230:	00055963          	bgez	a0,1242 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1234:	1018                	addi	a4,sp,32
    1236:	973e                	add	a4,a4,a5
    1238:	02d00693          	li	a3,45
    123c:	fed70423          	sb	a3,-24(a4)
    1240:	85be                	mv	a1,a5
    write(f, s, l);
    1242:	003c                	addi	a5,sp,8
    1244:	4641                	li	a2,16
    1246:	9e0d                	subw	a2,a2,a1
    1248:	4505                	li	a0,1
    124a:	95be                	add	a1,a1,a5
    124c:	387000ef          	jal	ra,1dd2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1250:	70a2                	ld	ra,40(sp)
    1252:	6145                	addi	sp,sp,48
    1254:	8082                	ret
        x = -xx;
    1256:	40a0063b          	negw	a2,a0
    125a:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    125c:	02b677bb          	remuw	a5,a2,a1
    1260:	00001717          	auipc	a4,0x1
    1264:	eb070713          	addi	a4,a4,-336 # 2110 <digits>
    buf[16] = 0;
    1268:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    126c:	1782                	slli	a5,a5,0x20
    126e:	9381                	srli	a5,a5,0x20
    1270:	97ba                	add	a5,a5,a4
    1272:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1276:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    127a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    127e:	ecb676e3          	bleu	a1,a2,114a <printint.constprop.0+0x34>
        buf[i--] = '-';
    1282:	02d00793          	li	a5,45
    1286:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128a:	45b9                	li	a1,14
    128c:	bf5d                	j	1242 <printint.constprop.0+0x12c>
    128e:	47a5                	li	a5,9
    1290:	45a9                	li	a1,10
    1292:	bf79                	j	1230 <printint.constprop.0+0x11a>
    1294:	47b5                	li	a5,13
    1296:	45b9                	li	a1,14
    1298:	bf61                	j	1230 <printint.constprop.0+0x11a>
    129a:	47b1                	li	a5,12
    129c:	45b5                	li	a1,13
    129e:	bf49                	j	1230 <printint.constprop.0+0x11a>
    12a0:	47ad                	li	a5,11
    12a2:	45b1                	li	a1,12
    12a4:	b771                	j	1230 <printint.constprop.0+0x11a>
    12a6:	47a9                	li	a5,10
    12a8:	45ad                	li	a1,11
    12aa:	b759                	j	1230 <printint.constprop.0+0x11a>
    i = 15;
    12ac:	45bd                	li	a1,15
    12ae:	bf51                	j	1242 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12b0:	47a1                	li	a5,8
    12b2:	45a5                	li	a1,9
    12b4:	bfb5                	j	1230 <printint.constprop.0+0x11a>
    12b6:	479d                	li	a5,7
    12b8:	45a1                	li	a1,8
    12ba:	bf9d                	j	1230 <printint.constprop.0+0x11a>
    12bc:	4799                	li	a5,6
    12be:	459d                	li	a1,7
    12c0:	bf85                	j	1230 <printint.constprop.0+0x11a>

00000000000012c2 <getchar>:
{
    12c2:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c4:	00f10593          	addi	a1,sp,15
    12c8:	4605                	li	a2,1
    12ca:	4501                	li	a0,0
{
    12cc:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ce:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d2:	2f7000ef          	jal	ra,1dc8 <read>
}
    12d6:	60e2                	ld	ra,24(sp)
    12d8:	00f14503          	lbu	a0,15(sp)
    12dc:	6105                	addi	sp,sp,32
    12de:	8082                	ret

00000000000012e0 <putchar>:
{
    12e0:	1101                	addi	sp,sp,-32
    char byte = c;
    12e2:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12e6:	00f10593          	addi	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4505                	li	a0,1
{
    12ee:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12f0:	2e3000ef          	jal	ra,1dd2 <write>
}
    12f4:	60e2                	ld	ra,24(sp)
    12f6:	2501                	sext.w	a0,a0
    12f8:	6105                	addi	sp,sp,32
    12fa:	8082                	ret

00000000000012fc <puts>:
{
    12fc:	1141                	addi	sp,sp,-16
    12fe:	e406                	sd	ra,8(sp)
    1300:	e022                	sd	s0,0(sp)
    1302:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1304:	5b2000ef          	jal	ra,18b6 <strlen>
    1308:	862a                	mv	a2,a0
    130a:	85a2                	mv	a1,s0
    130c:	4505                	li	a0,1
    130e:	2c5000ef          	jal	ra,1dd2 <write>
}
    1312:	60a2                	ld	ra,8(sp)
    1314:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1316:	957d                	srai	a0,a0,0x3f
    return r;
    1318:	2501                	sext.w	a0,a0
}
    131a:	0141                	addi	sp,sp,16
    131c:	8082                	ret

000000000000131e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    131e:	7131                	addi	sp,sp,-192
    1320:	e0da                	sd	s6,64(sp)
    1322:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1324:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1326:	013c                	addi	a5,sp,136
{
    1328:	f0ca                	sd	s2,96(sp)
    132a:	ecce                	sd	s3,88(sp)
    132c:	e8d2                	sd	s4,80(sp)
    132e:	e4d6                	sd	s5,72(sp)
    1330:	fc5e                	sd	s7,56(sp)
    1332:	fc86                	sd	ra,120(sp)
    1334:	f8a2                	sd	s0,112(sp)
    1336:	f4a6                	sd	s1,104(sp)
    1338:	89aa                	mv	s3,a0
    133a:	e52e                	sd	a1,136(sp)
    133c:	e932                	sd	a2,144(sp)
    133e:	ed36                	sd	a3,152(sp)
    1340:	f13a                	sd	a4,160(sp)
    1342:	f942                	sd	a6,176(sp)
    1344:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1346:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1348:	02500913          	li	s2,37
    134c:	07000a93          	li	s5,112
    buf[i++] = '0';
    1350:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1354:	00001a17          	auipc	s4,0x1
    1358:	dbca0a13          	addi	s4,s4,-580 # 2110 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    135c:	00001b97          	auipc	s7,0x1
    1360:	d84b8b93          	addi	s7,s7,-636 # 20e0 <__clone+0xd4>
        if (!*s)
    1364:	0009c783          	lbu	a5,0(s3)
    1368:	cfb9                	beqz	a5,13c6 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    136a:	23278d63          	beq	a5,s2,15a4 <printf+0x286>
    136e:	864e                	mv	a2,s3
    1370:	a019                	j	1376 <printf+0x58>
    1372:	07278563          	beq	a5,s2,13dc <printf+0xbe>
    1376:	0605                	addi	a2,a2,1
    1378:	00064783          	lbu	a5,0(a2)
    137c:	fbfd                	bnez	a5,1372 <printf+0x54>
    137e:	84b2                	mv	s1,a2
        l = z - a;
    1380:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1384:	8622                	mv	a2,s0
    1386:	85ce                	mv	a1,s3
    1388:	4505                	li	a0,1
    138a:	249000ef          	jal	ra,1dd2 <write>
        if (l)
    138e:	ec3d                	bnez	s0,140c <printf+0xee>
        if (s[1] == 0)
    1390:	0014c783          	lbu	a5,1(s1)
    1394:	cb8d                	beqz	a5,13c6 <printf+0xa8>
        switch (s[1])
    1396:	09578b63          	beq	a5,s5,142c <printf+0x10e>
    139a:	06fafb63          	bleu	a5,s5,1410 <printf+0xf2>
    139e:	07300713          	li	a4,115
    13a2:	1ce78e63          	beq	a5,a4,157e <printf+0x260>
    13a6:	07800713          	li	a4,120
    13aa:	1ae79563          	bne	a5,a4,1554 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13ae:	6782                	ld	a5,0(sp)
    13b0:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13b2:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13b6:	4388                	lw	a0,0(a5)
    13b8:	07a1                	addi	a5,a5,8
    13ba:	e03e                	sd	a5,0(sp)
    13bc:	d5bff0ef          	jal	ra,1116 <printint.constprop.0>
        if (!*s)
    13c0:	0009c783          	lbu	a5,0(s3)
    13c4:	f3dd                	bnez	a5,136a <printf+0x4c>
    }
    va_end(ap);
}
    13c6:	70e6                	ld	ra,120(sp)
    13c8:	7446                	ld	s0,112(sp)
    13ca:	74a6                	ld	s1,104(sp)
    13cc:	7906                	ld	s2,96(sp)
    13ce:	69e6                	ld	s3,88(sp)
    13d0:	6a46                	ld	s4,80(sp)
    13d2:	6aa6                	ld	s5,72(sp)
    13d4:	6b06                	ld	s6,64(sp)
    13d6:	7be2                	ld	s7,56(sp)
    13d8:	6129                	addi	sp,sp,192
    13da:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13dc:	00164783          	lbu	a5,1(a2)
    13e0:	84b2                	mv	s1,a2
    13e2:	01278763          	beq	a5,s2,13f0 <printf+0xd2>
    13e6:	bf69                	j	1380 <printf+0x62>
    13e8:	0014c783          	lbu	a5,1(s1)
    13ec:	f9279ae3          	bne	a5,s2,1380 <printf+0x62>
    13f0:	0489                	addi	s1,s1,2
    13f2:	0004c783          	lbu	a5,0(s1)
    13f6:	0605                	addi	a2,a2,1
    13f8:	ff2788e3          	beq	a5,s2,13e8 <printf+0xca>
        l = z - a;
    13fc:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1400:	8622                	mv	a2,s0
    1402:	85ce                	mv	a1,s3
    1404:	4505                	li	a0,1
    1406:	1cd000ef          	jal	ra,1dd2 <write>
        if (l)
    140a:	d059                	beqz	s0,1390 <printf+0x72>
    140c:	89a6                	mv	s3,s1
    140e:	bf99                	j	1364 <printf+0x46>
    1410:	06400713          	li	a4,100
    1414:	14e79063          	bne	a5,a4,1554 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1418:	6782                	ld	a5,0(sp)
    141a:	45a9                	li	a1,10
        s += 2;
    141c:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1420:	4388                	lw	a0,0(a5)
    1422:	07a1                	addi	a5,a5,8
    1424:	e03e                	sd	a5,0(sp)
    1426:	cf1ff0ef          	jal	ra,1116 <printint.constprop.0>
        s += 2;
    142a:	bf59                	j	13c0 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    142c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    142e:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1432:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1434:	631c                	ld	a5,0(a4)
    1436:	0721                	addi	a4,a4,8
    1438:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143a:	00479293          	slli	t0,a5,0x4
    143e:	00879f93          	slli	t6,a5,0x8
    1442:	00c79f13          	slli	t5,a5,0xc
    1446:	01079e93          	slli	t4,a5,0x10
    144a:	01479e13          	slli	t3,a5,0x14
    144e:	01879313          	slli	t1,a5,0x18
    1452:	01c79893          	slli	a7,a5,0x1c
    1456:	02479813          	slli	a6,a5,0x24
    145a:	02879513          	slli	a0,a5,0x28
    145e:	02c79593          	slli	a1,a5,0x2c
    1462:	03079693          	slli	a3,a5,0x30
    1466:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146a:	03c7d413          	srli	s0,a5,0x3c
    146e:	01c7d39b          	srliw	t2,a5,0x1c
    1472:	03c2d293          	srli	t0,t0,0x3c
    1476:	03cfdf93          	srli	t6,t6,0x3c
    147a:	03cf5f13          	srli	t5,t5,0x3c
    147e:	03cede93          	srli	t4,t4,0x3c
    1482:	03ce5e13          	srli	t3,t3,0x3c
    1486:	03c35313          	srli	t1,t1,0x3c
    148a:	03c8d893          	srli	a7,a7,0x3c
    148e:	03c85813          	srli	a6,a6,0x3c
    1492:	9171                	srli	a0,a0,0x3c
    1494:	91f1                	srli	a1,a1,0x3c
    1496:	92f1                	srli	a3,a3,0x3c
    1498:	9371                	srli	a4,a4,0x3c
    149a:	96d2                	add	a3,a3,s4
    149c:	9752                	add	a4,a4,s4
    149e:	9452                	add	s0,s0,s4
    14a0:	92d2                	add	t0,t0,s4
    14a2:	9fd2                	add	t6,t6,s4
    14a4:	9f52                	add	t5,t5,s4
    14a6:	9ed2                	add	t4,t4,s4
    14a8:	9e52                	add	t3,t3,s4
    14aa:	9352                	add	t1,t1,s4
    14ac:	98d2                	add	a7,a7,s4
    14ae:	93d2                	add	t2,t2,s4
    14b0:	9852                	add	a6,a6,s4
    14b2:	9552                	add	a0,a0,s4
    14b4:	95d2                	add	a1,a1,s4
    14b6:	0006c983          	lbu	s3,0(a3)
    14ba:	0002c283          	lbu	t0,0(t0)
    14be:	00074683          	lbu	a3,0(a4)
    14c2:	000fcf83          	lbu	t6,0(t6)
    14c6:	000f4f03          	lbu	t5,0(t5)
    14ca:	000ece83          	lbu	t4,0(t4)
    14ce:	000e4e03          	lbu	t3,0(t3)
    14d2:	00034303          	lbu	t1,0(t1)
    14d6:	0008c883          	lbu	a7,0(a7)
    14da:	0003c383          	lbu	t2,0(t2)
    14de:	00084803          	lbu	a6,0(a6)
    14e2:	00054503          	lbu	a0,0(a0)
    14e6:	0005c583          	lbu	a1,0(a1)
    14ea:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ee:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f2:	9371                	srli	a4,a4,0x3c
    14f4:	8bbd                	andi	a5,a5,15
    14f6:	9752                	add	a4,a4,s4
    14f8:	97d2                	add	a5,a5,s4
    14fa:	005105a3          	sb	t0,11(sp)
    14fe:	01f10623          	sb	t6,12(sp)
    1502:	01e106a3          	sb	t5,13(sp)
    1506:	01d10723          	sb	t4,14(sp)
    150a:	01c107a3          	sb	t3,15(sp)
    150e:	00610823          	sb	t1,16(sp)
    1512:	011108a3          	sb	a7,17(sp)
    1516:	00710923          	sb	t2,18(sp)
    151a:	010109a3          	sb	a6,19(sp)
    151e:	00a10a23          	sb	a0,20(sp)
    1522:	00b10aa3          	sb	a1,21(sp)
    1526:	01310b23          	sb	s3,22(sp)
    152a:	00d10ba3          	sb	a3,23(sp)
    152e:	00810523          	sb	s0,10(sp)
    1532:	00074703          	lbu	a4,0(a4)
    1536:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    153a:	002c                	addi	a1,sp,8
    153c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    153e:	00e10c23          	sb	a4,24(sp)
    1542:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1546:	00010d23          	sb	zero,26(sp)
        s += 2;
    154a:	00248993          	addi	s3,s1,2
    write(f, s, l);
    154e:	085000ef          	jal	ra,1dd2 <write>
        s += 2;
    1552:	b5bd                	j	13c0 <printf+0xa2>
    char byte = c;
    1554:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1558:	4605                	li	a2,1
    155a:	002c                	addi	a1,sp,8
    155c:	4505                	li	a0,1
    char byte = c;
    155e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1562:	071000ef          	jal	ra,1dd2 <write>
    char byte = c;
    1566:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    156a:	4605                	li	a2,1
    156c:	002c                	addi	a1,sp,8
    156e:	4505                	li	a0,1
    char byte = c;
    1570:	00f10423          	sb	a5,8(sp)
        s += 2;
    1574:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1578:	05b000ef          	jal	ra,1dd2 <write>
        s += 2;
    157c:	b591                	j	13c0 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    157e:	6782                	ld	a5,0(sp)
    1580:	6380                	ld	s0,0(a5)
    1582:	07a1                	addi	a5,a5,8
    1584:	e03e                	sd	a5,0(sp)
    1586:	cc05                	beqz	s0,15be <printf+0x2a0>
            l = strnlen(a, 200);
    1588:	0c800593          	li	a1,200
    158c:	8522                	mv	a0,s0
    158e:	45a000ef          	jal	ra,19e8 <strnlen>
    write(f, s, l);
    1592:	0005061b          	sext.w	a2,a0
    1596:	85a2                	mv	a1,s0
    1598:	4505                	li	a0,1
    159a:	039000ef          	jal	ra,1dd2 <write>
        s += 2;
    159e:	00248993          	addi	s3,s1,2
    15a2:	bd39                	j	13c0 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15a4:	0019c783          	lbu	a5,1(s3)
    15a8:	84ce                	mv	s1,s3
    15aa:	864e                	mv	a2,s3
    15ac:	e52782e3          	beq	a5,s2,13f0 <printf+0xd2>
    write(f, s, l);
    15b0:	4601                	li	a2,0
    15b2:	85ce                	mv	a1,s3
    15b4:	4505                	li	a0,1
    15b6:	01d000ef          	jal	ra,1dd2 <write>
    15ba:	84ce                	mv	s1,s3
    15bc:	bbd1                	j	1390 <printf+0x72>
                a = "(null)";
    15be:	845e                	mv	s0,s7
    15c0:	b7e1                	j	1588 <printf+0x26a>

00000000000015c2 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c2:	1141                	addi	sp,sp,-16
    15c4:	e406                	sd	ra,8(sp)
    puts(m);
    15c6:	d37ff0ef          	jal	ra,12fc <puts>
    exit(-100);
}
    15ca:	60a2                	ld	ra,8(sp)
    exit(-100);
    15cc:	f9c00513          	li	a0,-100
}
    15d0:	0141                	addi	sp,sp,16
    exit(-100);
    15d2:	0530006f          	j	1e24 <exit>

00000000000015d6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d6:	02000793          	li	a5,32
    15da:	00f50663          	beq	a0,a5,15e6 <isspace+0x10>
    15de:	355d                	addiw	a0,a0,-9
    15e0:	00553513          	sltiu	a0,a0,5
    15e4:	8082                	ret
    15e6:	4505                	li	a0,1
}
    15e8:	8082                	ret

00000000000015ea <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ea:	fd05051b          	addiw	a0,a0,-48
}
    15ee:	00a53513          	sltiu	a0,a0,10
    15f2:	8082                	ret

00000000000015f4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f4:	02000613          	li	a2,32
    15f8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15fa:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fe:	0007079b          	sext.w	a5,a4
    1602:	ff77869b          	addiw	a3,a5,-9
    1606:	04c70b63          	beq	a4,a2,165c <atoi+0x68>
    160a:	04d5f963          	bleu	a3,a1,165c <atoi+0x68>
        s++;
    switch (*s)
    160e:	02b00693          	li	a3,43
    1612:	04d70a63          	beq	a4,a3,1666 <atoi+0x72>
    1616:	02d00693          	li	a3,45
    161a:	06d70463          	beq	a4,a3,1682 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    161e:	fd07859b          	addiw	a1,a5,-48
    1622:	4625                	li	a2,9
    1624:	873e                	mv	a4,a5
    1626:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1628:	4e01                	li	t3,0
    while (isdigit(*s))
    162a:	04b66a63          	bltu	a2,a1,167e <atoi+0x8a>
    int n = 0, neg = 0;
    162e:	4501                	li	a0,0
    while (isdigit(*s))
    1630:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1632:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1634:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1638:	0025179b          	slliw	a5,a0,0x2
    163c:	9d3d                	addw	a0,a0,a5
    163e:	fd07031b          	addiw	t1,a4,-48
    1642:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1646:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    164a:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    164e:	0006071b          	sext.w	a4,a2
    1652:	feb870e3          	bleu	a1,a6,1632 <atoi+0x3e>
    return neg ? n : -n;
    1656:	000e0563          	beqz	t3,1660 <atoi+0x6c>
}
    165a:	8082                	ret
        s++;
    165c:	0505                	addi	a0,a0,1
    165e:	bf71                	j	15fa <atoi+0x6>
    1660:	4113053b          	subw	a0,t1,a7
    1664:	8082                	ret
    while (isdigit(*s))
    1666:	00154783          	lbu	a5,1(a0)
    166a:	4625                	li	a2,9
        s++;
    166c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1670:	fd07859b          	addiw	a1,a5,-48
    1674:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1678:	4e01                	li	t3,0
    while (isdigit(*s))
    167a:	fab67ae3          	bleu	a1,a2,162e <atoi+0x3a>
    167e:	4501                	li	a0,0
}
    1680:	8082                	ret
    while (isdigit(*s))
    1682:	00154783          	lbu	a5,1(a0)
    1686:	4625                	li	a2,9
        s++;
    1688:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    168c:	fd07859b          	addiw	a1,a5,-48
    1690:	0007871b          	sext.w	a4,a5
    1694:	feb665e3          	bltu	a2,a1,167e <atoi+0x8a>
        neg = 1;
    1698:	4e05                	li	t3,1
    169a:	bf51                	j	162e <atoi+0x3a>

000000000000169c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    169c:	16060d63          	beqz	a2,1816 <memset+0x17a>
    16a0:	40a007b3          	neg	a5,a0
    16a4:	8b9d                	andi	a5,a5,7
    16a6:	00778713          	addi	a4,a5,7
    16aa:	482d                	li	a6,11
    16ac:	0ff5f593          	andi	a1,a1,255
    16b0:	fff60693          	addi	a3,a2,-1
    16b4:	17076263          	bltu	a4,a6,1818 <memset+0x17c>
    16b8:	16e6ea63          	bltu	a3,a4,182c <memset+0x190>
    16bc:	16078563          	beqz	a5,1826 <memset+0x18a>
    16c0:	00b50023          	sb	a1,0(a0)
    16c4:	4705                	li	a4,1
    16c6:	00150e93          	addi	t4,a0,1
    16ca:	14e78c63          	beq	a5,a4,1822 <memset+0x186>
    16ce:	00b500a3          	sb	a1,1(a0)
    16d2:	4709                	li	a4,2
    16d4:	00250e93          	addi	t4,a0,2
    16d8:	14e78d63          	beq	a5,a4,1832 <memset+0x196>
    16dc:	00b50123          	sb	a1,2(a0)
    16e0:	470d                	li	a4,3
    16e2:	00350e93          	addi	t4,a0,3
    16e6:	12e78b63          	beq	a5,a4,181c <memset+0x180>
    16ea:	00b501a3          	sb	a1,3(a0)
    16ee:	4711                	li	a4,4
    16f0:	00450e93          	addi	t4,a0,4
    16f4:	14e78163          	beq	a5,a4,1836 <memset+0x19a>
    16f8:	00b50223          	sb	a1,4(a0)
    16fc:	4715                	li	a4,5
    16fe:	00550e93          	addi	t4,a0,5
    1702:	12e78c63          	beq	a5,a4,183a <memset+0x19e>
    1706:	00b502a3          	sb	a1,5(a0)
    170a:	471d                	li	a4,7
    170c:	00650e93          	addi	t4,a0,6
    1710:	12e79763          	bne	a5,a4,183e <memset+0x1a2>
    1714:	00750e93          	addi	t4,a0,7
    1718:	00b50323          	sb	a1,6(a0)
    171c:	4f1d                	li	t5,7
    171e:	00859713          	slli	a4,a1,0x8
    1722:	8f4d                	or	a4,a4,a1
    1724:	01059e13          	slli	t3,a1,0x10
    1728:	01c76e33          	or	t3,a4,t3
    172c:	01859313          	slli	t1,a1,0x18
    1730:	006e6333          	or	t1,t3,t1
    1734:	02059893          	slli	a7,a1,0x20
    1738:	011368b3          	or	a7,t1,a7
    173c:	02859813          	slli	a6,a1,0x28
    1740:	40f60333          	sub	t1,a2,a5
    1744:	0108e833          	or	a6,a7,a6
    1748:	03059693          	slli	a3,a1,0x30
    174c:	00d866b3          	or	a3,a6,a3
    1750:	03859713          	slli	a4,a1,0x38
    1754:	97aa                	add	a5,a5,a0
    1756:	ff837813          	andi	a6,t1,-8
    175a:	8f55                	or	a4,a4,a3
    175c:	00f806b3          	add	a3,a6,a5
    1760:	e398                	sd	a4,0(a5)
    1762:	07a1                	addi	a5,a5,8
    1764:	fed79ee3          	bne	a5,a3,1760 <memset+0xc4>
    1768:	ff837693          	andi	a3,t1,-8
    176c:	00de87b3          	add	a5,t4,a3
    1770:	01e6873b          	addw	a4,a3,t5
    1774:	0ad30663          	beq	t1,a3,1820 <memset+0x184>
    1778:	00b78023          	sb	a1,0(a5)
    177c:	0017069b          	addiw	a3,a4,1
    1780:	08c6fb63          	bleu	a2,a3,1816 <memset+0x17a>
    1784:	00b780a3          	sb	a1,1(a5)
    1788:	0027069b          	addiw	a3,a4,2
    178c:	08c6f563          	bleu	a2,a3,1816 <memset+0x17a>
    1790:	00b78123          	sb	a1,2(a5)
    1794:	0037069b          	addiw	a3,a4,3
    1798:	06c6ff63          	bleu	a2,a3,1816 <memset+0x17a>
    179c:	00b781a3          	sb	a1,3(a5)
    17a0:	0047069b          	addiw	a3,a4,4
    17a4:	06c6f963          	bleu	a2,a3,1816 <memset+0x17a>
    17a8:	00b78223          	sb	a1,4(a5)
    17ac:	0057069b          	addiw	a3,a4,5
    17b0:	06c6f363          	bleu	a2,a3,1816 <memset+0x17a>
    17b4:	00b782a3          	sb	a1,5(a5)
    17b8:	0067069b          	addiw	a3,a4,6
    17bc:	04c6fd63          	bleu	a2,a3,1816 <memset+0x17a>
    17c0:	00b78323          	sb	a1,6(a5)
    17c4:	0077069b          	addiw	a3,a4,7
    17c8:	04c6f763          	bleu	a2,a3,1816 <memset+0x17a>
    17cc:	00b783a3          	sb	a1,7(a5)
    17d0:	0087069b          	addiw	a3,a4,8
    17d4:	04c6f163          	bleu	a2,a3,1816 <memset+0x17a>
    17d8:	00b78423          	sb	a1,8(a5)
    17dc:	0097069b          	addiw	a3,a4,9
    17e0:	02c6fb63          	bleu	a2,a3,1816 <memset+0x17a>
    17e4:	00b784a3          	sb	a1,9(a5)
    17e8:	00a7069b          	addiw	a3,a4,10
    17ec:	02c6f563          	bleu	a2,a3,1816 <memset+0x17a>
    17f0:	00b78523          	sb	a1,10(a5)
    17f4:	00b7069b          	addiw	a3,a4,11
    17f8:	00c6ff63          	bleu	a2,a3,1816 <memset+0x17a>
    17fc:	00b785a3          	sb	a1,11(a5)
    1800:	00c7069b          	addiw	a3,a4,12
    1804:	00c6f963          	bleu	a2,a3,1816 <memset+0x17a>
    1808:	00b78623          	sb	a1,12(a5)
    180c:	2735                	addiw	a4,a4,13
    180e:	00c77463          	bleu	a2,a4,1816 <memset+0x17a>
    1812:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1816:	8082                	ret
    1818:	472d                	li	a4,11
    181a:	bd79                	j	16b8 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    181c:	4f0d                	li	t5,3
    181e:	b701                	j	171e <memset+0x82>
    1820:	8082                	ret
    1822:	4f05                	li	t5,1
    1824:	bded                	j	171e <memset+0x82>
    1826:	8eaa                	mv	t4,a0
    1828:	4f01                	li	t5,0
    182a:	bdd5                	j	171e <memset+0x82>
    182c:	87aa                	mv	a5,a0
    182e:	4701                	li	a4,0
    1830:	b7a1                	j	1778 <memset+0xdc>
    1832:	4f09                	li	t5,2
    1834:	b5ed                	j	171e <memset+0x82>
    1836:	4f11                	li	t5,4
    1838:	b5dd                	j	171e <memset+0x82>
    183a:	4f15                	li	t5,5
    183c:	b5cd                	j	171e <memset+0x82>
    183e:	4f19                	li	t5,6
    1840:	bdf9                	j	171e <memset+0x82>

0000000000001842 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1842:	00054703          	lbu	a4,0(a0)
    1846:	0005c783          	lbu	a5,0(a1)
    184a:	00e79b63          	bne	a5,a4,1860 <strcmp+0x1e>
    184e:	cf89                	beqz	a5,1868 <strcmp+0x26>
    1850:	0505                	addi	a0,a0,1
    1852:	0585                	addi	a1,a1,1
    1854:	0005c783          	lbu	a5,0(a1)
    1858:	00054703          	lbu	a4,0(a0)
    185c:	fef709e3          	beq	a4,a5,184e <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1860:	0007051b          	sext.w	a0,a4
}
    1864:	9d1d                	subw	a0,a0,a5
    1866:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1868:	4501                	li	a0,0
}
    186a:	9d1d                	subw	a0,a0,a5
    186c:	8082                	ret

000000000000186e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    186e:	c231                	beqz	a2,18b2 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1870:	00054783          	lbu	a5,0(a0)
    1874:	0005c683          	lbu	a3,0(a1)
    1878:	c795                	beqz	a5,18a4 <strncmp+0x36>
    187a:	ca85                	beqz	a3,18aa <strncmp+0x3c>
    if (!n--)
    187c:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187e:	c615                	beqz	a2,18aa <strncmp+0x3c>
    1880:	00150713          	addi	a4,a0,1
    1884:	9532                	add	a0,a0,a2
    1886:	00d78963          	beq	a5,a3,1898 <strncmp+0x2a>
    188a:	a005                	j	18aa <strncmp+0x3c>
    188c:	ce99                	beqz	a3,18aa <strncmp+0x3c>
    188e:	00e50e63          	beq	a0,a4,18aa <strncmp+0x3c>
    1892:	0705                	addi	a4,a4,1
    1894:	00d79b63          	bne	a5,a3,18aa <strncmp+0x3c>
    1898:	00074783          	lbu	a5,0(a4)
    189c:	0585                	addi	a1,a1,1
    189e:	0005c683          	lbu	a3,0(a1)
    18a2:	f7ed                	bnez	a5,188c <strncmp+0x1e>
    18a4:	4501                	li	a0,0
        ;
    return *l - *r;
    18a6:	9d15                	subw	a0,a0,a3
    18a8:	8082                	ret
    18aa:	0007851b          	sext.w	a0,a5
    18ae:	9d15                	subw	a0,a0,a3
    18b0:	8082                	ret
        return 0;
    18b2:	4501                	li	a0,0
}
    18b4:	8082                	ret

00000000000018b6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18b6:	00757793          	andi	a5,a0,7
    18ba:	cfa1                	beqz	a5,1912 <strlen+0x5c>
        if (!*s)
    18bc:	00054783          	lbu	a5,0(a0)
    18c0:	cbb9                	beqz	a5,1916 <strlen+0x60>
    18c2:	87aa                	mv	a5,a0
    18c4:	a021                	j	18cc <strlen+0x16>
    18c6:	0007c703          	lbu	a4,0(a5)
    18ca:	c329                	beqz	a4,190c <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18cc:	0785                	addi	a5,a5,1
    18ce:	0077f713          	andi	a4,a5,7
    18d2:	fb75                	bnez	a4,18c6 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18d4:	00001717          	auipc	a4,0x1
    18d8:	81470713          	addi	a4,a4,-2028 # 20e8 <__clone+0xdc>
    18dc:	630c                	ld	a1,0(a4)
    18de:	00001717          	auipc	a4,0x1
    18e2:	81270713          	addi	a4,a4,-2030 # 20f0 <__clone+0xe4>
    18e6:	6394                	ld	a3,0(a5)
    18e8:	6310                	ld	a2,0(a4)
    18ea:	a019                	j	18f0 <strlen+0x3a>
    18ec:	07a1                	addi	a5,a5,8
    18ee:	6394                	ld	a3,0(a5)
    18f0:	00b68733          	add	a4,a3,a1
    18f4:	fff6c693          	not	a3,a3
    18f8:	8f75                	and	a4,a4,a3
    18fa:	8f71                	and	a4,a4,a2
    18fc:	db65                	beqz	a4,18ec <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18fe:	0007c703          	lbu	a4,0(a5)
    1902:	c709                	beqz	a4,190c <strlen+0x56>
    1904:	0785                	addi	a5,a5,1
    1906:	0007c703          	lbu	a4,0(a5)
    190a:	ff6d                	bnez	a4,1904 <strlen+0x4e>
        ;
    return s - a;
    190c:	40a78533          	sub	a0,a5,a0
}
    1910:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1912:	87aa                	mv	a5,a0
    1914:	b7c1                	j	18d4 <strlen+0x1e>
        if (!*s)
    1916:	4501                	li	a0,0
            return s - a;
    1918:	8082                	ret

000000000000191a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191a:	00757793          	andi	a5,a0,7
    191e:	0ff5f593          	andi	a1,a1,255
    1922:	cb99                	beqz	a5,1938 <memchr+0x1e>
    1924:	c655                	beqz	a2,19d0 <memchr+0xb6>
    1926:	00054783          	lbu	a5,0(a0)
    192a:	0ab78663          	beq	a5,a1,19d6 <memchr+0xbc>
    192e:	0505                	addi	a0,a0,1
    1930:	00757793          	andi	a5,a0,7
    1934:	167d                	addi	a2,a2,-1
    1936:	f7fd                	bnez	a5,1924 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1938:	4701                	li	a4,0
    if (n && *s != c)
    193a:	ca49                	beqz	a2,19cc <memchr+0xb2>
    193c:	00054783          	lbu	a5,0(a0)
    1940:	08b78b63          	beq	a5,a1,19d6 <memchr+0xbc>
        size_t k = ONES * c;
    1944:	00000797          	auipc	a5,0x0
    1948:	7b478793          	addi	a5,a5,1972 # 20f8 <__clone+0xec>
    194c:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194e:	479d                	li	a5,7
        size_t k = ONES * c;
    1950:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1954:	08c7f863          	bleu	a2,a5,19e4 <memchr+0xca>
    1958:	611c                	ld	a5,0(a0)
    195a:	00000317          	auipc	t1,0x0
    195e:	79630313          	addi	t1,t1,1942 # 20f0 <__clone+0xe4>
    1962:	00033803          	ld	a6,0(t1)
    1966:	00f8c7b3          	xor	a5,a7,a5
    196a:	fff7c713          	not	a4,a5
    196e:	8f95                	sub	a5,a5,a3
    1970:	8ff9                	and	a5,a5,a4
    1972:	0107f7b3          	and	a5,a5,a6
    1976:	e7bd                	bnez	a5,19e4 <memchr+0xca>
    1978:	4e1d                	li	t3,7
    197a:	00000e97          	auipc	t4,0x0
    197e:	76ee8e93          	addi	t4,t4,1902 # 20e8 <__clone+0xdc>
    1982:	a005                	j	19a2 <memchr+0x88>
    1984:	6514                	ld	a3,8(a0)
    1986:	000eb783          	ld	a5,0(t4)
    198a:	00033803          	ld	a6,0(t1)
    198e:	00d8c6b3          	xor	a3,a7,a3
    1992:	97b6                	add	a5,a5,a3
    1994:	fff6c693          	not	a3,a3
    1998:	8ff5                	and	a5,a5,a3
    199a:	0107f7b3          	and	a5,a5,a6
    199e:	e3a1                	bnez	a5,19de <memchr+0xc4>
    19a0:	853a                	mv	a0,a4
    19a2:	1661                	addi	a2,a2,-8
    19a4:	00850713          	addi	a4,a0,8
    19a8:	fcce6ee3          	bltu	t3,a2,1984 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19ac:	c215                	beqz	a2,19d0 <memchr+0xb6>
    19ae:	00074783          	lbu	a5,0(a4)
    19b2:	00f58d63          	beq	a1,a5,19cc <memchr+0xb2>
    19b6:	00170793          	addi	a5,a4,1
    19ba:	963a                	add	a2,a2,a4
    19bc:	873e                	mv	a4,a5
    19be:	00f60963          	beq	a2,a5,19d0 <memchr+0xb6>
    19c2:	0007c683          	lbu	a3,0(a5)
    19c6:	0785                	addi	a5,a5,1
    19c8:	feb69ae3          	bne	a3,a1,19bc <memchr+0xa2>
}
    19cc:	853a                	mv	a0,a4
    19ce:	8082                	ret
    return n ? (void *)s : 0;
    19d0:	4701                	li	a4,0
}
    19d2:	853a                	mv	a0,a4
    19d4:	8082                	ret
    19d6:	872a                	mv	a4,a0
    19d8:	00074783          	lbu	a5,0(a4)
    19dc:	bfd9                	j	19b2 <memchr+0x98>
    19de:	00854783          	lbu	a5,8(a0)
    19e2:	bfc1                	j	19b2 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19e4:	872a                	mv	a4,a0
    19e6:	bfc1                	j	19b6 <memchr+0x9c>

00000000000019e8 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19e8:	00757793          	andi	a5,a0,7
    19ec:	cfc5                	beqz	a5,1aa4 <strnlen+0xbc>
    19ee:	c1c5                	beqz	a1,1a8e <strnlen+0xa6>
    19f0:	00054783          	lbu	a5,0(a0)
    19f4:	cfd9                	beqz	a5,1a92 <strnlen+0xaa>
    19f6:	87ae                	mv	a5,a1
    19f8:	86aa                	mv	a3,a0
    19fa:	a029                	j	1a04 <strnlen+0x1c>
    19fc:	cbc9                	beqz	a5,1a8e <strnlen+0xa6>
    19fe:	0006c703          	lbu	a4,0(a3)
    1a02:	cb51                	beqz	a4,1a96 <strnlen+0xae>
    1a04:	0685                	addi	a3,a3,1
    1a06:	0076f713          	andi	a4,a3,7
    1a0a:	17fd                	addi	a5,a5,-1
    1a0c:	fb65                	bnez	a4,19fc <strnlen+0x14>
    if (n && *s != c)
    1a0e:	c3c1                	beqz	a5,1a8e <strnlen+0xa6>
    1a10:	0006c703          	lbu	a4,0(a3)
    1a14:	c349                	beqz	a4,1a96 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a16:	471d                	li	a4,7
    1a18:	08f77a63          	bleu	a5,a4,1aac <strnlen+0xc4>
    1a1c:	00000e17          	auipc	t3,0x0
    1a20:	6cce0e13          	addi	t3,t3,1740 # 20e8 <__clone+0xdc>
    1a24:	6290                	ld	a2,0(a3)
    1a26:	000e3703          	ld	a4,0(t3)
    1a2a:	00000e97          	auipc	t4,0x0
    1a2e:	6c6e8e93          	addi	t4,t4,1734 # 20f0 <__clone+0xe4>
    1a32:	000eb803          	ld	a6,0(t4)
    1a36:	9732                	add	a4,a4,a2
    1a38:	fff64613          	not	a2,a2
    1a3c:	8f71                	and	a4,a4,a2
    1a3e:	01077733          	and	a4,a4,a6
    1a42:	e72d                	bnez	a4,1aac <strnlen+0xc4>
    1a44:	4f1d                	li	t5,7
    1a46:	a839                	j	1a64 <strnlen+0x7c>
    1a48:	6698                	ld	a4,8(a3)
    1a4a:	000e3303          	ld	t1,0(t3)
    1a4e:	000eb803          	ld	a6,0(t4)
    1a52:	fff74893          	not	a7,a4
    1a56:	971a                	add	a4,a4,t1
    1a58:	01177733          	and	a4,a4,a7
    1a5c:	01077733          	and	a4,a4,a6
    1a60:	ef1d                	bnez	a4,1a9e <strnlen+0xb6>
    1a62:	86b2                	mv	a3,a2
    1a64:	17e1                	addi	a5,a5,-8
    1a66:	00868613          	addi	a2,a3,8
    1a6a:	fcff6fe3          	bltu	t5,a5,1a48 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a6e:	c385                	beqz	a5,1a8e <strnlen+0xa6>
    1a70:	00064703          	lbu	a4,0(a2)
    1a74:	cb19                	beqz	a4,1a8a <strnlen+0xa2>
    1a76:	00160713          	addi	a4,a2,1
    1a7a:	97b2                	add	a5,a5,a2
    1a7c:	863a                	mv	a2,a4
    1a7e:	00e78863          	beq	a5,a4,1a8e <strnlen+0xa6>
    1a82:	0705                	addi	a4,a4,1
    1a84:	fff74683          	lbu	a3,-1(a4)
    1a88:	faf5                	bnez	a3,1a7c <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a8a:	40a605b3          	sub	a1,a2,a0
}
    1a8e:	852e                	mv	a0,a1
    1a90:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a92:	87ae                	mv	a5,a1
    1a94:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a96:	8636                	mv	a2,a3
    1a98:	00064703          	lbu	a4,0(a2)
    1a9c:	bfe1                	j	1a74 <strnlen+0x8c>
    1a9e:	0086c703          	lbu	a4,8(a3)
    1aa2:	bfc9                	j	1a74 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1aa4:	87ae                	mv	a5,a1
    1aa6:	86aa                	mv	a3,a0
    if (n && *s != c)
    1aa8:	f7a5                	bnez	a5,1a10 <strnlen+0x28>
    1aaa:	b7d5                	j	1a8e <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aac:	8636                	mv	a2,a3
    1aae:	b7e1                	j	1a76 <strnlen+0x8e>

0000000000001ab0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ab0:	00b547b3          	xor	a5,a0,a1
    1ab4:	8b9d                	andi	a5,a5,7
    1ab6:	efa9                	bnez	a5,1b10 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ab8:	0075f793          	andi	a5,a1,7
    1abc:	c38d                	beqz	a5,1ade <strcpy+0x2e>
            if (!(*d = *s))
    1abe:	0005c783          	lbu	a5,0(a1)
    1ac2:	00f50023          	sb	a5,0(a0)
    1ac6:	e799                	bnez	a5,1ad4 <strcpy+0x24>
    1ac8:	a095                	j	1b2c <strcpy+0x7c>
    1aca:	0005c783          	lbu	a5,0(a1)
    1ace:	00f50023          	sb	a5,0(a0)
    1ad2:	cbb9                	beqz	a5,1b28 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1ad4:	0585                	addi	a1,a1,1
    1ad6:	0075f793          	andi	a5,a1,7
    1ada:	0505                	addi	a0,a0,1
    1adc:	f7fd                	bnez	a5,1aca <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ade:	00000797          	auipc	a5,0x0
    1ae2:	60a78793          	addi	a5,a5,1546 # 20e8 <__clone+0xdc>
    1ae6:	0007b803          	ld	a6,0(a5)
    1aea:	00000797          	auipc	a5,0x0
    1aee:	60678793          	addi	a5,a5,1542 # 20f0 <__clone+0xe4>
    1af2:	6198                	ld	a4,0(a1)
    1af4:	6390                	ld	a2,0(a5)
    1af6:	a031                	j	1b02 <strcpy+0x52>
    1af8:	0521                	addi	a0,a0,8
    1afa:	05a1                	addi	a1,a1,8
    1afc:	fee53c23          	sd	a4,-8(a0)
    1b00:	6198                	ld	a4,0(a1)
    1b02:	010707b3          	add	a5,a4,a6
    1b06:	fff74693          	not	a3,a4
    1b0a:	8ff5                	and	a5,a5,a3
    1b0c:	8ff1                	and	a5,a5,a2
    1b0e:	d7ed                	beqz	a5,1af8 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b10:	0005c783          	lbu	a5,0(a1)
    1b14:	00f50023          	sb	a5,0(a0)
    1b18:	cb89                	beqz	a5,1b2a <strcpy+0x7a>
    1b1a:	0585                	addi	a1,a1,1
    1b1c:	0005c783          	lbu	a5,0(a1)
    1b20:	0505                	addi	a0,a0,1
    1b22:	00f50023          	sb	a5,0(a0)
    1b26:	fbf5                	bnez	a5,1b1a <strcpy+0x6a>
        ;
    return d;
}
    1b28:	8082                	ret
    1b2a:	8082                	ret
    1b2c:	8082                	ret

0000000000001b2e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b2e:	00b547b3          	xor	a5,a0,a1
    1b32:	8b9d                	andi	a5,a5,7
    1b34:	ebc1                	bnez	a5,1bc4 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b36:	0075f793          	andi	a5,a1,7
    1b3a:	cf91                	beqz	a5,1b56 <strncpy+0x28>
    1b3c:	20060e63          	beqz	a2,1d58 <strncpy+0x22a>
    1b40:	0005c783          	lbu	a5,0(a1)
    1b44:	00f50023          	sb	a5,0(a0)
    1b48:	c3d5                	beqz	a5,1bec <strncpy+0xbe>
    1b4a:	0585                	addi	a1,a1,1
    1b4c:	0075f793          	andi	a5,a1,7
    1b50:	167d                	addi	a2,a2,-1
    1b52:	0505                	addi	a0,a0,1
    1b54:	f7e5                	bnez	a5,1b3c <strncpy+0xe>
            ;
        if (!n || !*s)
    1b56:	20060163          	beqz	a2,1d58 <strncpy+0x22a>
    1b5a:	0005c683          	lbu	a3,0(a1)
    1b5e:	c6d9                	beqz	a3,1bec <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b60:	479d                	li	a5,7
    1b62:	22c7f563          	bleu	a2,a5,1d8c <strncpy+0x25e>
    1b66:	00000317          	auipc	t1,0x0
    1b6a:	58230313          	addi	t1,t1,1410 # 20e8 <__clone+0xdc>
    1b6e:	6198                	ld	a4,0(a1)
    1b70:	00033783          	ld	a5,0(t1)
    1b74:	00000e17          	auipc	t3,0x0
    1b78:	57ce0e13          	addi	t3,t3,1404 # 20f0 <__clone+0xe4>
    1b7c:	000e3803          	ld	a6,0(t3)
    1b80:	97ba                	add	a5,a5,a4
    1b82:	fff74893          	not	a7,a4
    1b86:	0117f7b3          	and	a5,a5,a7
    1b8a:	0107f7b3          	and	a5,a5,a6
    1b8e:	1e079f63          	bnez	a5,1d8c <strncpy+0x25e>
    1b92:	4e9d                	li	t4,7
    1b94:	a005                	j	1bb4 <strncpy+0x86>
    1b96:	6598                	ld	a4,8(a1)
    1b98:	00033783          	ld	a5,0(t1)
    1b9c:	000e3803          	ld	a6,0(t3)
    1ba0:	fff74893          	not	a7,a4
    1ba4:	97ba                	add	a5,a5,a4
    1ba6:	0117f7b3          	and	a5,a5,a7
    1baa:	0107f7b3          	and	a5,a5,a6
    1bae:	1a079f63          	bnez	a5,1d6c <strncpy+0x23e>
    1bb2:	85b6                	mv	a1,a3
            *wd = *ws;
    1bb4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb6:	1661                	addi	a2,a2,-8
    1bb8:	00858693          	addi	a3,a1,8
    1bbc:	0521                	addi	a0,a0,8
    1bbe:	fcceece3          	bltu	t4,a2,1b96 <strncpy+0x68>
    1bc2:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bc4:	18060a63          	beqz	a2,1d58 <strncpy+0x22a>
    1bc8:	0005c783          	lbu	a5,0(a1)
    1bcc:	872a                	mv	a4,a0
    1bce:	00f50023          	sb	a5,0(a0)
    1bd2:	e799                	bnez	a5,1be0 <strncpy+0xb2>
    1bd4:	a829                	j	1bee <strncpy+0xc0>
    1bd6:	0005c783          	lbu	a5,0(a1)
    1bda:	00f70023          	sb	a5,0(a4)
    1bde:	cb81                	beqz	a5,1bee <strncpy+0xc0>
    1be0:	167d                	addi	a2,a2,-1
    1be2:	0585                	addi	a1,a1,1
    1be4:	0705                	addi	a4,a4,1
    1be6:	fa65                	bnez	a2,1bd6 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1be8:	853a                	mv	a0,a4
    1bea:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bec:	872a                	mv	a4,a0
    1bee:	4805                	li	a6,1
    1bf0:	14061c63          	bnez	a2,1d48 <strncpy+0x21a>
    1bf4:	40e007b3          	neg	a5,a4
    1bf8:	8b9d                	andi	a5,a5,7
    1bfa:	4581                	li	a1,0
    1bfc:	12061e63          	bnez	a2,1d38 <strncpy+0x20a>
    1c00:	00778693          	addi	a3,a5,7
    1c04:	452d                	li	a0,11
    1c06:	12a6e763          	bltu	a3,a0,1d34 <strncpy+0x206>
    1c0a:	16d5e663          	bltu	a1,a3,1d76 <strncpy+0x248>
    1c0e:	14078c63          	beqz	a5,1d66 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c12:	00070023          	sb	zero,0(a4)
    1c16:	4585                	li	a1,1
    1c18:	00170693          	addi	a3,a4,1
    1c1c:	14b78363          	beq	a5,a1,1d62 <strncpy+0x234>
    1c20:	000700a3          	sb	zero,1(a4)
    1c24:	4589                	li	a1,2
    1c26:	00270693          	addi	a3,a4,2
    1c2a:	14b78963          	beq	a5,a1,1d7c <strncpy+0x24e>
    1c2e:	00070123          	sb	zero,2(a4)
    1c32:	458d                	li	a1,3
    1c34:	00370693          	addi	a3,a4,3
    1c38:	12b78363          	beq	a5,a1,1d5e <strncpy+0x230>
    1c3c:	000701a3          	sb	zero,3(a4)
    1c40:	4591                	li	a1,4
    1c42:	00470693          	addi	a3,a4,4
    1c46:	12b78d63          	beq	a5,a1,1d80 <strncpy+0x252>
    1c4a:	00070223          	sb	zero,4(a4)
    1c4e:	4595                	li	a1,5
    1c50:	00570693          	addi	a3,a4,5
    1c54:	12b78863          	beq	a5,a1,1d84 <strncpy+0x256>
    1c58:	000702a3          	sb	zero,5(a4)
    1c5c:	459d                	li	a1,7
    1c5e:	00670693          	addi	a3,a4,6
    1c62:	12b79363          	bne	a5,a1,1d88 <strncpy+0x25a>
    1c66:	00770693          	addi	a3,a4,7
    1c6a:	00070323          	sb	zero,6(a4)
    1c6e:	40f80833          	sub	a6,a6,a5
    1c72:	ff887513          	andi	a0,a6,-8
    1c76:	97ba                	add	a5,a5,a4
    1c78:	953e                	add	a0,a0,a5
    1c7a:	0007b023          	sd	zero,0(a5)
    1c7e:	07a1                	addi	a5,a5,8
    1c80:	fea79de3          	bne	a5,a0,1c7a <strncpy+0x14c>
    1c84:	ff887513          	andi	a0,a6,-8
    1c88:	9da9                	addw	a1,a1,a0
    1c8a:	00a687b3          	add	a5,a3,a0
    1c8e:	f4a80de3          	beq	a6,a0,1be8 <strncpy+0xba>
    1c92:	00078023          	sb	zero,0(a5)
    1c96:	0015869b          	addiw	a3,a1,1
    1c9a:	f4c6f7e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1c9e:	000780a3          	sb	zero,1(a5)
    1ca2:	0025869b          	addiw	a3,a1,2
    1ca6:	f4c6f1e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1caa:	00078123          	sb	zero,2(a5)
    1cae:	0035869b          	addiw	a3,a1,3
    1cb2:	f2c6fbe3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cb6:	000781a3          	sb	zero,3(a5)
    1cba:	0045869b          	addiw	a3,a1,4
    1cbe:	f2c6f5e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cc2:	00078223          	sb	zero,4(a5)
    1cc6:	0055869b          	addiw	a3,a1,5
    1cca:	f0c6ffe3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cce:	000782a3          	sb	zero,5(a5)
    1cd2:	0065869b          	addiw	a3,a1,6
    1cd6:	f0c6f9e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cda:	00078323          	sb	zero,6(a5)
    1cde:	0075869b          	addiw	a3,a1,7
    1ce2:	f0c6f3e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1ce6:	000783a3          	sb	zero,7(a5)
    1cea:	0085869b          	addiw	a3,a1,8
    1cee:	eec6fde3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cf2:	00078423          	sb	zero,8(a5)
    1cf6:	0095869b          	addiw	a3,a1,9
    1cfa:	eec6f7e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1cfe:	000784a3          	sb	zero,9(a5)
    1d02:	00a5869b          	addiw	a3,a1,10
    1d06:	eec6f1e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1d0a:	00078523          	sb	zero,10(a5)
    1d0e:	00b5869b          	addiw	a3,a1,11
    1d12:	ecc6fbe3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1d16:	000785a3          	sb	zero,11(a5)
    1d1a:	00c5869b          	addiw	a3,a1,12
    1d1e:	ecc6f5e3          	bleu	a2,a3,1be8 <strncpy+0xba>
    1d22:	00078623          	sb	zero,12(a5)
    1d26:	25b5                	addiw	a1,a1,13
    1d28:	ecc5f0e3          	bleu	a2,a1,1be8 <strncpy+0xba>
    1d2c:	000786a3          	sb	zero,13(a5)
}
    1d30:	853a                	mv	a0,a4
    1d32:	8082                	ret
    1d34:	46ad                	li	a3,11
    1d36:	bdd1                	j	1c0a <strncpy+0xdc>
    1d38:	00778693          	addi	a3,a5,7
    1d3c:	452d                	li	a0,11
    1d3e:	fff60593          	addi	a1,a2,-1
    1d42:	eca6f4e3          	bleu	a0,a3,1c0a <strncpy+0xdc>
    1d46:	b7fd                	j	1d34 <strncpy+0x206>
    1d48:	40e007b3          	neg	a5,a4
    1d4c:	8832                	mv	a6,a2
    1d4e:	8b9d                	andi	a5,a5,7
    1d50:	4581                	li	a1,0
    1d52:	ea0607e3          	beqz	a2,1c00 <strncpy+0xd2>
    1d56:	b7cd                	j	1d38 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d58:	872a                	mv	a4,a0
}
    1d5a:	853a                	mv	a0,a4
    1d5c:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d5e:	458d                	li	a1,3
    1d60:	b739                	j	1c6e <strncpy+0x140>
    1d62:	4585                	li	a1,1
    1d64:	b729                	j	1c6e <strncpy+0x140>
    1d66:	86ba                	mv	a3,a4
    1d68:	4581                	li	a1,0
    1d6a:	b711                	j	1c6e <strncpy+0x140>
    1d6c:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d70:	872a                	mv	a4,a0
    1d72:	85b6                	mv	a1,a3
    1d74:	bda9                	j	1bce <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d76:	87ba                	mv	a5,a4
    1d78:	4581                	li	a1,0
    1d7a:	bf21                	j	1c92 <strncpy+0x164>
    1d7c:	4589                	li	a1,2
    1d7e:	bdc5                	j	1c6e <strncpy+0x140>
    1d80:	4591                	li	a1,4
    1d82:	b5f5                	j	1c6e <strncpy+0x140>
    1d84:	4595                	li	a1,5
    1d86:	b5e5                	j	1c6e <strncpy+0x140>
    1d88:	4599                	li	a1,6
    1d8a:	b5d5                	j	1c6e <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d8c:	00d50023          	sb	a3,0(a0)
    1d90:	872a                	mv	a4,a0
    1d92:	b5b9                	j	1be0 <strncpy+0xb2>

0000000000001d94 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d94:	87aa                	mv	a5,a0
    1d96:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d98:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d9c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1da0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1da2:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da4:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <openat>:
    register long a7 __asm__("a7") = n;
    1dac:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1db0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1db4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <close>:
    register long a7 __asm__("a7") = n;
    1dbc:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <read>:
    register long a7 __asm__("a7") = n;
    1dc8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dcc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dd0:	8082                	ret

0000000000001dd2 <write>:
    register long a7 __asm__("a7") = n;
    1dd2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dda:	8082                	ret

0000000000001ddc <getpid>:
    register long a7 __asm__("a7") = n;
    1ddc:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1de0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <getppid>:
    register long a7 __asm__("a7") = n;
    1de8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dec:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1df4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <fork>:
    register long a7 __asm__("a7") = n;
    1e00:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1e04:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e10:	85b2                	mv	a1,a2
    1e12:	863a                	mv	a2,a4
    if (stack)
    1e14:	c191                	beqz	a1,1e18 <clone+0x8>
	stack += stack_size;
    1e16:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e18:	4781                	li	a5,0
    1e1a:	4701                	li	a4,0
    1e1c:	4681                	li	a3,0
    1e1e:	2601                	sext.w	a2,a2
    1e20:	1ec0006f          	j	200c <__clone>

0000000000001e24 <exit>:
    register long a7 __asm__("a7") = n;
    1e24:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e2c:	8082                	ret

0000000000001e2e <waitpid>:
    register long a7 __asm__("a7") = n;
    1e2e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e32:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e34:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <exec>:
    register long a7 __asm__("a7") = n;
    1e3c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <execve>:
    register long a7 __asm__("a7") = n;
    1e48:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <times>:
    register long a7 __asm__("a7") = n;
    1e54:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <get_time>:

int64 get_time()
{
    1e60:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e62:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e66:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e68:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e6e:	2501                	sext.w	a0,a0
    1e70:	ed09                	bnez	a0,1e8a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e72:	67a2                	ld	a5,8(sp)
    1e74:	3e800713          	li	a4,1000
    1e78:	00015503          	lhu	a0,0(sp)
    1e7c:	02e7d7b3          	divu	a5,a5,a4
    1e80:	02e50533          	mul	a0,a0,a4
    1e84:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e86:	0141                	addi	sp,sp,16
    1e88:	8082                	ret
        return -1;
    1e8a:	557d                	li	a0,-1
    1e8c:	bfed                	j	1e86 <get_time+0x26>

0000000000001e8e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e8e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <time>:
    register long a7 __asm__("a7") = n;
    1e9a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e9e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <sleep>:

int sleep(unsigned long long time)
{
    1ea6:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ea8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1eaa:	850a                	mv	a0,sp
    1eac:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1eae:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1eb2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eb8:	e501                	bnez	a0,1ec0 <sleep+0x1a>
    return 0;
    1eba:	4501                	li	a0,0
}
    1ebc:	0141                	addi	sp,sp,16
    1ebe:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ec0:	4502                	lw	a0,0(sp)
}
    1ec2:	0141                	addi	sp,sp,16
    1ec4:	8082                	ret

0000000000001ec6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ec6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eca:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ed2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ed6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eda:	8082                	ret

0000000000001edc <munmap>:
    register long a7 __asm__("a7") = n;
    1edc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <wait>:

int wait(int *code)
{
    1ee8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eea:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eee:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ef0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ef2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ef4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <spawn>:
    register long a7 __asm__("a7") = n;
    1efc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f00:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <mailread>:
    register long a7 __asm__("a7") = n;
    1f08:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f14:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f18:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <fstat>:
    register long a7 __asm__("a7") = n;
    1f20:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f24:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f2c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f2e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f32:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f34:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f3c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f3e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f42:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f44:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <link>:

int link(char *old_path, char *new_path)
{
    1f4c:	87aa                	mv	a5,a0
    1f4e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f50:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f5a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f5e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f60:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <unlink>:

int unlink(char *path)
{
    1f68:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f6a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f6e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f72:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f74:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <uname>:
    register long a7 __asm__("a7") = n;
    1f7c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f80:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret

0000000000001f88 <brk>:
    register long a7 __asm__("a7") = n;
    1f88:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f8c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f94:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f96:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f9a:	8082                	ret

0000000000001f9c <chdir>:
    register long a7 __asm__("a7") = n;
    1f9c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1fa0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fa8:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1faa:	02059613          	slli	a2,a1,0x20
    1fae:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fb0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fb4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fb8:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fba:	00000073          	ecall
}
    1fbe:	2501                	sext.w	a0,a0
    1fc0:	8082                	ret

0000000000001fc2 <getdents>:
    register long a7 __asm__("a7") = n;
    1fc2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <pipe>:
    register long a7 __asm__("a7") = n;
    1fce:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fd2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fd4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fd8:	2501                	sext.w	a0,a0
    1fda:	8082                	ret

0000000000001fdc <dup>:
    register long a7 __asm__("a7") = n;
    1fdc:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fde:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fe2:	2501                	sext.w	a0,a0
    1fe4:	8082                	ret

0000000000001fe6 <dup2>:
    register long a7 __asm__("a7") = n;
    1fe6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fe8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fea:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fee:	2501                	sext.w	a0,a0
    1ff0:	8082                	ret

0000000000001ff2 <mount>:
    register long a7 __asm__("a7") = n;
    1ff2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ff6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ffa:	2501                	sext.w	a0,a0
    1ffc:	8082                	ret

0000000000001ffe <umount>:
    register long a7 __asm__("a7") = n;
    1ffe:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2002:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2004:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    2008:	2501                	sext.w	a0,a0
    200a:	8082                	ret

000000000000200c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    200c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    200e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2010:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2012:	8532                	mv	a0,a2
	mv a2, a4
    2014:	863a                	mv	a2,a4
	mv a3, a5
    2016:	86be                	mv	a3,a5
	mv a4, a6
    2018:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    201a:	0dc00893          	li	a7,220
	ecall
    201e:	00000073          	ecall

	beqz a0, 1f
    2022:	c111                	beqz	a0,2026 <__clone+0x1a>
	# Parent
	ret
    2024:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2026:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2028:	6522                	ld	a0,8(sp)
	jalr a1
    202a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    202c:	05d00893          	li	a7,93
	ecall
    2030:	00000073          	ecall
