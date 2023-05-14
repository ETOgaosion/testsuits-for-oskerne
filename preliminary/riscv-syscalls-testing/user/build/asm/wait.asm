
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/wait:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0c80006f          	j	10ca <__start_main>

0000000000001006 <test_wait>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_wait(void){
    1006:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	00050513          	mv	a0,a0
void test_wait(void){
    1010:	f406                	sd	ra,40(sp)
    1012:	f022                	sd	s0,32(sp)
    1014:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1016:	2b4000ef          	jal	ra,12ca <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	0be50513          	addi	a0,a0,190 # 20d8 <__func__.1186>
    1022:	2a8000ef          	jal	ra,12ca <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	ffa50513          	addi	a0,a0,-6 # 2020 <__clone+0x46>
    102e:	29c000ef          	jal	ra,12ca <puts>
    int cpid, wstatus;
    cpid = fork();
    1032:	59d000ef          	jal	ra,1dce <fork>
    if(cpid == 0){
    1036:	e129                	bnez	a0,1078 <test_wait+0x72>
	printf("This is child process\n");
    1038:	00001517          	auipc	a0,0x1
    103c:	ff850513          	addi	a0,a0,-8 # 2030 <__clone+0x56>
    1040:	2ac000ef          	jal	ra,12ec <printf>
        exit(0);
    1044:	4501                	li	a0,0
    1046:	5ad000ef          	jal	ra,1df2 <exit>
	if(ret == cpid)
	    printf("wait child success.\nwstatus: %d\n", wstatus);
	else
	    printf("wait child error.\n");
    }
    TEST_END(__func__);
    104a:	00001517          	auipc	a0,0x1
    104e:	05e50513          	addi	a0,a0,94 # 20a8 <__clone+0xce>
    1052:	278000ef          	jal	ra,12ca <puts>
    1056:	00001517          	auipc	a0,0x1
    105a:	08250513          	addi	a0,a0,130 # 20d8 <__func__.1186>
    105e:	26c000ef          	jal	ra,12ca <puts>
    1062:	00001517          	auipc	a0,0x1
    1066:	fbe50513          	addi	a0,a0,-66 # 2020 <__clone+0x46>
    106a:	260000ef          	jal	ra,12ca <puts>
}
    106e:	70a2                	ld	ra,40(sp)
    1070:	7402                	ld	s0,32(sp)
    1072:	64e2                	ld	s1,24(sp)
    1074:	6145                	addi	sp,sp,48
    1076:	8082                	ret
	pid_t ret = wait(&wstatus);
    1078:	842a                	mv	s0,a0
    107a:	0068                	addi	a0,sp,12
    107c:	63b000ef          	jal	ra,1eb6 <wait>
	assert(ret != -1);
    1080:	57fd                	li	a5,-1
	pid_t ret = wait(&wstatus);
    1082:	84aa                	mv	s1,a0
	assert(ret != -1);
    1084:	00f50b63          	beq	a0,a5,109a <test_wait+0x94>
	if(ret == cpid)
    1088:	02940163          	beq	s0,s1,10aa <test_wait+0xa4>
	    printf("wait child error.\n");
    108c:	00001517          	auipc	a0,0x1
    1090:	00450513          	addi	a0,a0,4 # 2090 <__clone+0xb6>
    1094:	258000ef          	jal	ra,12ec <printf>
    1098:	bf4d                	j	104a <test_wait+0x44>
	assert(ret != -1);
    109a:	00001517          	auipc	a0,0x1
    109e:	fae50513          	addi	a0,a0,-82 # 2048 <__clone+0x6e>
    10a2:	4ee000ef          	jal	ra,1590 <panic>
	if(ret == cpid)
    10a6:	fe9413e3          	bne	s0,s1,108c <test_wait+0x86>
	    printf("wait child success.\nwstatus: %d\n", wstatus);
    10aa:	45b2                	lw	a1,12(sp)
    10ac:	00001517          	auipc	a0,0x1
    10b0:	fbc50513          	addi	a0,a0,-68 # 2068 <__clone+0x8e>
    10b4:	238000ef          	jal	ra,12ec <printf>
    10b8:	bf49                	j	104a <test_wait+0x44>

00000000000010ba <main>:

int main(void){
    10ba:	1141                	addi	sp,sp,-16
    10bc:	e406                	sd	ra,8(sp)
    test_wait();
    10be:	f49ff0ef          	jal	ra,1006 <test_wait>
    return 0;
}
    10c2:	60a2                	ld	ra,8(sp)
    10c4:	4501                	li	a0,0
    10c6:	0141                	addi	sp,sp,16
    10c8:	8082                	ret

00000000000010ca <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ca:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10cc:	4108                	lw	a0,0(a0)
{
    10ce:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d0:	05a1                	addi	a1,a1,8
{
    10d2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d4:	fe7ff0ef          	jal	ra,10ba <main>
    10d8:	51b000ef          	jal	ra,1df2 <exit>
	return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	addi	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e4:	7179                	addi	sp,sp,-48
    10e6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e8:	12054e63          	bltz	a0,1224 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10ec:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10f0:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f2:	02b7f6bb          	remuw	a3,a5,a1
    10f6:	00001717          	auipc	a4,0x1
    10fa:	ff270713          	addi	a4,a4,-14 # 20e8 <digits>
    buf[16] = 0;
    10fe:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1102:	1682                	slli	a3,a3,0x20
    1104:	9281                	srli	a3,a3,0x20
    1106:	96ba                	add	a3,a3,a4
    1108:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    110c:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1110:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1114:	16b7e363          	bltu	a5,a1,127a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1118:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    111c:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1120:	1602                	slli	a2,a2,0x20
    1122:	9201                	srli	a2,a2,0x20
    1124:	963a                	add	a2,a2,a4
    1126:	00064603          	lbu	a2,0(a2)
    112a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112e:	0007861b          	sext.w	a2,a5
    1132:	12b6e863          	bltu	a3,a1,1262 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1136:	02b7f6bb          	remuw	a3,a5,a1
    113a:	1682                	slli	a3,a3,0x20
    113c:	9281                	srli	a3,a3,0x20
    113e:	96ba                	add	a3,a3,a4
    1140:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1144:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1148:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    114c:	10b66e63          	bltu	a2,a1,1268 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1150:	02b876bb          	remuw	a3,a6,a1
    1154:	1682                	slli	a3,a3,0x20
    1156:	9281                	srli	a3,a3,0x20
    1158:	96ba                	add	a3,a3,a4
    115a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1162:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1166:	10b86463          	bltu	a6,a1,126e <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    116a:	02b676bb          	remuw	a3,a2,a1
    116e:	1682                	slli	a3,a3,0x20
    1170:	9281                	srli	a3,a3,0x20
    1172:	96ba                	add	a3,a3,a4
    1174:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1178:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    117c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1180:	0eb66a63          	bltu	a2,a1,1274 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1184:	02b876bb          	remuw	a3,a6,a1
    1188:	1682                	slli	a3,a3,0x20
    118a:	9281                	srli	a3,a3,0x20
    118c:	96ba                	add	a3,a3,a4
    118e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1192:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1196:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    119a:	0cb86163          	bltu	a6,a1,125c <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    119e:	02b676bb          	remuw	a3,a2,a1
    11a2:	1682                	slli	a3,a3,0x20
    11a4:	9281                	srli	a3,a3,0x20
    11a6:	96ba                	add	a3,a3,a4
    11a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ac:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11b0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11b4:	0cb66563          	bltu	a2,a1,127e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11b8:	02b876bb          	remuw	a3,a6,a1
    11bc:	1682                	slli	a3,a3,0x20
    11be:	9281                	srli	a3,a3,0x20
    11c0:	96ba                	add	a3,a3,a4
    11c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ca:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ce:	0ab86b63          	bltu	a6,a1,1284 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11d2:	02b676bb          	remuw	a3,a2,a1
    11d6:	1682                	slli	a3,a3,0x20
    11d8:	9281                	srli	a3,a3,0x20
    11da:	96ba                	add	a3,a3,a4
    11dc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e0:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11e4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11e8:	0ab66163          	bltu	a2,a1,128a <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11ec:	1782                	slli	a5,a5,0x20
    11ee:	9381                	srli	a5,a5,0x20
    11f0:	97ba                	add	a5,a5,a4
    11f2:	0007c703          	lbu	a4,0(a5)
    11f6:	4599                	li	a1,6
    11f8:	4795                	li	a5,5
    11fa:	00e10723          	sb	a4,14(sp)

    if (sign)
    11fe:	00055963          	bgez	a0,1210 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1202:	1018                	addi	a4,sp,32
    1204:	973e                	add	a4,a4,a5
    1206:	02d00693          	li	a3,45
    120a:	fed70423          	sb	a3,-24(a4)
    120e:	85be                	mv	a1,a5
    write(f, s, l);
    1210:	003c                	addi	a5,sp,8
    1212:	4641                	li	a2,16
    1214:	9e0d                	subw	a2,a2,a1
    1216:	4505                	li	a0,1
    1218:	95be                	add	a1,a1,a5
    121a:	387000ef          	jal	ra,1da0 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121e:	70a2                	ld	ra,40(sp)
    1220:	6145                	addi	sp,sp,48
    1222:	8082                	ret
        x = -xx;
    1224:	40a0063b          	negw	a2,a0
    1228:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    122a:	02b677bb          	remuw	a5,a2,a1
    122e:	00001717          	auipc	a4,0x1
    1232:	eba70713          	addi	a4,a4,-326 # 20e8 <digits>
    buf[16] = 0;
    1236:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    123a:	1782                	slli	a5,a5,0x20
    123c:	9381                	srli	a5,a5,0x20
    123e:	97ba                	add	a5,a5,a4
    1240:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1244:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1248:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124c:	ecb676e3          	bleu	a1,a2,1118 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1258:	45b9                	li	a1,14
    125a:	bf5d                	j	1210 <printint.constprop.0+0x12c>
    125c:	47a5                	li	a5,9
    125e:	45a9                	li	a1,10
    1260:	bf79                	j	11fe <printint.constprop.0+0x11a>
    1262:	47b5                	li	a5,13
    1264:	45b9                	li	a1,14
    1266:	bf61                	j	11fe <printint.constprop.0+0x11a>
    1268:	47b1                	li	a5,12
    126a:	45b5                	li	a1,13
    126c:	bf49                	j	11fe <printint.constprop.0+0x11a>
    126e:	47ad                	li	a5,11
    1270:	45b1                	li	a1,12
    1272:	b771                	j	11fe <printint.constprop.0+0x11a>
    1274:	47a9                	li	a5,10
    1276:	45ad                	li	a1,11
    1278:	b759                	j	11fe <printint.constprop.0+0x11a>
    i = 15;
    127a:	45bd                	li	a1,15
    127c:	bf51                	j	1210 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    127e:	47a1                	li	a5,8
    1280:	45a5                	li	a1,9
    1282:	bfb5                	j	11fe <printint.constprop.0+0x11a>
    1284:	479d                	li	a5,7
    1286:	45a1                	li	a1,8
    1288:	bf9d                	j	11fe <printint.constprop.0+0x11a>
    128a:	4799                	li	a5,6
    128c:	459d                	li	a1,7
    128e:	bf85                	j	11fe <printint.constprop.0+0x11a>

0000000000001290 <getchar>:
{
    1290:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1292:	00f10593          	addi	a1,sp,15
    1296:	4605                	li	a2,1
    1298:	4501                	li	a0,0
{
    129a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a0:	2f7000ef          	jal	ra,1d96 <read>
}
    12a4:	60e2                	ld	ra,24(sp)
    12a6:	00f14503          	lbu	a0,15(sp)
    12aa:	6105                	addi	sp,sp,32
    12ac:	8082                	ret

00000000000012ae <putchar>:
{
    12ae:	1101                	addi	sp,sp,-32
    char byte = c;
    12b0:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12b4:	00f10593          	addi	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4505                	li	a0,1
{
    12bc:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12be:	2e3000ef          	jal	ra,1da0 <write>
}
    12c2:	60e2                	ld	ra,24(sp)
    12c4:	2501                	sext.w	a0,a0
    12c6:	6105                	addi	sp,sp,32
    12c8:	8082                	ret

00000000000012ca <puts>:
{
    12ca:	1141                	addi	sp,sp,-16
    12cc:	e406                	sd	ra,8(sp)
    12ce:	e022                	sd	s0,0(sp)
    12d0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d2:	5b2000ef          	jal	ra,1884 <strlen>
    12d6:	862a                	mv	a2,a0
    12d8:	85a2                	mv	a1,s0
    12da:	4505                	li	a0,1
    12dc:	2c5000ef          	jal	ra,1da0 <write>
}
    12e0:	60a2                	ld	ra,8(sp)
    12e2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e4:	957d                	srai	a0,a0,0x3f
    return r;
    12e6:	2501                	sext.w	a0,a0
}
    12e8:	0141                	addi	sp,sp,16
    12ea:	8082                	ret

00000000000012ec <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ec:	7131                	addi	sp,sp,-192
    12ee:	e0da                	sd	s6,64(sp)
    12f0:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12f2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f4:	013c                	addi	a5,sp,136
{
    12f6:	f0ca                	sd	s2,96(sp)
    12f8:	ecce                	sd	s3,88(sp)
    12fa:	e8d2                	sd	s4,80(sp)
    12fc:	e4d6                	sd	s5,72(sp)
    12fe:	fc5e                	sd	s7,56(sp)
    1300:	fc86                	sd	ra,120(sp)
    1302:	f8a2                	sd	s0,112(sp)
    1304:	f4a6                	sd	s1,104(sp)
    1306:	89aa                	mv	s3,a0
    1308:	e52e                	sd	a1,136(sp)
    130a:	e932                	sd	a2,144(sp)
    130c:	ed36                	sd	a3,152(sp)
    130e:	f13a                	sd	a4,160(sp)
    1310:	f942                	sd	a6,176(sp)
    1312:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1314:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1316:	02500913          	li	s2,37
    131a:	07000a93          	li	s5,112
    buf[i++] = '0';
    131e:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1322:	00001a17          	auipc	s4,0x1
    1326:	dc6a0a13          	addi	s4,s4,-570 # 20e8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    132a:	00001b97          	auipc	s7,0x1
    132e:	d8eb8b93          	addi	s7,s7,-626 # 20b8 <__clone+0xde>
        if (!*s)
    1332:	0009c783          	lbu	a5,0(s3)
    1336:	cfb9                	beqz	a5,1394 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1338:	23278d63          	beq	a5,s2,1572 <printf+0x286>
    133c:	864e                	mv	a2,s3
    133e:	a019                	j	1344 <printf+0x58>
    1340:	07278563          	beq	a5,s2,13aa <printf+0xbe>
    1344:	0605                	addi	a2,a2,1
    1346:	00064783          	lbu	a5,0(a2)
    134a:	fbfd                	bnez	a5,1340 <printf+0x54>
    134c:	84b2                	mv	s1,a2
        l = z - a;
    134e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1352:	8622                	mv	a2,s0
    1354:	85ce                	mv	a1,s3
    1356:	4505                	li	a0,1
    1358:	249000ef          	jal	ra,1da0 <write>
        if (l)
    135c:	ec3d                	bnez	s0,13da <printf+0xee>
        if (s[1] == 0)
    135e:	0014c783          	lbu	a5,1(s1)
    1362:	cb8d                	beqz	a5,1394 <printf+0xa8>
        switch (s[1])
    1364:	09578b63          	beq	a5,s5,13fa <printf+0x10e>
    1368:	06fafb63          	bleu	a5,s5,13de <printf+0xf2>
    136c:	07300713          	li	a4,115
    1370:	1ce78e63          	beq	a5,a4,154c <printf+0x260>
    1374:	07800713          	li	a4,120
    1378:	1ae79563          	bne	a5,a4,1522 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    137c:	6782                	ld	a5,0(sp)
    137e:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1380:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1384:	4388                	lw	a0,0(a5)
    1386:	07a1                	addi	a5,a5,8
    1388:	e03e                	sd	a5,0(sp)
    138a:	d5bff0ef          	jal	ra,10e4 <printint.constprop.0>
        if (!*s)
    138e:	0009c783          	lbu	a5,0(s3)
    1392:	f3dd                	bnez	a5,1338 <printf+0x4c>
    }
    va_end(ap);
}
    1394:	70e6                	ld	ra,120(sp)
    1396:	7446                	ld	s0,112(sp)
    1398:	74a6                	ld	s1,104(sp)
    139a:	7906                	ld	s2,96(sp)
    139c:	69e6                	ld	s3,88(sp)
    139e:	6a46                	ld	s4,80(sp)
    13a0:	6aa6                	ld	s5,72(sp)
    13a2:	6b06                	ld	s6,64(sp)
    13a4:	7be2                	ld	s7,56(sp)
    13a6:	6129                	addi	sp,sp,192
    13a8:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13aa:	00164783          	lbu	a5,1(a2)
    13ae:	84b2                	mv	s1,a2
    13b0:	01278763          	beq	a5,s2,13be <printf+0xd2>
    13b4:	bf69                	j	134e <printf+0x62>
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	f9279ae3          	bne	a5,s2,134e <printf+0x62>
    13be:	0489                	addi	s1,s1,2
    13c0:	0004c783          	lbu	a5,0(s1)
    13c4:	0605                	addi	a2,a2,1
    13c6:	ff2788e3          	beq	a5,s2,13b6 <printf+0xca>
        l = z - a;
    13ca:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13ce:	8622                	mv	a2,s0
    13d0:	85ce                	mv	a1,s3
    13d2:	4505                	li	a0,1
    13d4:	1cd000ef          	jal	ra,1da0 <write>
        if (l)
    13d8:	d059                	beqz	s0,135e <printf+0x72>
    13da:	89a6                	mv	s3,s1
    13dc:	bf99                	j	1332 <printf+0x46>
    13de:	06400713          	li	a4,100
    13e2:	14e79063          	bne	a5,a4,1522 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13e6:	6782                	ld	a5,0(sp)
    13e8:	45a9                	li	a1,10
        s += 2;
    13ea:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13ee:	4388                	lw	a0,0(a5)
    13f0:	07a1                	addi	a5,a5,8
    13f2:	e03e                	sd	a5,0(sp)
    13f4:	cf1ff0ef          	jal	ra,10e4 <printint.constprop.0>
        s += 2;
    13f8:	bf59                	j	138e <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13fa:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13fc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1400:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1402:	631c                	ld	a5,0(a4)
    1404:	0721                	addi	a4,a4,8
    1406:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1408:	00479293          	slli	t0,a5,0x4
    140c:	00879f93          	slli	t6,a5,0x8
    1410:	00c79f13          	slli	t5,a5,0xc
    1414:	01079e93          	slli	t4,a5,0x10
    1418:	01479e13          	slli	t3,a5,0x14
    141c:	01879313          	slli	t1,a5,0x18
    1420:	01c79893          	slli	a7,a5,0x1c
    1424:	02479813          	slli	a6,a5,0x24
    1428:	02879513          	slli	a0,a5,0x28
    142c:	02c79593          	slli	a1,a5,0x2c
    1430:	03079693          	slli	a3,a5,0x30
    1434:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1438:	03c7d413          	srli	s0,a5,0x3c
    143c:	01c7d39b          	srliw	t2,a5,0x1c
    1440:	03c2d293          	srli	t0,t0,0x3c
    1444:	03cfdf93          	srli	t6,t6,0x3c
    1448:	03cf5f13          	srli	t5,t5,0x3c
    144c:	03cede93          	srli	t4,t4,0x3c
    1450:	03ce5e13          	srli	t3,t3,0x3c
    1454:	03c35313          	srli	t1,t1,0x3c
    1458:	03c8d893          	srli	a7,a7,0x3c
    145c:	03c85813          	srli	a6,a6,0x3c
    1460:	9171                	srli	a0,a0,0x3c
    1462:	91f1                	srli	a1,a1,0x3c
    1464:	92f1                	srli	a3,a3,0x3c
    1466:	9371                	srli	a4,a4,0x3c
    1468:	96d2                	add	a3,a3,s4
    146a:	9752                	add	a4,a4,s4
    146c:	9452                	add	s0,s0,s4
    146e:	92d2                	add	t0,t0,s4
    1470:	9fd2                	add	t6,t6,s4
    1472:	9f52                	add	t5,t5,s4
    1474:	9ed2                	add	t4,t4,s4
    1476:	9e52                	add	t3,t3,s4
    1478:	9352                	add	t1,t1,s4
    147a:	98d2                	add	a7,a7,s4
    147c:	93d2                	add	t2,t2,s4
    147e:	9852                	add	a6,a6,s4
    1480:	9552                	add	a0,a0,s4
    1482:	95d2                	add	a1,a1,s4
    1484:	0006c983          	lbu	s3,0(a3)
    1488:	0002c283          	lbu	t0,0(t0)
    148c:	00074683          	lbu	a3,0(a4)
    1490:	000fcf83          	lbu	t6,0(t6)
    1494:	000f4f03          	lbu	t5,0(t5)
    1498:	000ece83          	lbu	t4,0(t4)
    149c:	000e4e03          	lbu	t3,0(t3)
    14a0:	00034303          	lbu	t1,0(t1)
    14a4:	0008c883          	lbu	a7,0(a7)
    14a8:	0003c383          	lbu	t2,0(t2)
    14ac:	00084803          	lbu	a6,0(a6)
    14b0:	00054503          	lbu	a0,0(a0)
    14b4:	0005c583          	lbu	a1,0(a1)
    14b8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14bc:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c0:	9371                	srli	a4,a4,0x3c
    14c2:	8bbd                	andi	a5,a5,15
    14c4:	9752                	add	a4,a4,s4
    14c6:	97d2                	add	a5,a5,s4
    14c8:	005105a3          	sb	t0,11(sp)
    14cc:	01f10623          	sb	t6,12(sp)
    14d0:	01e106a3          	sb	t5,13(sp)
    14d4:	01d10723          	sb	t4,14(sp)
    14d8:	01c107a3          	sb	t3,15(sp)
    14dc:	00610823          	sb	t1,16(sp)
    14e0:	011108a3          	sb	a7,17(sp)
    14e4:	00710923          	sb	t2,18(sp)
    14e8:	010109a3          	sb	a6,19(sp)
    14ec:	00a10a23          	sb	a0,20(sp)
    14f0:	00b10aa3          	sb	a1,21(sp)
    14f4:	01310b23          	sb	s3,22(sp)
    14f8:	00d10ba3          	sb	a3,23(sp)
    14fc:	00810523          	sb	s0,10(sp)
    1500:	00074703          	lbu	a4,0(a4)
    1504:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1508:	002c                	addi	a1,sp,8
    150a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150c:	00e10c23          	sb	a4,24(sp)
    1510:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1514:	00010d23          	sb	zero,26(sp)
        s += 2;
    1518:	00248993          	addi	s3,s1,2
    write(f, s, l);
    151c:	085000ef          	jal	ra,1da0 <write>
        s += 2;
    1520:	b5bd                	j	138e <printf+0xa2>
    char byte = c;
    1522:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1526:	4605                	li	a2,1
    1528:	002c                	addi	a1,sp,8
    152a:	4505                	li	a0,1
    char byte = c;
    152c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1530:	071000ef          	jal	ra,1da0 <write>
    char byte = c;
    1534:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1538:	4605                	li	a2,1
    153a:	002c                	addi	a1,sp,8
    153c:	4505                	li	a0,1
    char byte = c;
    153e:	00f10423          	sb	a5,8(sp)
        s += 2;
    1542:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1546:	05b000ef          	jal	ra,1da0 <write>
        s += 2;
    154a:	b591                	j	138e <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    154c:	6782                	ld	a5,0(sp)
    154e:	6380                	ld	s0,0(a5)
    1550:	07a1                	addi	a5,a5,8
    1552:	e03e                	sd	a5,0(sp)
    1554:	cc05                	beqz	s0,158c <printf+0x2a0>
            l = strnlen(a, 200);
    1556:	0c800593          	li	a1,200
    155a:	8522                	mv	a0,s0
    155c:	45a000ef          	jal	ra,19b6 <strnlen>
    write(f, s, l);
    1560:	0005061b          	sext.w	a2,a0
    1564:	85a2                	mv	a1,s0
    1566:	4505                	li	a0,1
    1568:	039000ef          	jal	ra,1da0 <write>
        s += 2;
    156c:	00248993          	addi	s3,s1,2
    1570:	bd39                	j	138e <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1572:	0019c783          	lbu	a5,1(s3)
    1576:	84ce                	mv	s1,s3
    1578:	864e                	mv	a2,s3
    157a:	e52782e3          	beq	a5,s2,13be <printf+0xd2>
    write(f, s, l);
    157e:	4601                	li	a2,0
    1580:	85ce                	mv	a1,s3
    1582:	4505                	li	a0,1
    1584:	01d000ef          	jal	ra,1da0 <write>
    1588:	84ce                	mv	s1,s3
    158a:	bbd1                	j	135e <printf+0x72>
                a = "(null)";
    158c:	845e                	mv	s0,s7
    158e:	b7e1                	j	1556 <printf+0x26a>

0000000000001590 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1590:	1141                	addi	sp,sp,-16
    1592:	e406                	sd	ra,8(sp)
    puts(m);
    1594:	d37ff0ef          	jal	ra,12ca <puts>
    exit(-100);
}
    1598:	60a2                	ld	ra,8(sp)
    exit(-100);
    159a:	f9c00513          	li	a0,-100
}
    159e:	0141                	addi	sp,sp,16
    exit(-100);
    15a0:	0530006f          	j	1df2 <exit>

00000000000015a4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000793          	li	a5,32
    15a8:	00f50663          	beq	a0,a5,15b4 <isspace+0x10>
    15ac:	355d                	addiw	a0,a0,-9
    15ae:	00553513          	sltiu	a0,a0,5
    15b2:	8082                	ret
    15b4:	4505                	li	a0,1
}
    15b6:	8082                	ret

00000000000015b8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b8:	fd05051b          	addiw	a0,a0,-48
}
    15bc:	00a53513          	sltiu	a0,a0,10
    15c0:	8082                	ret

00000000000015c2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000613          	li	a2,32
    15c6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c8:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	0007079b          	sext.w	a5,a4
    15d0:	ff77869b          	addiw	a3,a5,-9
    15d4:	04c70b63          	beq	a4,a2,162a <atoi+0x68>
    15d8:	04d5f963          	bleu	a3,a1,162a <atoi+0x68>
        s++;
    switch (*s)
    15dc:	02b00693          	li	a3,43
    15e0:	04d70a63          	beq	a4,a3,1634 <atoi+0x72>
    15e4:	02d00693          	li	a3,45
    15e8:	06d70463          	beq	a4,a3,1650 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ec:	fd07859b          	addiw	a1,a5,-48
    15f0:	4625                	li	a2,9
    15f2:	873e                	mv	a4,a5
    15f4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15f6:	4e01                	li	t3,0
    while (isdigit(*s))
    15f8:	04b66a63          	bltu	a2,a1,164c <atoi+0x8a>
    int n = 0, neg = 0;
    15fc:	4501                	li	a0,0
    while (isdigit(*s))
    15fe:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1600:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1602:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1606:	0025179b          	slliw	a5,a0,0x2
    160a:	9d3d                	addw	a0,a0,a5
    160c:	fd07031b          	addiw	t1,a4,-48
    1610:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1614:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1618:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    161c:	0006071b          	sext.w	a4,a2
    1620:	feb870e3          	bleu	a1,a6,1600 <atoi+0x3e>
    return neg ? n : -n;
    1624:	000e0563          	beqz	t3,162e <atoi+0x6c>
}
    1628:	8082                	ret
        s++;
    162a:	0505                	addi	a0,a0,1
    162c:	bf71                	j	15c8 <atoi+0x6>
    162e:	4113053b          	subw	a0,t1,a7
    1632:	8082                	ret
    while (isdigit(*s))
    1634:	00154783          	lbu	a5,1(a0)
    1638:	4625                	li	a2,9
        s++;
    163a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163e:	fd07859b          	addiw	a1,a5,-48
    1642:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1646:	4e01                	li	t3,0
    while (isdigit(*s))
    1648:	fab67ae3          	bleu	a1,a2,15fc <atoi+0x3a>
    164c:	4501                	li	a0,0
}
    164e:	8082                	ret
    while (isdigit(*s))
    1650:	00154783          	lbu	a5,1(a0)
    1654:	4625                	li	a2,9
        s++;
    1656:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165a:	fd07859b          	addiw	a1,a5,-48
    165e:	0007871b          	sext.w	a4,a5
    1662:	feb665e3          	bltu	a2,a1,164c <atoi+0x8a>
        neg = 1;
    1666:	4e05                	li	t3,1
    1668:	bf51                	j	15fc <atoi+0x3a>

000000000000166a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166a:	16060d63          	beqz	a2,17e4 <memset+0x17a>
    166e:	40a007b3          	neg	a5,a0
    1672:	8b9d                	andi	a5,a5,7
    1674:	00778713          	addi	a4,a5,7
    1678:	482d                	li	a6,11
    167a:	0ff5f593          	andi	a1,a1,255
    167e:	fff60693          	addi	a3,a2,-1
    1682:	17076263          	bltu	a4,a6,17e6 <memset+0x17c>
    1686:	16e6ea63          	bltu	a3,a4,17fa <memset+0x190>
    168a:	16078563          	beqz	a5,17f4 <memset+0x18a>
    168e:	00b50023          	sb	a1,0(a0)
    1692:	4705                	li	a4,1
    1694:	00150e93          	addi	t4,a0,1
    1698:	14e78c63          	beq	a5,a4,17f0 <memset+0x186>
    169c:	00b500a3          	sb	a1,1(a0)
    16a0:	4709                	li	a4,2
    16a2:	00250e93          	addi	t4,a0,2
    16a6:	14e78d63          	beq	a5,a4,1800 <memset+0x196>
    16aa:	00b50123          	sb	a1,2(a0)
    16ae:	470d                	li	a4,3
    16b0:	00350e93          	addi	t4,a0,3
    16b4:	12e78b63          	beq	a5,a4,17ea <memset+0x180>
    16b8:	00b501a3          	sb	a1,3(a0)
    16bc:	4711                	li	a4,4
    16be:	00450e93          	addi	t4,a0,4
    16c2:	14e78163          	beq	a5,a4,1804 <memset+0x19a>
    16c6:	00b50223          	sb	a1,4(a0)
    16ca:	4715                	li	a4,5
    16cc:	00550e93          	addi	t4,a0,5
    16d0:	12e78c63          	beq	a5,a4,1808 <memset+0x19e>
    16d4:	00b502a3          	sb	a1,5(a0)
    16d8:	471d                	li	a4,7
    16da:	00650e93          	addi	t4,a0,6
    16de:	12e79763          	bne	a5,a4,180c <memset+0x1a2>
    16e2:	00750e93          	addi	t4,a0,7
    16e6:	00b50323          	sb	a1,6(a0)
    16ea:	4f1d                	li	t5,7
    16ec:	00859713          	slli	a4,a1,0x8
    16f0:	8f4d                	or	a4,a4,a1
    16f2:	01059e13          	slli	t3,a1,0x10
    16f6:	01c76e33          	or	t3,a4,t3
    16fa:	01859313          	slli	t1,a1,0x18
    16fe:	006e6333          	or	t1,t3,t1
    1702:	02059893          	slli	a7,a1,0x20
    1706:	011368b3          	or	a7,t1,a7
    170a:	02859813          	slli	a6,a1,0x28
    170e:	40f60333          	sub	t1,a2,a5
    1712:	0108e833          	or	a6,a7,a6
    1716:	03059693          	slli	a3,a1,0x30
    171a:	00d866b3          	or	a3,a6,a3
    171e:	03859713          	slli	a4,a1,0x38
    1722:	97aa                	add	a5,a5,a0
    1724:	ff837813          	andi	a6,t1,-8
    1728:	8f55                	or	a4,a4,a3
    172a:	00f806b3          	add	a3,a6,a5
    172e:	e398                	sd	a4,0(a5)
    1730:	07a1                	addi	a5,a5,8
    1732:	fed79ee3          	bne	a5,a3,172e <memset+0xc4>
    1736:	ff837693          	andi	a3,t1,-8
    173a:	00de87b3          	add	a5,t4,a3
    173e:	01e6873b          	addw	a4,a3,t5
    1742:	0ad30663          	beq	t1,a3,17ee <memset+0x184>
    1746:	00b78023          	sb	a1,0(a5)
    174a:	0017069b          	addiw	a3,a4,1
    174e:	08c6fb63          	bleu	a2,a3,17e4 <memset+0x17a>
    1752:	00b780a3          	sb	a1,1(a5)
    1756:	0027069b          	addiw	a3,a4,2
    175a:	08c6f563          	bleu	a2,a3,17e4 <memset+0x17a>
    175e:	00b78123          	sb	a1,2(a5)
    1762:	0037069b          	addiw	a3,a4,3
    1766:	06c6ff63          	bleu	a2,a3,17e4 <memset+0x17a>
    176a:	00b781a3          	sb	a1,3(a5)
    176e:	0047069b          	addiw	a3,a4,4
    1772:	06c6f963          	bleu	a2,a3,17e4 <memset+0x17a>
    1776:	00b78223          	sb	a1,4(a5)
    177a:	0057069b          	addiw	a3,a4,5
    177e:	06c6f363          	bleu	a2,a3,17e4 <memset+0x17a>
    1782:	00b782a3          	sb	a1,5(a5)
    1786:	0067069b          	addiw	a3,a4,6
    178a:	04c6fd63          	bleu	a2,a3,17e4 <memset+0x17a>
    178e:	00b78323          	sb	a1,6(a5)
    1792:	0077069b          	addiw	a3,a4,7
    1796:	04c6f763          	bleu	a2,a3,17e4 <memset+0x17a>
    179a:	00b783a3          	sb	a1,7(a5)
    179e:	0087069b          	addiw	a3,a4,8
    17a2:	04c6f163          	bleu	a2,a3,17e4 <memset+0x17a>
    17a6:	00b78423          	sb	a1,8(a5)
    17aa:	0097069b          	addiw	a3,a4,9
    17ae:	02c6fb63          	bleu	a2,a3,17e4 <memset+0x17a>
    17b2:	00b784a3          	sb	a1,9(a5)
    17b6:	00a7069b          	addiw	a3,a4,10
    17ba:	02c6f563          	bleu	a2,a3,17e4 <memset+0x17a>
    17be:	00b78523          	sb	a1,10(a5)
    17c2:	00b7069b          	addiw	a3,a4,11
    17c6:	00c6ff63          	bleu	a2,a3,17e4 <memset+0x17a>
    17ca:	00b785a3          	sb	a1,11(a5)
    17ce:	00c7069b          	addiw	a3,a4,12
    17d2:	00c6f963          	bleu	a2,a3,17e4 <memset+0x17a>
    17d6:	00b78623          	sb	a1,12(a5)
    17da:	2735                	addiw	a4,a4,13
    17dc:	00c77463          	bleu	a2,a4,17e4 <memset+0x17a>
    17e0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17e4:	8082                	ret
    17e6:	472d                	li	a4,11
    17e8:	bd79                	j	1686 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	4f0d                	li	t5,3
    17ec:	b701                	j	16ec <memset+0x82>
    17ee:	8082                	ret
    17f0:	4f05                	li	t5,1
    17f2:	bded                	j	16ec <memset+0x82>
    17f4:	8eaa                	mv	t4,a0
    17f6:	4f01                	li	t5,0
    17f8:	bdd5                	j	16ec <memset+0x82>
    17fa:	87aa                	mv	a5,a0
    17fc:	4701                	li	a4,0
    17fe:	b7a1                	j	1746 <memset+0xdc>
    1800:	4f09                	li	t5,2
    1802:	b5ed                	j	16ec <memset+0x82>
    1804:	4f11                	li	t5,4
    1806:	b5dd                	j	16ec <memset+0x82>
    1808:	4f15                	li	t5,5
    180a:	b5cd                	j	16ec <memset+0x82>
    180c:	4f19                	li	t5,6
    180e:	bdf9                	j	16ec <memset+0x82>

0000000000001810 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1810:	00054703          	lbu	a4,0(a0)
    1814:	0005c783          	lbu	a5,0(a1)
    1818:	00e79b63          	bne	a5,a4,182e <strcmp+0x1e>
    181c:	cf89                	beqz	a5,1836 <strcmp+0x26>
    181e:	0505                	addi	a0,a0,1
    1820:	0585                	addi	a1,a1,1
    1822:	0005c783          	lbu	a5,0(a1)
    1826:	00054703          	lbu	a4,0(a0)
    182a:	fef709e3          	beq	a4,a5,181c <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    182e:	0007051b          	sext.w	a0,a4
}
    1832:	9d1d                	subw	a0,a0,a5
    1834:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1836:	4501                	li	a0,0
}
    1838:	9d1d                	subw	a0,a0,a5
    183a:	8082                	ret

000000000000183c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    183c:	c231                	beqz	a2,1880 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183e:	00054783          	lbu	a5,0(a0)
    1842:	0005c683          	lbu	a3,0(a1)
    1846:	c795                	beqz	a5,1872 <strncmp+0x36>
    1848:	ca85                	beqz	a3,1878 <strncmp+0x3c>
    if (!n--)
    184a:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184c:	c615                	beqz	a2,1878 <strncmp+0x3c>
    184e:	00150713          	addi	a4,a0,1
    1852:	9532                	add	a0,a0,a2
    1854:	00d78963          	beq	a5,a3,1866 <strncmp+0x2a>
    1858:	a005                	j	1878 <strncmp+0x3c>
    185a:	ce99                	beqz	a3,1878 <strncmp+0x3c>
    185c:	00e50e63          	beq	a0,a4,1878 <strncmp+0x3c>
    1860:	0705                	addi	a4,a4,1
    1862:	00d79b63          	bne	a5,a3,1878 <strncmp+0x3c>
    1866:	00074783          	lbu	a5,0(a4)
    186a:	0585                	addi	a1,a1,1
    186c:	0005c683          	lbu	a3,0(a1)
    1870:	f7ed                	bnez	a5,185a <strncmp+0x1e>
    1872:	4501                	li	a0,0
        ;
    return *l - *r;
    1874:	9d15                	subw	a0,a0,a3
    1876:	8082                	ret
    1878:	0007851b          	sext.w	a0,a5
    187c:	9d15                	subw	a0,a0,a3
    187e:	8082                	ret
        return 0;
    1880:	4501                	li	a0,0
}
    1882:	8082                	ret

0000000000001884 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1884:	00757793          	andi	a5,a0,7
    1888:	cfa1                	beqz	a5,18e0 <strlen+0x5c>
        if (!*s)
    188a:	00054783          	lbu	a5,0(a0)
    188e:	cbb9                	beqz	a5,18e4 <strlen+0x60>
    1890:	87aa                	mv	a5,a0
    1892:	a021                	j	189a <strlen+0x16>
    1894:	0007c703          	lbu	a4,0(a5)
    1898:	c329                	beqz	a4,18da <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    189a:	0785                	addi	a5,a5,1
    189c:	0077f713          	andi	a4,a5,7
    18a0:	fb75                	bnez	a4,1894 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a2:	00001717          	auipc	a4,0x1
    18a6:	81e70713          	addi	a4,a4,-2018 # 20c0 <__clone+0xe6>
    18aa:	630c                	ld	a1,0(a4)
    18ac:	00001717          	auipc	a4,0x1
    18b0:	81c70713          	addi	a4,a4,-2020 # 20c8 <__clone+0xee>
    18b4:	6394                	ld	a3,0(a5)
    18b6:	6310                	ld	a2,0(a4)
    18b8:	a019                	j	18be <strlen+0x3a>
    18ba:	07a1                	addi	a5,a5,8
    18bc:	6394                	ld	a3,0(a5)
    18be:	00b68733          	add	a4,a3,a1
    18c2:	fff6c693          	not	a3,a3
    18c6:	8f75                	and	a4,a4,a3
    18c8:	8f71                	and	a4,a4,a2
    18ca:	db65                	beqz	a4,18ba <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18cc:	0007c703          	lbu	a4,0(a5)
    18d0:	c709                	beqz	a4,18da <strlen+0x56>
    18d2:	0785                	addi	a5,a5,1
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	ff6d                	bnez	a4,18d2 <strlen+0x4e>
        ;
    return s - a;
    18da:	40a78533          	sub	a0,a5,a0
}
    18de:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e0:	87aa                	mv	a5,a0
    18e2:	b7c1                	j	18a2 <strlen+0x1e>
        if (!*s)
    18e4:	4501                	li	a0,0
            return s - a;
    18e6:	8082                	ret

00000000000018e8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e8:	00757793          	andi	a5,a0,7
    18ec:	0ff5f593          	andi	a1,a1,255
    18f0:	cb99                	beqz	a5,1906 <memchr+0x1e>
    18f2:	c655                	beqz	a2,199e <memchr+0xb6>
    18f4:	00054783          	lbu	a5,0(a0)
    18f8:	0ab78663          	beq	a5,a1,19a4 <memchr+0xbc>
    18fc:	0505                	addi	a0,a0,1
    18fe:	00757793          	andi	a5,a0,7
    1902:	167d                	addi	a2,a2,-1
    1904:	f7fd                	bnez	a5,18f2 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1906:	4701                	li	a4,0
    if (n && *s != c)
    1908:	ca49                	beqz	a2,199a <memchr+0xb2>
    190a:	00054783          	lbu	a5,0(a0)
    190e:	08b78b63          	beq	a5,a1,19a4 <memchr+0xbc>
        size_t k = ONES * c;
    1912:	00000797          	auipc	a5,0x0
    1916:	7be78793          	addi	a5,a5,1982 # 20d0 <__clone+0xf6>
    191a:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191c:	479d                	li	a5,7
        size_t k = ONES * c;
    191e:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1922:	08c7f863          	bleu	a2,a5,19b2 <memchr+0xca>
    1926:	611c                	ld	a5,0(a0)
    1928:	00000317          	auipc	t1,0x0
    192c:	7a030313          	addi	t1,t1,1952 # 20c8 <__clone+0xee>
    1930:	00033803          	ld	a6,0(t1)
    1934:	00f8c7b3          	xor	a5,a7,a5
    1938:	fff7c713          	not	a4,a5
    193c:	8f95                	sub	a5,a5,a3
    193e:	8ff9                	and	a5,a5,a4
    1940:	0107f7b3          	and	a5,a5,a6
    1944:	e7bd                	bnez	a5,19b2 <memchr+0xca>
    1946:	4e1d                	li	t3,7
    1948:	00000e97          	auipc	t4,0x0
    194c:	778e8e93          	addi	t4,t4,1912 # 20c0 <__clone+0xe6>
    1950:	a005                	j	1970 <memchr+0x88>
    1952:	6514                	ld	a3,8(a0)
    1954:	000eb783          	ld	a5,0(t4)
    1958:	00033803          	ld	a6,0(t1)
    195c:	00d8c6b3          	xor	a3,a7,a3
    1960:	97b6                	add	a5,a5,a3
    1962:	fff6c693          	not	a3,a3
    1966:	8ff5                	and	a5,a5,a3
    1968:	0107f7b3          	and	a5,a5,a6
    196c:	e3a1                	bnez	a5,19ac <memchr+0xc4>
    196e:	853a                	mv	a0,a4
    1970:	1661                	addi	a2,a2,-8
    1972:	00850713          	addi	a4,a0,8
    1976:	fcce6ee3          	bltu	t3,a2,1952 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    197a:	c215                	beqz	a2,199e <memchr+0xb6>
    197c:	00074783          	lbu	a5,0(a4)
    1980:	00f58d63          	beq	a1,a5,199a <memchr+0xb2>
    1984:	00170793          	addi	a5,a4,1
    1988:	963a                	add	a2,a2,a4
    198a:	873e                	mv	a4,a5
    198c:	00f60963          	beq	a2,a5,199e <memchr+0xb6>
    1990:	0007c683          	lbu	a3,0(a5)
    1994:	0785                	addi	a5,a5,1
    1996:	feb69ae3          	bne	a3,a1,198a <memchr+0xa2>
}
    199a:	853a                	mv	a0,a4
    199c:	8082                	ret
    return n ? (void *)s : 0;
    199e:	4701                	li	a4,0
}
    19a0:	853a                	mv	a0,a4
    19a2:	8082                	ret
    19a4:	872a                	mv	a4,a0
    19a6:	00074783          	lbu	a5,0(a4)
    19aa:	bfd9                	j	1980 <memchr+0x98>
    19ac:	00854783          	lbu	a5,8(a0)
    19b0:	bfc1                	j	1980 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19b2:	872a                	mv	a4,a0
    19b4:	bfc1                	j	1984 <memchr+0x9c>

00000000000019b6 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19b6:	00757793          	andi	a5,a0,7
    19ba:	cfc5                	beqz	a5,1a72 <strnlen+0xbc>
    19bc:	c1c5                	beqz	a1,1a5c <strnlen+0xa6>
    19be:	00054783          	lbu	a5,0(a0)
    19c2:	cfd9                	beqz	a5,1a60 <strnlen+0xaa>
    19c4:	87ae                	mv	a5,a1
    19c6:	86aa                	mv	a3,a0
    19c8:	a029                	j	19d2 <strnlen+0x1c>
    19ca:	cbc9                	beqz	a5,1a5c <strnlen+0xa6>
    19cc:	0006c703          	lbu	a4,0(a3)
    19d0:	cb51                	beqz	a4,1a64 <strnlen+0xae>
    19d2:	0685                	addi	a3,a3,1
    19d4:	0076f713          	andi	a4,a3,7
    19d8:	17fd                	addi	a5,a5,-1
    19da:	fb65                	bnez	a4,19ca <strnlen+0x14>
    if (n && *s != c)
    19dc:	c3c1                	beqz	a5,1a5c <strnlen+0xa6>
    19de:	0006c703          	lbu	a4,0(a3)
    19e2:	c349                	beqz	a4,1a64 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19e4:	471d                	li	a4,7
    19e6:	08f77a63          	bleu	a5,a4,1a7a <strnlen+0xc4>
    19ea:	00000e17          	auipc	t3,0x0
    19ee:	6d6e0e13          	addi	t3,t3,1750 # 20c0 <__clone+0xe6>
    19f2:	6290                	ld	a2,0(a3)
    19f4:	000e3703          	ld	a4,0(t3)
    19f8:	00000e97          	auipc	t4,0x0
    19fc:	6d0e8e93          	addi	t4,t4,1744 # 20c8 <__clone+0xee>
    1a00:	000eb803          	ld	a6,0(t4)
    1a04:	9732                	add	a4,a4,a2
    1a06:	fff64613          	not	a2,a2
    1a0a:	8f71                	and	a4,a4,a2
    1a0c:	01077733          	and	a4,a4,a6
    1a10:	e72d                	bnez	a4,1a7a <strnlen+0xc4>
    1a12:	4f1d                	li	t5,7
    1a14:	a839                	j	1a32 <strnlen+0x7c>
    1a16:	6698                	ld	a4,8(a3)
    1a18:	000e3303          	ld	t1,0(t3)
    1a1c:	000eb803          	ld	a6,0(t4)
    1a20:	fff74893          	not	a7,a4
    1a24:	971a                	add	a4,a4,t1
    1a26:	01177733          	and	a4,a4,a7
    1a2a:	01077733          	and	a4,a4,a6
    1a2e:	ef1d                	bnez	a4,1a6c <strnlen+0xb6>
    1a30:	86b2                	mv	a3,a2
    1a32:	17e1                	addi	a5,a5,-8
    1a34:	00868613          	addi	a2,a3,8
    1a38:	fcff6fe3          	bltu	t5,a5,1a16 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a3c:	c385                	beqz	a5,1a5c <strnlen+0xa6>
    1a3e:	00064703          	lbu	a4,0(a2)
    1a42:	cb19                	beqz	a4,1a58 <strnlen+0xa2>
    1a44:	00160713          	addi	a4,a2,1
    1a48:	97b2                	add	a5,a5,a2
    1a4a:	863a                	mv	a2,a4
    1a4c:	00e78863          	beq	a5,a4,1a5c <strnlen+0xa6>
    1a50:	0705                	addi	a4,a4,1
    1a52:	fff74683          	lbu	a3,-1(a4)
    1a56:	faf5                	bnez	a3,1a4a <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a58:	40a605b3          	sub	a1,a2,a0
}
    1a5c:	852e                	mv	a0,a1
    1a5e:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a60:	87ae                	mv	a5,a1
    1a62:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a64:	8636                	mv	a2,a3
    1a66:	00064703          	lbu	a4,0(a2)
    1a6a:	bfe1                	j	1a42 <strnlen+0x8c>
    1a6c:	0086c703          	lbu	a4,8(a3)
    1a70:	bfc9                	j	1a42 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a72:	87ae                	mv	a5,a1
    1a74:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a76:	f7a5                	bnez	a5,19de <strnlen+0x28>
    1a78:	b7d5                	j	1a5c <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a7a:	8636                	mv	a2,a3
    1a7c:	b7e1                	j	1a44 <strnlen+0x8e>

0000000000001a7e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a7e:	00b547b3          	xor	a5,a0,a1
    1a82:	8b9d                	andi	a5,a5,7
    1a84:	efa9                	bnez	a5,1ade <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a86:	0075f793          	andi	a5,a1,7
    1a8a:	c38d                	beqz	a5,1aac <strcpy+0x2e>
            if (!(*d = *s))
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	e799                	bnez	a5,1aa2 <strcpy+0x24>
    1a96:	a095                	j	1afa <strcpy+0x7c>
    1a98:	0005c783          	lbu	a5,0(a1)
    1a9c:	00f50023          	sb	a5,0(a0)
    1aa0:	cbb9                	beqz	a5,1af6 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aa2:	0585                	addi	a1,a1,1
    1aa4:	0075f793          	andi	a5,a1,7
    1aa8:	0505                	addi	a0,a0,1
    1aaa:	f7fd                	bnez	a5,1a98 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aac:	00000797          	auipc	a5,0x0
    1ab0:	61478793          	addi	a5,a5,1556 # 20c0 <__clone+0xe6>
    1ab4:	0007b803          	ld	a6,0(a5)
    1ab8:	00000797          	auipc	a5,0x0
    1abc:	61078793          	addi	a5,a5,1552 # 20c8 <__clone+0xee>
    1ac0:	6198                	ld	a4,0(a1)
    1ac2:	6390                	ld	a2,0(a5)
    1ac4:	a031                	j	1ad0 <strcpy+0x52>
    1ac6:	0521                	addi	a0,a0,8
    1ac8:	05a1                	addi	a1,a1,8
    1aca:	fee53c23          	sd	a4,-8(a0)
    1ace:	6198                	ld	a4,0(a1)
    1ad0:	010707b3          	add	a5,a4,a6
    1ad4:	fff74693          	not	a3,a4
    1ad8:	8ff5                	and	a5,a5,a3
    1ada:	8ff1                	and	a5,a5,a2
    1adc:	d7ed                	beqz	a5,1ac6 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ade:	0005c783          	lbu	a5,0(a1)
    1ae2:	00f50023          	sb	a5,0(a0)
    1ae6:	cb89                	beqz	a5,1af8 <strcpy+0x7a>
    1ae8:	0585                	addi	a1,a1,1
    1aea:	0005c783          	lbu	a5,0(a1)
    1aee:	0505                	addi	a0,a0,1
    1af0:	00f50023          	sb	a5,0(a0)
    1af4:	fbf5                	bnez	a5,1ae8 <strcpy+0x6a>
        ;
    return d;
}
    1af6:	8082                	ret
    1af8:	8082                	ret
    1afa:	8082                	ret

0000000000001afc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1afc:	00b547b3          	xor	a5,a0,a1
    1b00:	8b9d                	andi	a5,a5,7
    1b02:	ebc1                	bnez	a5,1b92 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b04:	0075f793          	andi	a5,a1,7
    1b08:	cf91                	beqz	a5,1b24 <strncpy+0x28>
    1b0a:	20060e63          	beqz	a2,1d26 <strncpy+0x22a>
    1b0e:	0005c783          	lbu	a5,0(a1)
    1b12:	00f50023          	sb	a5,0(a0)
    1b16:	c3d5                	beqz	a5,1bba <strncpy+0xbe>
    1b18:	0585                	addi	a1,a1,1
    1b1a:	0075f793          	andi	a5,a1,7
    1b1e:	167d                	addi	a2,a2,-1
    1b20:	0505                	addi	a0,a0,1
    1b22:	f7e5                	bnez	a5,1b0a <strncpy+0xe>
            ;
        if (!n || !*s)
    1b24:	20060163          	beqz	a2,1d26 <strncpy+0x22a>
    1b28:	0005c683          	lbu	a3,0(a1)
    1b2c:	c6d9                	beqz	a3,1bba <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2e:	479d                	li	a5,7
    1b30:	22c7f563          	bleu	a2,a5,1d5a <strncpy+0x25e>
    1b34:	00000317          	auipc	t1,0x0
    1b38:	58c30313          	addi	t1,t1,1420 # 20c0 <__clone+0xe6>
    1b3c:	6198                	ld	a4,0(a1)
    1b3e:	00033783          	ld	a5,0(t1)
    1b42:	00000e17          	auipc	t3,0x0
    1b46:	586e0e13          	addi	t3,t3,1414 # 20c8 <__clone+0xee>
    1b4a:	000e3803          	ld	a6,0(t3)
    1b4e:	97ba                	add	a5,a5,a4
    1b50:	fff74893          	not	a7,a4
    1b54:	0117f7b3          	and	a5,a5,a7
    1b58:	0107f7b3          	and	a5,a5,a6
    1b5c:	1e079f63          	bnez	a5,1d5a <strncpy+0x25e>
    1b60:	4e9d                	li	t4,7
    1b62:	a005                	j	1b82 <strncpy+0x86>
    1b64:	6598                	ld	a4,8(a1)
    1b66:	00033783          	ld	a5,0(t1)
    1b6a:	000e3803          	ld	a6,0(t3)
    1b6e:	fff74893          	not	a7,a4
    1b72:	97ba                	add	a5,a5,a4
    1b74:	0117f7b3          	and	a5,a5,a7
    1b78:	0107f7b3          	and	a5,a5,a6
    1b7c:	1a079f63          	bnez	a5,1d3a <strncpy+0x23e>
    1b80:	85b6                	mv	a1,a3
            *wd = *ws;
    1b82:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b84:	1661                	addi	a2,a2,-8
    1b86:	00858693          	addi	a3,a1,8
    1b8a:	0521                	addi	a0,a0,8
    1b8c:	fcceece3          	bltu	t4,a2,1b64 <strncpy+0x68>
    1b90:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b92:	18060a63          	beqz	a2,1d26 <strncpy+0x22a>
    1b96:	0005c783          	lbu	a5,0(a1)
    1b9a:	872a                	mv	a4,a0
    1b9c:	00f50023          	sb	a5,0(a0)
    1ba0:	e799                	bnez	a5,1bae <strncpy+0xb2>
    1ba2:	a829                	j	1bbc <strncpy+0xc0>
    1ba4:	0005c783          	lbu	a5,0(a1)
    1ba8:	00f70023          	sb	a5,0(a4)
    1bac:	cb81                	beqz	a5,1bbc <strncpy+0xc0>
    1bae:	167d                	addi	a2,a2,-1
    1bb0:	0585                	addi	a1,a1,1
    1bb2:	0705                	addi	a4,a4,1
    1bb4:	fa65                	bnez	a2,1ba4 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bb6:	853a                	mv	a0,a4
    1bb8:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bba:	872a                	mv	a4,a0
    1bbc:	4805                	li	a6,1
    1bbe:	14061c63          	bnez	a2,1d16 <strncpy+0x21a>
    1bc2:	40e007b3          	neg	a5,a4
    1bc6:	8b9d                	andi	a5,a5,7
    1bc8:	4581                	li	a1,0
    1bca:	12061e63          	bnez	a2,1d06 <strncpy+0x20a>
    1bce:	00778693          	addi	a3,a5,7
    1bd2:	452d                	li	a0,11
    1bd4:	12a6e763          	bltu	a3,a0,1d02 <strncpy+0x206>
    1bd8:	16d5e663          	bltu	a1,a3,1d44 <strncpy+0x248>
    1bdc:	14078c63          	beqz	a5,1d34 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	00070023          	sb	zero,0(a4)
    1be4:	4585                	li	a1,1
    1be6:	00170693          	addi	a3,a4,1
    1bea:	14b78363          	beq	a5,a1,1d30 <strncpy+0x234>
    1bee:	000700a3          	sb	zero,1(a4)
    1bf2:	4589                	li	a1,2
    1bf4:	00270693          	addi	a3,a4,2
    1bf8:	14b78963          	beq	a5,a1,1d4a <strncpy+0x24e>
    1bfc:	00070123          	sb	zero,2(a4)
    1c00:	458d                	li	a1,3
    1c02:	00370693          	addi	a3,a4,3
    1c06:	12b78363          	beq	a5,a1,1d2c <strncpy+0x230>
    1c0a:	000701a3          	sb	zero,3(a4)
    1c0e:	4591                	li	a1,4
    1c10:	00470693          	addi	a3,a4,4
    1c14:	12b78d63          	beq	a5,a1,1d4e <strncpy+0x252>
    1c18:	00070223          	sb	zero,4(a4)
    1c1c:	4595                	li	a1,5
    1c1e:	00570693          	addi	a3,a4,5
    1c22:	12b78863          	beq	a5,a1,1d52 <strncpy+0x256>
    1c26:	000702a3          	sb	zero,5(a4)
    1c2a:	459d                	li	a1,7
    1c2c:	00670693          	addi	a3,a4,6
    1c30:	12b79363          	bne	a5,a1,1d56 <strncpy+0x25a>
    1c34:	00770693          	addi	a3,a4,7
    1c38:	00070323          	sb	zero,6(a4)
    1c3c:	40f80833          	sub	a6,a6,a5
    1c40:	ff887513          	andi	a0,a6,-8
    1c44:	97ba                	add	a5,a5,a4
    1c46:	953e                	add	a0,a0,a5
    1c48:	0007b023          	sd	zero,0(a5)
    1c4c:	07a1                	addi	a5,a5,8
    1c4e:	fea79de3          	bne	a5,a0,1c48 <strncpy+0x14c>
    1c52:	ff887513          	andi	a0,a6,-8
    1c56:	9da9                	addw	a1,a1,a0
    1c58:	00a687b3          	add	a5,a3,a0
    1c5c:	f4a80de3          	beq	a6,a0,1bb6 <strncpy+0xba>
    1c60:	00078023          	sb	zero,0(a5)
    1c64:	0015869b          	addiw	a3,a1,1
    1c68:	f4c6f7e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1c6c:	000780a3          	sb	zero,1(a5)
    1c70:	0025869b          	addiw	a3,a1,2
    1c74:	f4c6f1e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1c78:	00078123          	sb	zero,2(a5)
    1c7c:	0035869b          	addiw	a3,a1,3
    1c80:	f2c6fbe3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1c84:	000781a3          	sb	zero,3(a5)
    1c88:	0045869b          	addiw	a3,a1,4
    1c8c:	f2c6f5e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1c90:	00078223          	sb	zero,4(a5)
    1c94:	0055869b          	addiw	a3,a1,5
    1c98:	f0c6ffe3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1c9c:	000782a3          	sb	zero,5(a5)
    1ca0:	0065869b          	addiw	a3,a1,6
    1ca4:	f0c6f9e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1ca8:	00078323          	sb	zero,6(a5)
    1cac:	0075869b          	addiw	a3,a1,7
    1cb0:	f0c6f3e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1cb4:	000783a3          	sb	zero,7(a5)
    1cb8:	0085869b          	addiw	a3,a1,8
    1cbc:	eec6fde3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1cc0:	00078423          	sb	zero,8(a5)
    1cc4:	0095869b          	addiw	a3,a1,9
    1cc8:	eec6f7e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1ccc:	000784a3          	sb	zero,9(a5)
    1cd0:	00a5869b          	addiw	a3,a1,10
    1cd4:	eec6f1e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1cd8:	00078523          	sb	zero,10(a5)
    1cdc:	00b5869b          	addiw	a3,a1,11
    1ce0:	ecc6fbe3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1ce4:	000785a3          	sb	zero,11(a5)
    1ce8:	00c5869b          	addiw	a3,a1,12
    1cec:	ecc6f5e3          	bleu	a2,a3,1bb6 <strncpy+0xba>
    1cf0:	00078623          	sb	zero,12(a5)
    1cf4:	25b5                	addiw	a1,a1,13
    1cf6:	ecc5f0e3          	bleu	a2,a1,1bb6 <strncpy+0xba>
    1cfa:	000786a3          	sb	zero,13(a5)
}
    1cfe:	853a                	mv	a0,a4
    1d00:	8082                	ret
    1d02:	46ad                	li	a3,11
    1d04:	bdd1                	j	1bd8 <strncpy+0xdc>
    1d06:	00778693          	addi	a3,a5,7
    1d0a:	452d                	li	a0,11
    1d0c:	fff60593          	addi	a1,a2,-1
    1d10:	eca6f4e3          	bleu	a0,a3,1bd8 <strncpy+0xdc>
    1d14:	b7fd                	j	1d02 <strncpy+0x206>
    1d16:	40e007b3          	neg	a5,a4
    1d1a:	8832                	mv	a6,a2
    1d1c:	8b9d                	andi	a5,a5,7
    1d1e:	4581                	li	a1,0
    1d20:	ea0607e3          	beqz	a2,1bce <strncpy+0xd2>
    1d24:	b7cd                	j	1d06 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d26:	872a                	mv	a4,a0
}
    1d28:	853a                	mv	a0,a4
    1d2a:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d2c:	458d                	li	a1,3
    1d2e:	b739                	j	1c3c <strncpy+0x140>
    1d30:	4585                	li	a1,1
    1d32:	b729                	j	1c3c <strncpy+0x140>
    1d34:	86ba                	mv	a3,a4
    1d36:	4581                	li	a1,0
    1d38:	b711                	j	1c3c <strncpy+0x140>
    1d3a:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d3e:	872a                	mv	a4,a0
    1d40:	85b6                	mv	a1,a3
    1d42:	bda9                	j	1b9c <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d44:	87ba                	mv	a5,a4
    1d46:	4581                	li	a1,0
    1d48:	bf21                	j	1c60 <strncpy+0x164>
    1d4a:	4589                	li	a1,2
    1d4c:	bdc5                	j	1c3c <strncpy+0x140>
    1d4e:	4591                	li	a1,4
    1d50:	b5f5                	j	1c3c <strncpy+0x140>
    1d52:	4595                	li	a1,5
    1d54:	b5e5                	j	1c3c <strncpy+0x140>
    1d56:	4599                	li	a1,6
    1d58:	b5d5                	j	1c3c <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d5a:	00d50023          	sb	a3,0(a0)
    1d5e:	872a                	mv	a4,a0
    1d60:	b5b9                	j	1bae <strncpy+0xb2>

0000000000001d62 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d62:	87aa                	mv	a5,a0
    1d64:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d66:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d70:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d72:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <openat>:
    register long a7 __asm__("a7") = n;
    1d7a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d7e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d82:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <close>:
    register long a7 __asm__("a7") = n;
    1d8a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d8e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <read>:
    register long a7 __asm__("a7") = n;
    1d96:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d9e:	8082                	ret

0000000000001da0 <write>:
    register long a7 __asm__("a7") = n;
    1da0:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da4:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1da8:	8082                	ret

0000000000001daa <getpid>:
    register long a7 __asm__("a7") = n;
    1daa:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dae:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <getppid>:
    register long a7 __asm__("a7") = n;
    1db6:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dba:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dc2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dc6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <fork>:
    register long a7 __asm__("a7") = n;
    1dce:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dd2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dd4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dde:	85b2                	mv	a1,a2
    1de0:	863a                	mv	a2,a4
    if (stack)
    1de2:	c191                	beqz	a1,1de6 <clone+0x8>
	stack += stack_size;
    1de4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1de6:	4781                	li	a5,0
    1de8:	4701                	li	a4,0
    1dea:	4681                	li	a3,0
    1dec:	2601                	sext.w	a2,a2
    1dee:	1ec0006f          	j	1fda <__clone>

0000000000001df2 <exit>:
    register long a7 __asm__("a7") = n;
    1df2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dfa:	8082                	ret

0000000000001dfc <waitpid>:
    register long a7 __asm__("a7") = n;
    1dfc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e00:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e02:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <exec>:
    register long a7 __asm__("a7") = n;
    1e0a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <execve>:
    register long a7 __asm__("a7") = n;
    1e16:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <times>:
    register long a7 __asm__("a7") = n;
    1e22:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <get_time>:

int64 get_time()
{
    1e2e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e30:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e34:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	ed09                	bnez	a0,1e58 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e40:	67a2                	ld	a5,8(sp)
    1e42:	3e800713          	li	a4,1000
    1e46:	00015503          	lhu	a0,0(sp)
    1e4a:	02e7d7b3          	divu	a5,a5,a4
    1e4e:	02e50533          	mul	a0,a0,a4
    1e52:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e54:	0141                	addi	sp,sp,16
    1e56:	8082                	ret
        return -1;
    1e58:	557d                	li	a0,-1
    1e5a:	bfed                	j	1e54 <get_time+0x26>

0000000000001e5c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e5c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e60:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <time>:
    register long a7 __asm__("a7") = n;
    1e68:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e6c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <sleep>:

int sleep(unsigned long long time)
{
    1e74:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e76:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e78:	850a                	mv	a0,sp
    1e7a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e7c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e80:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e86:	e501                	bnez	a0,1e8e <sleep+0x1a>
    return 0;
    1e88:	4501                	li	a0,0
}
    1e8a:	0141                	addi	sp,sp,16
    1e8c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e8e:	4502                	lw	a0,0(sp)
}
    1e90:	0141                	addi	sp,sp,16
    1e92:	8082                	ret

0000000000001e94 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e94:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e98:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ea0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ea4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ea8:	8082                	ret

0000000000001eaa <munmap>:
    register long a7 __asm__("a7") = n;
    1eaa:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eae:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <wait>:

int wait(int *code)
{
    1eb6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eb8:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ebc:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ebe:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ec0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ec2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <spawn>:
    register long a7 __asm__("a7") = n;
    1eca:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ece:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <mailread>:
    register long a7 __asm__("a7") = n;
    1ed6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ee2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <fstat>:
    register long a7 __asm__("a7") = n;
    1eee:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1efa:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1efc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f00:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f02:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f0a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f10:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f12:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <link>:

int link(char *old_path, char *new_path)
{
    1f1a:	87aa                	mv	a5,a0
    1f1c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f1e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f22:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f26:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f28:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f2c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <unlink>:

int unlink(char *path)
{
    1f36:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f38:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f3c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f40:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f42:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f46:	2501                	sext.w	a0,a0
    1f48:	8082                	ret

0000000000001f4a <uname>:
    register long a7 __asm__("a7") = n;
    1f4a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f4e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <brk>:
    register long a7 __asm__("a7") = n;
    1f56:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f5a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f62:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f64:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f68:	8082                	ret

0000000000001f6a <chdir>:
    register long a7 __asm__("a7") = n;
    1f6a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f6e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f72:	2501                	sext.w	a0,a0
    1f74:	8082                	ret

0000000000001f76 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f76:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f78:	02059613          	slli	a2,a1,0x20
    1f7c:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f7e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f82:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f86:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f88:	00000073          	ecall
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <getdents>:
    register long a7 __asm__("a7") = n;
    1f90:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f94:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <pipe>:
    register long a7 __asm__("a7") = n;
    1f9c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fa0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa2:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <dup>:
    register long a7 __asm__("a7") = n;
    1faa:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fac:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fb0:	2501                	sext.w	a0,a0
    1fb2:	8082                	ret

0000000000001fb4 <dup2>:
    register long a7 __asm__("a7") = n;
    1fb4:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fb6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb8:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fbc:	2501                	sext.w	a0,a0
    1fbe:	8082                	ret

0000000000001fc0 <mount>:
    register long a7 __asm__("a7") = n;
    1fc0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fc8:	2501                	sext.w	a0,a0
    1fca:	8082                	ret

0000000000001fcc <umount>:
    register long a7 __asm__("a7") = n;
    1fcc:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fd0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fd2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fd6:	2501                	sext.w	a0,a0
    1fd8:	8082                	ret

0000000000001fda <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fda:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fdc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fde:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fe0:	8532                	mv	a0,a2
	mv a2, a4
    1fe2:	863a                	mv	a2,a4
	mv a3, a5
    1fe4:	86be                	mv	a3,a5
	mv a4, a6
    1fe6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fe8:	0dc00893          	li	a7,220
	ecall
    1fec:	00000073          	ecall

	beqz a0, 1f
    1ff0:	c111                	beqz	a0,1ff4 <__clone+0x1a>
	# Parent
	ret
    1ff2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ff4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ff6:	6522                	ld	a0,8(sp)
	jalr a1
    1ff8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ffa:	05d00893          	li	a7,93
	ecall
    1ffe:	00000073          	ecall
