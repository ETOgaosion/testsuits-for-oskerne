
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/clone:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0f40006f          	j	10f6 <__start_main>

0000000000001006 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1006:	1141                	addi	sp,sp,-16
    printf("  Child says successfully!\n");
    1008:	00001517          	auipc	a0,0x1
    100c:	02850513          	addi	a0,a0,40 # 2030 <__clone+0x2a>
static int child_func(void){
    1010:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1012:	306000ef          	jal	ra,1318 <printf>
    return 0;
}
    1016:	60a2                	ld	ra,8(sp)
    1018:	4501                	li	a0,0
    101a:	0141                	addi	sp,sp,16
    101c:	8082                	ret

000000000000101e <test_clone>:

void test_clone(void){
    101e:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1020:	00001517          	auipc	a0,0x1
    1024:	03050513          	addi	a0,a0,48 # 2050 <__clone+0x4a>
void test_clone(void){
    1028:	ec06                	sd	ra,24(sp)
    102a:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102c:	2ca000ef          	jal	ra,12f6 <puts>
    1030:	00003517          	auipc	a0,0x3
    1034:	0e050513          	addi	a0,a0,224 # 4110 <__func__.1191>
    1038:	2be000ef          	jal	ra,12f6 <puts>
    103c:	00001517          	auipc	a0,0x1
    1040:	02c50513          	addi	a0,a0,44 # 2068 <__clone+0x62>
    1044:	2b2000ef          	jal	ra,12f6 <puts>
    int wstatus;
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    1048:	4745                	li	a4,17
    104a:	40000693          	li	a3,1024
    104e:	00001617          	auipc	a2,0x1
    1052:	0ba60613          	addi	a2,a2,186 # 2108 <stack>
    1056:	4581                	li	a1,0
    1058:	00000517          	auipc	a0,0x0
    105c:	fae50513          	addi	a0,a0,-82 # 1006 <child_func>
    1060:	5ab000ef          	jal	ra,1e0a <clone>
    1064:	00003797          	auipc	a5,0x3
    1068:	0aa7a223          	sw	a0,164(a5) # 4108 <child_pid>
    assert(child_pid != -1);
    106c:	57fd                	li	a5,-1
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    106e:	00003417          	auipc	s0,0x3
    1072:	09a40413          	addi	s0,s0,154 # 4108 <child_pid>
    assert(child_pid != -1);
    1076:	02f50b63          	beq	a0,a5,10ac <test_clone+0x8e>
    if (child_pid == 0){
    107a:	e129                	bnez	a0,10bc <test_clone+0x9e>
	exit(0);
    107c:	5a3000ef          	jal	ra,1e1e <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    1080:	00001517          	auipc	a0,0x1
    1084:	05850513          	addi	a0,a0,88 # 20d8 <__clone+0xd2>
    1088:	26e000ef          	jal	ra,12f6 <puts>
    108c:	00003517          	auipc	a0,0x3
    1090:	08450513          	addi	a0,a0,132 # 4110 <__func__.1191>
    1094:	262000ef          	jal	ra,12f6 <puts>
    1098:	00001517          	auipc	a0,0x1
    109c:	fd050513          	addi	a0,a0,-48 # 2068 <__clone+0x62>
    10a0:	256000ef          	jal	ra,12f6 <puts>
}
    10a4:	60e2                	ld	ra,24(sp)
    10a6:	6442                	ld	s0,16(sp)
    10a8:	6105                	addi	sp,sp,32
    10aa:	8082                	ret
    assert(child_pid != -1);
    10ac:	00001517          	auipc	a0,0x1
    10b0:	fcc50513          	addi	a0,a0,-52 # 2078 <__clone+0x72>
    10b4:	508000ef          	jal	ra,15bc <panic>
    10b8:	4008                	lw	a0,0(s0)
    if (child_pid == 0){
    10ba:	d169                	beqz	a0,107c <test_clone+0x5e>
	if(wait(&wstatus) == child_pid)
    10bc:	0068                	addi	a0,sp,12
    10be:	625000ef          	jal	ra,1ee2 <wait>
    10c2:	401c                	lw	a5,0(s0)
    10c4:	00f50963          	beq	a0,a5,10d6 <test_clone+0xb8>
	    printf("clone process error.\n");
    10c8:	00001517          	auipc	a0,0x1
    10cc:	ff850513          	addi	a0,a0,-8 # 20c0 <__clone+0xba>
    10d0:	248000ef          	jal	ra,1318 <printf>
    10d4:	b775                	j	1080 <test_clone+0x62>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10d6:	85aa                	mv	a1,a0
    10d8:	00001517          	auipc	a0,0x1
    10dc:	fc050513          	addi	a0,a0,-64 # 2098 <__clone+0x92>
    10e0:	238000ef          	jal	ra,1318 <printf>
    10e4:	bf71                	j	1080 <test_clone+0x62>

00000000000010e6 <main>:

int main(void){
    10e6:	1141                	addi	sp,sp,-16
    10e8:	e406                	sd	ra,8(sp)
    test_clone();
    10ea:	f35ff0ef          	jal	ra,101e <test_clone>
    return 0;
}
    10ee:	60a2                	ld	ra,8(sp)
    10f0:	4501                	li	a0,0
    10f2:	0141                	addi	sp,sp,16
    10f4:	8082                	ret

00000000000010f6 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10f6:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f8:	4108                	lw	a0,0(a0)
{
    10fa:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10fc:	05a1                	addi	a1,a1,8
{
    10fe:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1100:	fe7ff0ef          	jal	ra,10e6 <main>
    1104:	51b000ef          	jal	ra,1e1e <exit>
	return 0;
}
    1108:	60a2                	ld	ra,8(sp)
    110a:	4501                	li	a0,0
    110c:	0141                	addi	sp,sp,16
    110e:	8082                	ret

0000000000001110 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1110:	7179                	addi	sp,sp,-48
    1112:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1114:	12054e63          	bltz	a0,1250 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1118:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    111c:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    111e:	02b7f6bb          	remuw	a3,a5,a1
    1122:	00003717          	auipc	a4,0x3
    1126:	ffe70713          	addi	a4,a4,-2 # 4120 <digits>
    buf[16] = 0;
    112a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    112e:	1682                	slli	a3,a3,0x20
    1130:	9281                	srli	a3,a3,0x20
    1132:	96ba                	add	a3,a3,a4
    1134:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1138:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    113c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1140:	16b7e363          	bltu	a5,a1,12a6 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1144:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1148:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    114c:	1602                	slli	a2,a2,0x20
    114e:	9201                	srli	a2,a2,0x20
    1150:	963a                	add	a2,a2,a4
    1152:	00064603          	lbu	a2,0(a2)
    1156:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    115a:	0007861b          	sext.w	a2,a5
    115e:	12b6e863          	bltu	a3,a1,128e <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1162:	02b7f6bb          	remuw	a3,a5,a1
    1166:	1682                	slli	a3,a3,0x20
    1168:	9281                	srli	a3,a3,0x20
    116a:	96ba                	add	a3,a3,a4
    116c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1170:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1174:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1178:	10b66e63          	bltu	a2,a1,1294 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    117c:	02b876bb          	remuw	a3,a6,a1
    1180:	1682                	slli	a3,a3,0x20
    1182:	9281                	srli	a3,a3,0x20
    1184:	96ba                	add	a3,a3,a4
    1186:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1192:	10b86463          	bltu	a6,a1,129a <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1196:	02b676bb          	remuw	a3,a2,a1
    119a:	1682                	slli	a3,a3,0x20
    119c:	9281                	srli	a3,a3,0x20
    119e:	96ba                	add	a3,a3,a4
    11a0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a4:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11a8:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11ac:	0eb66a63          	bltu	a2,a1,12a0 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11b0:	02b876bb          	remuw	a3,a6,a1
    11b4:	1682                	slli	a3,a3,0x20
    11b6:	9281                	srli	a3,a3,0x20
    11b8:	96ba                	add	a3,a3,a4
    11ba:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11be:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c2:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11c6:	0cb86163          	bltu	a6,a1,1288 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11ca:	02b676bb          	remuw	a3,a2,a1
    11ce:	1682                	slli	a3,a3,0x20
    11d0:	9281                	srli	a3,a3,0x20
    11d2:	96ba                	add	a3,a3,a4
    11d4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d8:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11dc:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11e0:	0cb66563          	bltu	a2,a1,12aa <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11e4:	02b876bb          	remuw	a3,a6,a1
    11e8:	1682                	slli	a3,a3,0x20
    11ea:	9281                	srli	a3,a3,0x20
    11ec:	96ba                	add	a3,a3,a4
    11ee:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f2:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11f6:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11fa:	0ab86b63          	bltu	a6,a1,12b0 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11fe:	02b676bb          	remuw	a3,a2,a1
    1202:	1682                	slli	a3,a3,0x20
    1204:	9281                	srli	a3,a3,0x20
    1206:	96ba                	add	a3,a3,a4
    1208:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    120c:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1210:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1214:	0ab66163          	bltu	a2,a1,12b6 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1218:	1782                	slli	a5,a5,0x20
    121a:	9381                	srli	a5,a5,0x20
    121c:	97ba                	add	a5,a5,a4
    121e:	0007c703          	lbu	a4,0(a5)
    1222:	4599                	li	a1,6
    1224:	4795                	li	a5,5
    1226:	00e10723          	sb	a4,14(sp)

    if (sign)
    122a:	00055963          	bgez	a0,123c <printint.constprop.0+0x12c>
        buf[i--] = '-';
    122e:	1018                	addi	a4,sp,32
    1230:	973e                	add	a4,a4,a5
    1232:	02d00693          	li	a3,45
    1236:	fed70423          	sb	a3,-24(a4)
    123a:	85be                	mv	a1,a5
    write(f, s, l);
    123c:	003c                	addi	a5,sp,8
    123e:	4641                	li	a2,16
    1240:	9e0d                	subw	a2,a2,a1
    1242:	4505                	li	a0,1
    1244:	95be                	add	a1,a1,a5
    1246:	387000ef          	jal	ra,1dcc <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    124a:	70a2                	ld	ra,40(sp)
    124c:	6145                	addi	sp,sp,48
    124e:	8082                	ret
        x = -xx;
    1250:	40a0063b          	negw	a2,a0
    1254:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1256:	02b677bb          	remuw	a5,a2,a1
    125a:	00003717          	auipc	a4,0x3
    125e:	ec670713          	addi	a4,a4,-314 # 4120 <digits>
    buf[16] = 0;
    1262:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1266:	1782                	slli	a5,a5,0x20
    1268:	9381                	srli	a5,a5,0x20
    126a:	97ba                	add	a5,a5,a4
    126c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1270:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1274:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1278:	ecb676e3          	bleu	a1,a2,1144 <printint.constprop.0+0x34>
        buf[i--] = '-';
    127c:	02d00793          	li	a5,45
    1280:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1284:	45b9                	li	a1,14
    1286:	bf5d                	j	123c <printint.constprop.0+0x12c>
    1288:	47a5                	li	a5,9
    128a:	45a9                	li	a1,10
    128c:	bf79                	j	122a <printint.constprop.0+0x11a>
    128e:	47b5                	li	a5,13
    1290:	45b9                	li	a1,14
    1292:	bf61                	j	122a <printint.constprop.0+0x11a>
    1294:	47b1                	li	a5,12
    1296:	45b5                	li	a1,13
    1298:	bf49                	j	122a <printint.constprop.0+0x11a>
    129a:	47ad                	li	a5,11
    129c:	45b1                	li	a1,12
    129e:	b771                	j	122a <printint.constprop.0+0x11a>
    12a0:	47a9                	li	a5,10
    12a2:	45ad                	li	a1,11
    12a4:	b759                	j	122a <printint.constprop.0+0x11a>
    i = 15;
    12a6:	45bd                	li	a1,15
    12a8:	bf51                	j	123c <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12aa:	47a1                	li	a5,8
    12ac:	45a5                	li	a1,9
    12ae:	bfb5                	j	122a <printint.constprop.0+0x11a>
    12b0:	479d                	li	a5,7
    12b2:	45a1                	li	a1,8
    12b4:	bf9d                	j	122a <printint.constprop.0+0x11a>
    12b6:	4799                	li	a5,6
    12b8:	459d                	li	a1,7
    12ba:	bf85                	j	122a <printint.constprop.0+0x11a>

00000000000012bc <getchar>:
{
    12bc:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12be:	00f10593          	addi	a1,sp,15
    12c2:	4605                	li	a2,1
    12c4:	4501                	li	a0,0
{
    12c6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12cc:	2f7000ef          	jal	ra,1dc2 <read>
}
    12d0:	60e2                	ld	ra,24(sp)
    12d2:	00f14503          	lbu	a0,15(sp)
    12d6:	6105                	addi	sp,sp,32
    12d8:	8082                	ret

00000000000012da <putchar>:
{
    12da:	1101                	addi	sp,sp,-32
    char byte = c;
    12dc:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12e0:	00f10593          	addi	a1,sp,15
    12e4:	4605                	li	a2,1
    12e6:	4505                	li	a0,1
{
    12e8:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12ea:	2e3000ef          	jal	ra,1dcc <write>
}
    12ee:	60e2                	ld	ra,24(sp)
    12f0:	2501                	sext.w	a0,a0
    12f2:	6105                	addi	sp,sp,32
    12f4:	8082                	ret

00000000000012f6 <puts>:
{
    12f6:	1141                	addi	sp,sp,-16
    12f8:	e406                	sd	ra,8(sp)
    12fa:	e022                	sd	s0,0(sp)
    12fc:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12fe:	5b2000ef          	jal	ra,18b0 <strlen>
    1302:	862a                	mv	a2,a0
    1304:	85a2                	mv	a1,s0
    1306:	4505                	li	a0,1
    1308:	2c5000ef          	jal	ra,1dcc <write>
}
    130c:	60a2                	ld	ra,8(sp)
    130e:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1310:	957d                	srai	a0,a0,0x3f
    return r;
    1312:	2501                	sext.w	a0,a0
}
    1314:	0141                	addi	sp,sp,16
    1316:	8082                	ret

0000000000001318 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1318:	7131                	addi	sp,sp,-192
    131a:	e0da                	sd	s6,64(sp)
    131c:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    131e:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1320:	013c                	addi	a5,sp,136
{
    1322:	f0ca                	sd	s2,96(sp)
    1324:	ecce                	sd	s3,88(sp)
    1326:	e8d2                	sd	s4,80(sp)
    1328:	e4d6                	sd	s5,72(sp)
    132a:	fc5e                	sd	s7,56(sp)
    132c:	fc86                	sd	ra,120(sp)
    132e:	f8a2                	sd	s0,112(sp)
    1330:	f4a6                	sd	s1,104(sp)
    1332:	89aa                	mv	s3,a0
    1334:	e52e                	sd	a1,136(sp)
    1336:	e932                	sd	a2,144(sp)
    1338:	ed36                	sd	a3,152(sp)
    133a:	f13a                	sd	a4,160(sp)
    133c:	f942                	sd	a6,176(sp)
    133e:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1340:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1342:	02500913          	li	s2,37
    1346:	07000a93          	li	s5,112
    buf[i++] = '0';
    134a:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134e:	00003a17          	auipc	s4,0x3
    1352:	dd2a0a13          	addi	s4,s4,-558 # 4120 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1356:	00001b97          	auipc	s7,0x1
    135a:	d92b8b93          	addi	s7,s7,-622 # 20e8 <__clone+0xe2>
        if (!*s)
    135e:	0009c783          	lbu	a5,0(s3)
    1362:	cfb9                	beqz	a5,13c0 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1364:	23278d63          	beq	a5,s2,159e <printf+0x286>
    1368:	864e                	mv	a2,s3
    136a:	a019                	j	1370 <printf+0x58>
    136c:	07278563          	beq	a5,s2,13d6 <printf+0xbe>
    1370:	0605                	addi	a2,a2,1
    1372:	00064783          	lbu	a5,0(a2)
    1376:	fbfd                	bnez	a5,136c <printf+0x54>
    1378:	84b2                	mv	s1,a2
        l = z - a;
    137a:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    137e:	8622                	mv	a2,s0
    1380:	85ce                	mv	a1,s3
    1382:	4505                	li	a0,1
    1384:	249000ef          	jal	ra,1dcc <write>
        if (l)
    1388:	ec3d                	bnez	s0,1406 <printf+0xee>
        if (s[1] == 0)
    138a:	0014c783          	lbu	a5,1(s1)
    138e:	cb8d                	beqz	a5,13c0 <printf+0xa8>
        switch (s[1])
    1390:	09578b63          	beq	a5,s5,1426 <printf+0x10e>
    1394:	06fafb63          	bleu	a5,s5,140a <printf+0xf2>
    1398:	07300713          	li	a4,115
    139c:	1ce78e63          	beq	a5,a4,1578 <printf+0x260>
    13a0:	07800713          	li	a4,120
    13a4:	1ae79563          	bne	a5,a4,154e <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13a8:	6782                	ld	a5,0(sp)
    13aa:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13ac:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13b0:	4388                	lw	a0,0(a5)
    13b2:	07a1                	addi	a5,a5,8
    13b4:	e03e                	sd	a5,0(sp)
    13b6:	d5bff0ef          	jal	ra,1110 <printint.constprop.0>
        if (!*s)
    13ba:	0009c783          	lbu	a5,0(s3)
    13be:	f3dd                	bnez	a5,1364 <printf+0x4c>
    }
    va_end(ap);
}
    13c0:	70e6                	ld	ra,120(sp)
    13c2:	7446                	ld	s0,112(sp)
    13c4:	74a6                	ld	s1,104(sp)
    13c6:	7906                	ld	s2,96(sp)
    13c8:	69e6                	ld	s3,88(sp)
    13ca:	6a46                	ld	s4,80(sp)
    13cc:	6aa6                	ld	s5,72(sp)
    13ce:	6b06                	ld	s6,64(sp)
    13d0:	7be2                	ld	s7,56(sp)
    13d2:	6129                	addi	sp,sp,192
    13d4:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13d6:	00164783          	lbu	a5,1(a2)
    13da:	84b2                	mv	s1,a2
    13dc:	01278763          	beq	a5,s2,13ea <printf+0xd2>
    13e0:	bf69                	j	137a <printf+0x62>
    13e2:	0014c783          	lbu	a5,1(s1)
    13e6:	f9279ae3          	bne	a5,s2,137a <printf+0x62>
    13ea:	0489                	addi	s1,s1,2
    13ec:	0004c783          	lbu	a5,0(s1)
    13f0:	0605                	addi	a2,a2,1
    13f2:	ff2788e3          	beq	a5,s2,13e2 <printf+0xca>
        l = z - a;
    13f6:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13fa:	8622                	mv	a2,s0
    13fc:	85ce                	mv	a1,s3
    13fe:	4505                	li	a0,1
    1400:	1cd000ef          	jal	ra,1dcc <write>
        if (l)
    1404:	d059                	beqz	s0,138a <printf+0x72>
    1406:	89a6                	mv	s3,s1
    1408:	bf99                	j	135e <printf+0x46>
    140a:	06400713          	li	a4,100
    140e:	14e79063          	bne	a5,a4,154e <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1412:	6782                	ld	a5,0(sp)
    1414:	45a9                	li	a1,10
        s += 2;
    1416:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    141a:	4388                	lw	a0,0(a5)
    141c:	07a1                	addi	a5,a5,8
    141e:	e03e                	sd	a5,0(sp)
    1420:	cf1ff0ef          	jal	ra,1110 <printint.constprop.0>
        s += 2;
    1424:	bf59                	j	13ba <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1426:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1428:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    142c:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    142e:	631c                	ld	a5,0(a4)
    1430:	0721                	addi	a4,a4,8
    1432:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1434:	00479293          	slli	t0,a5,0x4
    1438:	00879f93          	slli	t6,a5,0x8
    143c:	00c79f13          	slli	t5,a5,0xc
    1440:	01079e93          	slli	t4,a5,0x10
    1444:	01479e13          	slli	t3,a5,0x14
    1448:	01879313          	slli	t1,a5,0x18
    144c:	01c79893          	slli	a7,a5,0x1c
    1450:	02479813          	slli	a6,a5,0x24
    1454:	02879513          	slli	a0,a5,0x28
    1458:	02c79593          	slli	a1,a5,0x2c
    145c:	03079693          	slli	a3,a5,0x30
    1460:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1464:	03c7d413          	srli	s0,a5,0x3c
    1468:	01c7d39b          	srliw	t2,a5,0x1c
    146c:	03c2d293          	srli	t0,t0,0x3c
    1470:	03cfdf93          	srli	t6,t6,0x3c
    1474:	03cf5f13          	srli	t5,t5,0x3c
    1478:	03cede93          	srli	t4,t4,0x3c
    147c:	03ce5e13          	srli	t3,t3,0x3c
    1480:	03c35313          	srli	t1,t1,0x3c
    1484:	03c8d893          	srli	a7,a7,0x3c
    1488:	03c85813          	srli	a6,a6,0x3c
    148c:	9171                	srli	a0,a0,0x3c
    148e:	91f1                	srli	a1,a1,0x3c
    1490:	92f1                	srli	a3,a3,0x3c
    1492:	9371                	srli	a4,a4,0x3c
    1494:	96d2                	add	a3,a3,s4
    1496:	9752                	add	a4,a4,s4
    1498:	9452                	add	s0,s0,s4
    149a:	92d2                	add	t0,t0,s4
    149c:	9fd2                	add	t6,t6,s4
    149e:	9f52                	add	t5,t5,s4
    14a0:	9ed2                	add	t4,t4,s4
    14a2:	9e52                	add	t3,t3,s4
    14a4:	9352                	add	t1,t1,s4
    14a6:	98d2                	add	a7,a7,s4
    14a8:	93d2                	add	t2,t2,s4
    14aa:	9852                	add	a6,a6,s4
    14ac:	9552                	add	a0,a0,s4
    14ae:	95d2                	add	a1,a1,s4
    14b0:	0006c983          	lbu	s3,0(a3)
    14b4:	0002c283          	lbu	t0,0(t0)
    14b8:	00074683          	lbu	a3,0(a4)
    14bc:	000fcf83          	lbu	t6,0(t6)
    14c0:	000f4f03          	lbu	t5,0(t5)
    14c4:	000ece83          	lbu	t4,0(t4)
    14c8:	000e4e03          	lbu	t3,0(t3)
    14cc:	00034303          	lbu	t1,0(t1)
    14d0:	0008c883          	lbu	a7,0(a7)
    14d4:	0003c383          	lbu	t2,0(t2)
    14d8:	00084803          	lbu	a6,0(a6)
    14dc:	00054503          	lbu	a0,0(a0)
    14e0:	0005c583          	lbu	a1,0(a1)
    14e4:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14e8:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ec:	9371                	srli	a4,a4,0x3c
    14ee:	8bbd                	andi	a5,a5,15
    14f0:	9752                	add	a4,a4,s4
    14f2:	97d2                	add	a5,a5,s4
    14f4:	005105a3          	sb	t0,11(sp)
    14f8:	01f10623          	sb	t6,12(sp)
    14fc:	01e106a3          	sb	t5,13(sp)
    1500:	01d10723          	sb	t4,14(sp)
    1504:	01c107a3          	sb	t3,15(sp)
    1508:	00610823          	sb	t1,16(sp)
    150c:	011108a3          	sb	a7,17(sp)
    1510:	00710923          	sb	t2,18(sp)
    1514:	010109a3          	sb	a6,19(sp)
    1518:	00a10a23          	sb	a0,20(sp)
    151c:	00b10aa3          	sb	a1,21(sp)
    1520:	01310b23          	sb	s3,22(sp)
    1524:	00d10ba3          	sb	a3,23(sp)
    1528:	00810523          	sb	s0,10(sp)
    152c:	00074703          	lbu	a4,0(a4)
    1530:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1534:	002c                	addi	a1,sp,8
    1536:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1538:	00e10c23          	sb	a4,24(sp)
    153c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1540:	00010d23          	sb	zero,26(sp)
        s += 2;
    1544:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1548:	085000ef          	jal	ra,1dcc <write>
        s += 2;
    154c:	b5bd                	j	13ba <printf+0xa2>
    char byte = c;
    154e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1552:	4605                	li	a2,1
    1554:	002c                	addi	a1,sp,8
    1556:	4505                	li	a0,1
    char byte = c;
    1558:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    155c:	071000ef          	jal	ra,1dcc <write>
    char byte = c;
    1560:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1564:	4605                	li	a2,1
    1566:	002c                	addi	a1,sp,8
    1568:	4505                	li	a0,1
    char byte = c;
    156a:	00f10423          	sb	a5,8(sp)
        s += 2;
    156e:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1572:	05b000ef          	jal	ra,1dcc <write>
        s += 2;
    1576:	b591                	j	13ba <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1578:	6782                	ld	a5,0(sp)
    157a:	6380                	ld	s0,0(a5)
    157c:	07a1                	addi	a5,a5,8
    157e:	e03e                	sd	a5,0(sp)
    1580:	cc05                	beqz	s0,15b8 <printf+0x2a0>
            l = strnlen(a, 200);
    1582:	0c800593          	li	a1,200
    1586:	8522                	mv	a0,s0
    1588:	45a000ef          	jal	ra,19e2 <strnlen>
    write(f, s, l);
    158c:	0005061b          	sext.w	a2,a0
    1590:	85a2                	mv	a1,s0
    1592:	4505                	li	a0,1
    1594:	039000ef          	jal	ra,1dcc <write>
        s += 2;
    1598:	00248993          	addi	s3,s1,2
    159c:	bd39                	j	13ba <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    159e:	0019c783          	lbu	a5,1(s3)
    15a2:	84ce                	mv	s1,s3
    15a4:	864e                	mv	a2,s3
    15a6:	e52782e3          	beq	a5,s2,13ea <printf+0xd2>
    write(f, s, l);
    15aa:	4601                	li	a2,0
    15ac:	85ce                	mv	a1,s3
    15ae:	4505                	li	a0,1
    15b0:	01d000ef          	jal	ra,1dcc <write>
    15b4:	84ce                	mv	s1,s3
    15b6:	bbd1                	j	138a <printf+0x72>
                a = "(null)";
    15b8:	845e                	mv	s0,s7
    15ba:	b7e1                	j	1582 <printf+0x26a>

00000000000015bc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15bc:	1141                	addi	sp,sp,-16
    15be:	e406                	sd	ra,8(sp)
    puts(m);
    15c0:	d37ff0ef          	jal	ra,12f6 <puts>
    exit(-100);
}
    15c4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c6:	f9c00513          	li	a0,-100
}
    15ca:	0141                	addi	sp,sp,16
    exit(-100);
    15cc:	0530006f          	j	1e1e <exit>

00000000000015d0 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d0:	02000793          	li	a5,32
    15d4:	00f50663          	beq	a0,a5,15e0 <isspace+0x10>
    15d8:	355d                	addiw	a0,a0,-9
    15da:	00553513          	sltiu	a0,a0,5
    15de:	8082                	ret
    15e0:	4505                	li	a0,1
}
    15e2:	8082                	ret

00000000000015e4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e4:	fd05051b          	addiw	a0,a0,-48
}
    15e8:	00a53513          	sltiu	a0,a0,10
    15ec:	8082                	ret

00000000000015ee <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ee:	02000613          	li	a2,32
    15f2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f4:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	0007079b          	sext.w	a5,a4
    15fc:	ff77869b          	addiw	a3,a5,-9
    1600:	04c70b63          	beq	a4,a2,1656 <atoi+0x68>
    1604:	04d5f963          	bleu	a3,a1,1656 <atoi+0x68>
        s++;
    switch (*s)
    1608:	02b00693          	li	a3,43
    160c:	04d70a63          	beq	a4,a3,1660 <atoi+0x72>
    1610:	02d00693          	li	a3,45
    1614:	06d70463          	beq	a4,a3,167c <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1618:	fd07859b          	addiw	a1,a5,-48
    161c:	4625                	li	a2,9
    161e:	873e                	mv	a4,a5
    1620:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1622:	4e01                	li	t3,0
    while (isdigit(*s))
    1624:	04b66a63          	bltu	a2,a1,1678 <atoi+0x8a>
    int n = 0, neg = 0;
    1628:	4501                	li	a0,0
    while (isdigit(*s))
    162a:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    162c:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    162e:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1632:	0025179b          	slliw	a5,a0,0x2
    1636:	9d3d                	addw	a0,a0,a5
    1638:	fd07031b          	addiw	t1,a4,-48
    163c:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1640:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1644:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1648:	0006071b          	sext.w	a4,a2
    164c:	feb870e3          	bleu	a1,a6,162c <atoi+0x3e>
    return neg ? n : -n;
    1650:	000e0563          	beqz	t3,165a <atoi+0x6c>
}
    1654:	8082                	ret
        s++;
    1656:	0505                	addi	a0,a0,1
    1658:	bf71                	j	15f4 <atoi+0x6>
    165a:	4113053b          	subw	a0,t1,a7
    165e:	8082                	ret
    while (isdigit(*s))
    1660:	00154783          	lbu	a5,1(a0)
    1664:	4625                	li	a2,9
        s++;
    1666:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    166a:	fd07859b          	addiw	a1,a5,-48
    166e:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1672:	4e01                	li	t3,0
    while (isdigit(*s))
    1674:	fab67ae3          	bleu	a1,a2,1628 <atoi+0x3a>
    1678:	4501                	li	a0,0
}
    167a:	8082                	ret
    while (isdigit(*s))
    167c:	00154783          	lbu	a5,1(a0)
    1680:	4625                	li	a2,9
        s++;
    1682:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1686:	fd07859b          	addiw	a1,a5,-48
    168a:	0007871b          	sext.w	a4,a5
    168e:	feb665e3          	bltu	a2,a1,1678 <atoi+0x8a>
        neg = 1;
    1692:	4e05                	li	t3,1
    1694:	bf51                	j	1628 <atoi+0x3a>

0000000000001696 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1696:	16060d63          	beqz	a2,1810 <memset+0x17a>
    169a:	40a007b3          	neg	a5,a0
    169e:	8b9d                	andi	a5,a5,7
    16a0:	00778713          	addi	a4,a5,7
    16a4:	482d                	li	a6,11
    16a6:	0ff5f593          	andi	a1,a1,255
    16aa:	fff60693          	addi	a3,a2,-1
    16ae:	17076263          	bltu	a4,a6,1812 <memset+0x17c>
    16b2:	16e6ea63          	bltu	a3,a4,1826 <memset+0x190>
    16b6:	16078563          	beqz	a5,1820 <memset+0x18a>
    16ba:	00b50023          	sb	a1,0(a0)
    16be:	4705                	li	a4,1
    16c0:	00150e93          	addi	t4,a0,1
    16c4:	14e78c63          	beq	a5,a4,181c <memset+0x186>
    16c8:	00b500a3          	sb	a1,1(a0)
    16cc:	4709                	li	a4,2
    16ce:	00250e93          	addi	t4,a0,2
    16d2:	14e78d63          	beq	a5,a4,182c <memset+0x196>
    16d6:	00b50123          	sb	a1,2(a0)
    16da:	470d                	li	a4,3
    16dc:	00350e93          	addi	t4,a0,3
    16e0:	12e78b63          	beq	a5,a4,1816 <memset+0x180>
    16e4:	00b501a3          	sb	a1,3(a0)
    16e8:	4711                	li	a4,4
    16ea:	00450e93          	addi	t4,a0,4
    16ee:	14e78163          	beq	a5,a4,1830 <memset+0x19a>
    16f2:	00b50223          	sb	a1,4(a0)
    16f6:	4715                	li	a4,5
    16f8:	00550e93          	addi	t4,a0,5
    16fc:	12e78c63          	beq	a5,a4,1834 <memset+0x19e>
    1700:	00b502a3          	sb	a1,5(a0)
    1704:	471d                	li	a4,7
    1706:	00650e93          	addi	t4,a0,6
    170a:	12e79763          	bne	a5,a4,1838 <memset+0x1a2>
    170e:	00750e93          	addi	t4,a0,7
    1712:	00b50323          	sb	a1,6(a0)
    1716:	4f1d                	li	t5,7
    1718:	00859713          	slli	a4,a1,0x8
    171c:	8f4d                	or	a4,a4,a1
    171e:	01059e13          	slli	t3,a1,0x10
    1722:	01c76e33          	or	t3,a4,t3
    1726:	01859313          	slli	t1,a1,0x18
    172a:	006e6333          	or	t1,t3,t1
    172e:	02059893          	slli	a7,a1,0x20
    1732:	011368b3          	or	a7,t1,a7
    1736:	02859813          	slli	a6,a1,0x28
    173a:	40f60333          	sub	t1,a2,a5
    173e:	0108e833          	or	a6,a7,a6
    1742:	03059693          	slli	a3,a1,0x30
    1746:	00d866b3          	or	a3,a6,a3
    174a:	03859713          	slli	a4,a1,0x38
    174e:	97aa                	add	a5,a5,a0
    1750:	ff837813          	andi	a6,t1,-8
    1754:	8f55                	or	a4,a4,a3
    1756:	00f806b3          	add	a3,a6,a5
    175a:	e398                	sd	a4,0(a5)
    175c:	07a1                	addi	a5,a5,8
    175e:	fed79ee3          	bne	a5,a3,175a <memset+0xc4>
    1762:	ff837693          	andi	a3,t1,-8
    1766:	00de87b3          	add	a5,t4,a3
    176a:	01e6873b          	addw	a4,a3,t5
    176e:	0ad30663          	beq	t1,a3,181a <memset+0x184>
    1772:	00b78023          	sb	a1,0(a5)
    1776:	0017069b          	addiw	a3,a4,1
    177a:	08c6fb63          	bleu	a2,a3,1810 <memset+0x17a>
    177e:	00b780a3          	sb	a1,1(a5)
    1782:	0027069b          	addiw	a3,a4,2
    1786:	08c6f563          	bleu	a2,a3,1810 <memset+0x17a>
    178a:	00b78123          	sb	a1,2(a5)
    178e:	0037069b          	addiw	a3,a4,3
    1792:	06c6ff63          	bleu	a2,a3,1810 <memset+0x17a>
    1796:	00b781a3          	sb	a1,3(a5)
    179a:	0047069b          	addiw	a3,a4,4
    179e:	06c6f963          	bleu	a2,a3,1810 <memset+0x17a>
    17a2:	00b78223          	sb	a1,4(a5)
    17a6:	0057069b          	addiw	a3,a4,5
    17aa:	06c6f363          	bleu	a2,a3,1810 <memset+0x17a>
    17ae:	00b782a3          	sb	a1,5(a5)
    17b2:	0067069b          	addiw	a3,a4,6
    17b6:	04c6fd63          	bleu	a2,a3,1810 <memset+0x17a>
    17ba:	00b78323          	sb	a1,6(a5)
    17be:	0077069b          	addiw	a3,a4,7
    17c2:	04c6f763          	bleu	a2,a3,1810 <memset+0x17a>
    17c6:	00b783a3          	sb	a1,7(a5)
    17ca:	0087069b          	addiw	a3,a4,8
    17ce:	04c6f163          	bleu	a2,a3,1810 <memset+0x17a>
    17d2:	00b78423          	sb	a1,8(a5)
    17d6:	0097069b          	addiw	a3,a4,9
    17da:	02c6fb63          	bleu	a2,a3,1810 <memset+0x17a>
    17de:	00b784a3          	sb	a1,9(a5)
    17e2:	00a7069b          	addiw	a3,a4,10
    17e6:	02c6f563          	bleu	a2,a3,1810 <memset+0x17a>
    17ea:	00b78523          	sb	a1,10(a5)
    17ee:	00b7069b          	addiw	a3,a4,11
    17f2:	00c6ff63          	bleu	a2,a3,1810 <memset+0x17a>
    17f6:	00b785a3          	sb	a1,11(a5)
    17fa:	00c7069b          	addiw	a3,a4,12
    17fe:	00c6f963          	bleu	a2,a3,1810 <memset+0x17a>
    1802:	00b78623          	sb	a1,12(a5)
    1806:	2735                	addiw	a4,a4,13
    1808:	00c77463          	bleu	a2,a4,1810 <memset+0x17a>
    180c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1810:	8082                	ret
    1812:	472d                	li	a4,11
    1814:	bd79                	j	16b2 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1816:	4f0d                	li	t5,3
    1818:	b701                	j	1718 <memset+0x82>
    181a:	8082                	ret
    181c:	4f05                	li	t5,1
    181e:	bded                	j	1718 <memset+0x82>
    1820:	8eaa                	mv	t4,a0
    1822:	4f01                	li	t5,0
    1824:	bdd5                	j	1718 <memset+0x82>
    1826:	87aa                	mv	a5,a0
    1828:	4701                	li	a4,0
    182a:	b7a1                	j	1772 <memset+0xdc>
    182c:	4f09                	li	t5,2
    182e:	b5ed                	j	1718 <memset+0x82>
    1830:	4f11                	li	t5,4
    1832:	b5dd                	j	1718 <memset+0x82>
    1834:	4f15                	li	t5,5
    1836:	b5cd                	j	1718 <memset+0x82>
    1838:	4f19                	li	t5,6
    183a:	bdf9                	j	1718 <memset+0x82>

000000000000183c <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    183c:	00054703          	lbu	a4,0(a0)
    1840:	0005c783          	lbu	a5,0(a1)
    1844:	00e79b63          	bne	a5,a4,185a <strcmp+0x1e>
    1848:	cf89                	beqz	a5,1862 <strcmp+0x26>
    184a:	0505                	addi	a0,a0,1
    184c:	0585                	addi	a1,a1,1
    184e:	0005c783          	lbu	a5,0(a1)
    1852:	00054703          	lbu	a4,0(a0)
    1856:	fef709e3          	beq	a4,a5,1848 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    185a:	0007051b          	sext.w	a0,a4
}
    185e:	9d1d                	subw	a0,a0,a5
    1860:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1862:	4501                	li	a0,0
}
    1864:	9d1d                	subw	a0,a0,a5
    1866:	8082                	ret

0000000000001868 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1868:	c231                	beqz	a2,18ac <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186a:	00054783          	lbu	a5,0(a0)
    186e:	0005c683          	lbu	a3,0(a1)
    1872:	c795                	beqz	a5,189e <strncmp+0x36>
    1874:	ca85                	beqz	a3,18a4 <strncmp+0x3c>
    if (!n--)
    1876:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1878:	c615                	beqz	a2,18a4 <strncmp+0x3c>
    187a:	00150713          	addi	a4,a0,1
    187e:	9532                	add	a0,a0,a2
    1880:	00d78963          	beq	a5,a3,1892 <strncmp+0x2a>
    1884:	a005                	j	18a4 <strncmp+0x3c>
    1886:	ce99                	beqz	a3,18a4 <strncmp+0x3c>
    1888:	00e50e63          	beq	a0,a4,18a4 <strncmp+0x3c>
    188c:	0705                	addi	a4,a4,1
    188e:	00d79b63          	bne	a5,a3,18a4 <strncmp+0x3c>
    1892:	00074783          	lbu	a5,0(a4)
    1896:	0585                	addi	a1,a1,1
    1898:	0005c683          	lbu	a3,0(a1)
    189c:	f7ed                	bnez	a5,1886 <strncmp+0x1e>
    189e:	4501                	li	a0,0
        ;
    return *l - *r;
    18a0:	9d15                	subw	a0,a0,a3
    18a2:	8082                	ret
    18a4:	0007851b          	sext.w	a0,a5
    18a8:	9d15                	subw	a0,a0,a3
    18aa:	8082                	ret
        return 0;
    18ac:	4501                	li	a0,0
}
    18ae:	8082                	ret

00000000000018b0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18b0:	00757793          	andi	a5,a0,7
    18b4:	cfa1                	beqz	a5,190c <strlen+0x5c>
        if (!*s)
    18b6:	00054783          	lbu	a5,0(a0)
    18ba:	cbb9                	beqz	a5,1910 <strlen+0x60>
    18bc:	87aa                	mv	a5,a0
    18be:	a021                	j	18c6 <strlen+0x16>
    18c0:	0007c703          	lbu	a4,0(a5)
    18c4:	c329                	beqz	a4,1906 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18c6:	0785                	addi	a5,a5,1
    18c8:	0077f713          	andi	a4,a5,7
    18cc:	fb75                	bnez	a4,18c0 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ce:	00001717          	auipc	a4,0x1
    18d2:	82270713          	addi	a4,a4,-2014 # 20f0 <__clone+0xea>
    18d6:	630c                	ld	a1,0(a4)
    18d8:	00001717          	auipc	a4,0x1
    18dc:	82070713          	addi	a4,a4,-2016 # 20f8 <__clone+0xf2>
    18e0:	6394                	ld	a3,0(a5)
    18e2:	6310                	ld	a2,0(a4)
    18e4:	a019                	j	18ea <strlen+0x3a>
    18e6:	07a1                	addi	a5,a5,8
    18e8:	6394                	ld	a3,0(a5)
    18ea:	00b68733          	add	a4,a3,a1
    18ee:	fff6c693          	not	a3,a3
    18f2:	8f75                	and	a4,a4,a3
    18f4:	8f71                	and	a4,a4,a2
    18f6:	db65                	beqz	a4,18e6 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	c709                	beqz	a4,1906 <strlen+0x56>
    18fe:	0785                	addi	a5,a5,1
    1900:	0007c703          	lbu	a4,0(a5)
    1904:	ff6d                	bnez	a4,18fe <strlen+0x4e>
        ;
    return s - a;
    1906:	40a78533          	sub	a0,a5,a0
}
    190a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    190c:	87aa                	mv	a5,a0
    190e:	b7c1                	j	18ce <strlen+0x1e>
        if (!*s)
    1910:	4501                	li	a0,0
            return s - a;
    1912:	8082                	ret

0000000000001914 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1914:	00757793          	andi	a5,a0,7
    1918:	0ff5f593          	andi	a1,a1,255
    191c:	cb99                	beqz	a5,1932 <memchr+0x1e>
    191e:	c655                	beqz	a2,19ca <memchr+0xb6>
    1920:	00054783          	lbu	a5,0(a0)
    1924:	0ab78663          	beq	a5,a1,19d0 <memchr+0xbc>
    1928:	0505                	addi	a0,a0,1
    192a:	00757793          	andi	a5,a0,7
    192e:	167d                	addi	a2,a2,-1
    1930:	f7fd                	bnez	a5,191e <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1932:	4701                	li	a4,0
    if (n && *s != c)
    1934:	ca49                	beqz	a2,19c6 <memchr+0xb2>
    1936:	00054783          	lbu	a5,0(a0)
    193a:	08b78b63          	beq	a5,a1,19d0 <memchr+0xbc>
        size_t k = ONES * c;
    193e:	00000797          	auipc	a5,0x0
    1942:	7c278793          	addi	a5,a5,1986 # 2100 <__clone+0xfa>
    1946:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1948:	479d                	li	a5,7
        size_t k = ONES * c;
    194a:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    194e:	08c7f863          	bleu	a2,a5,19de <memchr+0xca>
    1952:	611c                	ld	a5,0(a0)
    1954:	00000317          	auipc	t1,0x0
    1958:	7a430313          	addi	t1,t1,1956 # 20f8 <__clone+0xf2>
    195c:	00033803          	ld	a6,0(t1)
    1960:	00f8c7b3          	xor	a5,a7,a5
    1964:	fff7c713          	not	a4,a5
    1968:	8f95                	sub	a5,a5,a3
    196a:	8ff9                	and	a5,a5,a4
    196c:	0107f7b3          	and	a5,a5,a6
    1970:	e7bd                	bnez	a5,19de <memchr+0xca>
    1972:	4e1d                	li	t3,7
    1974:	00000e97          	auipc	t4,0x0
    1978:	77ce8e93          	addi	t4,t4,1916 # 20f0 <__clone+0xea>
    197c:	a005                	j	199c <memchr+0x88>
    197e:	6514                	ld	a3,8(a0)
    1980:	000eb783          	ld	a5,0(t4)
    1984:	00033803          	ld	a6,0(t1)
    1988:	00d8c6b3          	xor	a3,a7,a3
    198c:	97b6                	add	a5,a5,a3
    198e:	fff6c693          	not	a3,a3
    1992:	8ff5                	and	a5,a5,a3
    1994:	0107f7b3          	and	a5,a5,a6
    1998:	e3a1                	bnez	a5,19d8 <memchr+0xc4>
    199a:	853a                	mv	a0,a4
    199c:	1661                	addi	a2,a2,-8
    199e:	00850713          	addi	a4,a0,8
    19a2:	fcce6ee3          	bltu	t3,a2,197e <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19a6:	c215                	beqz	a2,19ca <memchr+0xb6>
    19a8:	00074783          	lbu	a5,0(a4)
    19ac:	00f58d63          	beq	a1,a5,19c6 <memchr+0xb2>
    19b0:	00170793          	addi	a5,a4,1
    19b4:	963a                	add	a2,a2,a4
    19b6:	873e                	mv	a4,a5
    19b8:	00f60963          	beq	a2,a5,19ca <memchr+0xb6>
    19bc:	0007c683          	lbu	a3,0(a5)
    19c0:	0785                	addi	a5,a5,1
    19c2:	feb69ae3          	bne	a3,a1,19b6 <memchr+0xa2>
}
    19c6:	853a                	mv	a0,a4
    19c8:	8082                	ret
    return n ? (void *)s : 0;
    19ca:	4701                	li	a4,0
}
    19cc:	853a                	mv	a0,a4
    19ce:	8082                	ret
    19d0:	872a                	mv	a4,a0
    19d2:	00074783          	lbu	a5,0(a4)
    19d6:	bfd9                	j	19ac <memchr+0x98>
    19d8:	00854783          	lbu	a5,8(a0)
    19dc:	bfc1                	j	19ac <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19de:	872a                	mv	a4,a0
    19e0:	bfc1                	j	19b0 <memchr+0x9c>

00000000000019e2 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19e2:	00757793          	andi	a5,a0,7
    19e6:	cfc5                	beqz	a5,1a9e <strnlen+0xbc>
    19e8:	c1c5                	beqz	a1,1a88 <strnlen+0xa6>
    19ea:	00054783          	lbu	a5,0(a0)
    19ee:	cfd9                	beqz	a5,1a8c <strnlen+0xaa>
    19f0:	87ae                	mv	a5,a1
    19f2:	86aa                	mv	a3,a0
    19f4:	a029                	j	19fe <strnlen+0x1c>
    19f6:	cbc9                	beqz	a5,1a88 <strnlen+0xa6>
    19f8:	0006c703          	lbu	a4,0(a3)
    19fc:	cb51                	beqz	a4,1a90 <strnlen+0xae>
    19fe:	0685                	addi	a3,a3,1
    1a00:	0076f713          	andi	a4,a3,7
    1a04:	17fd                	addi	a5,a5,-1
    1a06:	fb65                	bnez	a4,19f6 <strnlen+0x14>
    if (n && *s != c)
    1a08:	c3c1                	beqz	a5,1a88 <strnlen+0xa6>
    1a0a:	0006c703          	lbu	a4,0(a3)
    1a0e:	c349                	beqz	a4,1a90 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a10:	471d                	li	a4,7
    1a12:	08f77a63          	bleu	a5,a4,1aa6 <strnlen+0xc4>
    1a16:	00000e17          	auipc	t3,0x0
    1a1a:	6dae0e13          	addi	t3,t3,1754 # 20f0 <__clone+0xea>
    1a1e:	6290                	ld	a2,0(a3)
    1a20:	000e3703          	ld	a4,0(t3)
    1a24:	00000e97          	auipc	t4,0x0
    1a28:	6d4e8e93          	addi	t4,t4,1748 # 20f8 <__clone+0xf2>
    1a2c:	000eb803          	ld	a6,0(t4)
    1a30:	9732                	add	a4,a4,a2
    1a32:	fff64613          	not	a2,a2
    1a36:	8f71                	and	a4,a4,a2
    1a38:	01077733          	and	a4,a4,a6
    1a3c:	e72d                	bnez	a4,1aa6 <strnlen+0xc4>
    1a3e:	4f1d                	li	t5,7
    1a40:	a839                	j	1a5e <strnlen+0x7c>
    1a42:	6698                	ld	a4,8(a3)
    1a44:	000e3303          	ld	t1,0(t3)
    1a48:	000eb803          	ld	a6,0(t4)
    1a4c:	fff74893          	not	a7,a4
    1a50:	971a                	add	a4,a4,t1
    1a52:	01177733          	and	a4,a4,a7
    1a56:	01077733          	and	a4,a4,a6
    1a5a:	ef1d                	bnez	a4,1a98 <strnlen+0xb6>
    1a5c:	86b2                	mv	a3,a2
    1a5e:	17e1                	addi	a5,a5,-8
    1a60:	00868613          	addi	a2,a3,8
    1a64:	fcff6fe3          	bltu	t5,a5,1a42 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a68:	c385                	beqz	a5,1a88 <strnlen+0xa6>
    1a6a:	00064703          	lbu	a4,0(a2)
    1a6e:	cb19                	beqz	a4,1a84 <strnlen+0xa2>
    1a70:	00160713          	addi	a4,a2,1
    1a74:	97b2                	add	a5,a5,a2
    1a76:	863a                	mv	a2,a4
    1a78:	00e78863          	beq	a5,a4,1a88 <strnlen+0xa6>
    1a7c:	0705                	addi	a4,a4,1
    1a7e:	fff74683          	lbu	a3,-1(a4)
    1a82:	faf5                	bnez	a3,1a76 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a84:	40a605b3          	sub	a1,a2,a0
}
    1a88:	852e                	mv	a0,a1
    1a8a:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a8c:	87ae                	mv	a5,a1
    1a8e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a90:	8636                	mv	a2,a3
    1a92:	00064703          	lbu	a4,0(a2)
    1a96:	bfe1                	j	1a6e <strnlen+0x8c>
    1a98:	0086c703          	lbu	a4,8(a3)
    1a9c:	bfc9                	j	1a6e <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a9e:	87ae                	mv	a5,a1
    1aa0:	86aa                	mv	a3,a0
    if (n && *s != c)
    1aa2:	f7a5                	bnez	a5,1a0a <strnlen+0x28>
    1aa4:	b7d5                	j	1a88 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa6:	8636                	mv	a2,a3
    1aa8:	b7e1                	j	1a70 <strnlen+0x8e>

0000000000001aaa <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1aaa:	00b547b3          	xor	a5,a0,a1
    1aae:	8b9d                	andi	a5,a5,7
    1ab0:	efa9                	bnez	a5,1b0a <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ab2:	0075f793          	andi	a5,a1,7
    1ab6:	c38d                	beqz	a5,1ad8 <strcpy+0x2e>
            if (!(*d = *s))
    1ab8:	0005c783          	lbu	a5,0(a1)
    1abc:	00f50023          	sb	a5,0(a0)
    1ac0:	e799                	bnez	a5,1ace <strcpy+0x24>
    1ac2:	a095                	j	1b26 <strcpy+0x7c>
    1ac4:	0005c783          	lbu	a5,0(a1)
    1ac8:	00f50023          	sb	a5,0(a0)
    1acc:	cbb9                	beqz	a5,1b22 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1ace:	0585                	addi	a1,a1,1
    1ad0:	0075f793          	andi	a5,a1,7
    1ad4:	0505                	addi	a0,a0,1
    1ad6:	f7fd                	bnez	a5,1ac4 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ad8:	00000797          	auipc	a5,0x0
    1adc:	61878793          	addi	a5,a5,1560 # 20f0 <__clone+0xea>
    1ae0:	0007b803          	ld	a6,0(a5)
    1ae4:	00000797          	auipc	a5,0x0
    1ae8:	61478793          	addi	a5,a5,1556 # 20f8 <__clone+0xf2>
    1aec:	6198                	ld	a4,0(a1)
    1aee:	6390                	ld	a2,0(a5)
    1af0:	a031                	j	1afc <strcpy+0x52>
    1af2:	0521                	addi	a0,a0,8
    1af4:	05a1                	addi	a1,a1,8
    1af6:	fee53c23          	sd	a4,-8(a0)
    1afa:	6198                	ld	a4,0(a1)
    1afc:	010707b3          	add	a5,a4,a6
    1b00:	fff74693          	not	a3,a4
    1b04:	8ff5                	and	a5,a5,a3
    1b06:	8ff1                	and	a5,a5,a2
    1b08:	d7ed                	beqz	a5,1af2 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b0a:	0005c783          	lbu	a5,0(a1)
    1b0e:	00f50023          	sb	a5,0(a0)
    1b12:	cb89                	beqz	a5,1b24 <strcpy+0x7a>
    1b14:	0585                	addi	a1,a1,1
    1b16:	0005c783          	lbu	a5,0(a1)
    1b1a:	0505                	addi	a0,a0,1
    1b1c:	00f50023          	sb	a5,0(a0)
    1b20:	fbf5                	bnez	a5,1b14 <strcpy+0x6a>
        ;
    return d;
}
    1b22:	8082                	ret
    1b24:	8082                	ret
    1b26:	8082                	ret

0000000000001b28 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b28:	00b547b3          	xor	a5,a0,a1
    1b2c:	8b9d                	andi	a5,a5,7
    1b2e:	ebc1                	bnez	a5,1bbe <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b30:	0075f793          	andi	a5,a1,7
    1b34:	cf91                	beqz	a5,1b50 <strncpy+0x28>
    1b36:	20060e63          	beqz	a2,1d52 <strncpy+0x22a>
    1b3a:	0005c783          	lbu	a5,0(a1)
    1b3e:	00f50023          	sb	a5,0(a0)
    1b42:	c3d5                	beqz	a5,1be6 <strncpy+0xbe>
    1b44:	0585                	addi	a1,a1,1
    1b46:	0075f793          	andi	a5,a1,7
    1b4a:	167d                	addi	a2,a2,-1
    1b4c:	0505                	addi	a0,a0,1
    1b4e:	f7e5                	bnez	a5,1b36 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b50:	20060163          	beqz	a2,1d52 <strncpy+0x22a>
    1b54:	0005c683          	lbu	a3,0(a1)
    1b58:	c6d9                	beqz	a3,1be6 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b5a:	479d                	li	a5,7
    1b5c:	22c7f563          	bleu	a2,a5,1d86 <strncpy+0x25e>
    1b60:	00000317          	auipc	t1,0x0
    1b64:	59030313          	addi	t1,t1,1424 # 20f0 <__clone+0xea>
    1b68:	6198                	ld	a4,0(a1)
    1b6a:	00033783          	ld	a5,0(t1)
    1b6e:	00000e17          	auipc	t3,0x0
    1b72:	58ae0e13          	addi	t3,t3,1418 # 20f8 <__clone+0xf2>
    1b76:	000e3803          	ld	a6,0(t3)
    1b7a:	97ba                	add	a5,a5,a4
    1b7c:	fff74893          	not	a7,a4
    1b80:	0117f7b3          	and	a5,a5,a7
    1b84:	0107f7b3          	and	a5,a5,a6
    1b88:	1e079f63          	bnez	a5,1d86 <strncpy+0x25e>
    1b8c:	4e9d                	li	t4,7
    1b8e:	a005                	j	1bae <strncpy+0x86>
    1b90:	6598                	ld	a4,8(a1)
    1b92:	00033783          	ld	a5,0(t1)
    1b96:	000e3803          	ld	a6,0(t3)
    1b9a:	fff74893          	not	a7,a4
    1b9e:	97ba                	add	a5,a5,a4
    1ba0:	0117f7b3          	and	a5,a5,a7
    1ba4:	0107f7b3          	and	a5,a5,a6
    1ba8:	1a079f63          	bnez	a5,1d66 <strncpy+0x23e>
    1bac:	85b6                	mv	a1,a3
            *wd = *ws;
    1bae:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb0:	1661                	addi	a2,a2,-8
    1bb2:	00858693          	addi	a3,a1,8
    1bb6:	0521                	addi	a0,a0,8
    1bb8:	fcceece3          	bltu	t4,a2,1b90 <strncpy+0x68>
    1bbc:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bbe:	18060a63          	beqz	a2,1d52 <strncpy+0x22a>
    1bc2:	0005c783          	lbu	a5,0(a1)
    1bc6:	872a                	mv	a4,a0
    1bc8:	00f50023          	sb	a5,0(a0)
    1bcc:	e799                	bnez	a5,1bda <strncpy+0xb2>
    1bce:	a829                	j	1be8 <strncpy+0xc0>
    1bd0:	0005c783          	lbu	a5,0(a1)
    1bd4:	00f70023          	sb	a5,0(a4)
    1bd8:	cb81                	beqz	a5,1be8 <strncpy+0xc0>
    1bda:	167d                	addi	a2,a2,-1
    1bdc:	0585                	addi	a1,a1,1
    1bde:	0705                	addi	a4,a4,1
    1be0:	fa65                	bnez	a2,1bd0 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1be2:	853a                	mv	a0,a4
    1be4:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1be6:	872a                	mv	a4,a0
    1be8:	4805                	li	a6,1
    1bea:	14061c63          	bnez	a2,1d42 <strncpy+0x21a>
    1bee:	40e007b3          	neg	a5,a4
    1bf2:	8b9d                	andi	a5,a5,7
    1bf4:	4581                	li	a1,0
    1bf6:	12061e63          	bnez	a2,1d32 <strncpy+0x20a>
    1bfa:	00778693          	addi	a3,a5,7
    1bfe:	452d                	li	a0,11
    1c00:	12a6e763          	bltu	a3,a0,1d2e <strncpy+0x206>
    1c04:	16d5e663          	bltu	a1,a3,1d70 <strncpy+0x248>
    1c08:	14078c63          	beqz	a5,1d60 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0c:	00070023          	sb	zero,0(a4)
    1c10:	4585                	li	a1,1
    1c12:	00170693          	addi	a3,a4,1
    1c16:	14b78363          	beq	a5,a1,1d5c <strncpy+0x234>
    1c1a:	000700a3          	sb	zero,1(a4)
    1c1e:	4589                	li	a1,2
    1c20:	00270693          	addi	a3,a4,2
    1c24:	14b78963          	beq	a5,a1,1d76 <strncpy+0x24e>
    1c28:	00070123          	sb	zero,2(a4)
    1c2c:	458d                	li	a1,3
    1c2e:	00370693          	addi	a3,a4,3
    1c32:	12b78363          	beq	a5,a1,1d58 <strncpy+0x230>
    1c36:	000701a3          	sb	zero,3(a4)
    1c3a:	4591                	li	a1,4
    1c3c:	00470693          	addi	a3,a4,4
    1c40:	12b78d63          	beq	a5,a1,1d7a <strncpy+0x252>
    1c44:	00070223          	sb	zero,4(a4)
    1c48:	4595                	li	a1,5
    1c4a:	00570693          	addi	a3,a4,5
    1c4e:	12b78863          	beq	a5,a1,1d7e <strncpy+0x256>
    1c52:	000702a3          	sb	zero,5(a4)
    1c56:	459d                	li	a1,7
    1c58:	00670693          	addi	a3,a4,6
    1c5c:	12b79363          	bne	a5,a1,1d82 <strncpy+0x25a>
    1c60:	00770693          	addi	a3,a4,7
    1c64:	00070323          	sb	zero,6(a4)
    1c68:	40f80833          	sub	a6,a6,a5
    1c6c:	ff887513          	andi	a0,a6,-8
    1c70:	97ba                	add	a5,a5,a4
    1c72:	953e                	add	a0,a0,a5
    1c74:	0007b023          	sd	zero,0(a5)
    1c78:	07a1                	addi	a5,a5,8
    1c7a:	fea79de3          	bne	a5,a0,1c74 <strncpy+0x14c>
    1c7e:	ff887513          	andi	a0,a6,-8
    1c82:	9da9                	addw	a1,a1,a0
    1c84:	00a687b3          	add	a5,a3,a0
    1c88:	f4a80de3          	beq	a6,a0,1be2 <strncpy+0xba>
    1c8c:	00078023          	sb	zero,0(a5)
    1c90:	0015869b          	addiw	a3,a1,1
    1c94:	f4c6f7e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1c98:	000780a3          	sb	zero,1(a5)
    1c9c:	0025869b          	addiw	a3,a1,2
    1ca0:	f4c6f1e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1ca4:	00078123          	sb	zero,2(a5)
    1ca8:	0035869b          	addiw	a3,a1,3
    1cac:	f2c6fbe3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cb0:	000781a3          	sb	zero,3(a5)
    1cb4:	0045869b          	addiw	a3,a1,4
    1cb8:	f2c6f5e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cbc:	00078223          	sb	zero,4(a5)
    1cc0:	0055869b          	addiw	a3,a1,5
    1cc4:	f0c6ffe3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cc8:	000782a3          	sb	zero,5(a5)
    1ccc:	0065869b          	addiw	a3,a1,6
    1cd0:	f0c6f9e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cd4:	00078323          	sb	zero,6(a5)
    1cd8:	0075869b          	addiw	a3,a1,7
    1cdc:	f0c6f3e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1ce0:	000783a3          	sb	zero,7(a5)
    1ce4:	0085869b          	addiw	a3,a1,8
    1ce8:	eec6fde3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cec:	00078423          	sb	zero,8(a5)
    1cf0:	0095869b          	addiw	a3,a1,9
    1cf4:	eec6f7e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1cf8:	000784a3          	sb	zero,9(a5)
    1cfc:	00a5869b          	addiw	a3,a1,10
    1d00:	eec6f1e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1d04:	00078523          	sb	zero,10(a5)
    1d08:	00b5869b          	addiw	a3,a1,11
    1d0c:	ecc6fbe3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1d10:	000785a3          	sb	zero,11(a5)
    1d14:	00c5869b          	addiw	a3,a1,12
    1d18:	ecc6f5e3          	bleu	a2,a3,1be2 <strncpy+0xba>
    1d1c:	00078623          	sb	zero,12(a5)
    1d20:	25b5                	addiw	a1,a1,13
    1d22:	ecc5f0e3          	bleu	a2,a1,1be2 <strncpy+0xba>
    1d26:	000786a3          	sb	zero,13(a5)
}
    1d2a:	853a                	mv	a0,a4
    1d2c:	8082                	ret
    1d2e:	46ad                	li	a3,11
    1d30:	bdd1                	j	1c04 <strncpy+0xdc>
    1d32:	00778693          	addi	a3,a5,7
    1d36:	452d                	li	a0,11
    1d38:	fff60593          	addi	a1,a2,-1
    1d3c:	eca6f4e3          	bleu	a0,a3,1c04 <strncpy+0xdc>
    1d40:	b7fd                	j	1d2e <strncpy+0x206>
    1d42:	40e007b3          	neg	a5,a4
    1d46:	8832                	mv	a6,a2
    1d48:	8b9d                	andi	a5,a5,7
    1d4a:	4581                	li	a1,0
    1d4c:	ea0607e3          	beqz	a2,1bfa <strncpy+0xd2>
    1d50:	b7cd                	j	1d32 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d52:	872a                	mv	a4,a0
}
    1d54:	853a                	mv	a0,a4
    1d56:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d58:	458d                	li	a1,3
    1d5a:	b739                	j	1c68 <strncpy+0x140>
    1d5c:	4585                	li	a1,1
    1d5e:	b729                	j	1c68 <strncpy+0x140>
    1d60:	86ba                	mv	a3,a4
    1d62:	4581                	li	a1,0
    1d64:	b711                	j	1c68 <strncpy+0x140>
    1d66:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d6a:	872a                	mv	a4,a0
    1d6c:	85b6                	mv	a1,a3
    1d6e:	bda9                	j	1bc8 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d70:	87ba                	mv	a5,a4
    1d72:	4581                	li	a1,0
    1d74:	bf21                	j	1c8c <strncpy+0x164>
    1d76:	4589                	li	a1,2
    1d78:	bdc5                	j	1c68 <strncpy+0x140>
    1d7a:	4591                	li	a1,4
    1d7c:	b5f5                	j	1c68 <strncpy+0x140>
    1d7e:	4595                	li	a1,5
    1d80:	b5e5                	j	1c68 <strncpy+0x140>
    1d82:	4599                	li	a1,6
    1d84:	b5d5                	j	1c68 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d86:	00d50023          	sb	a3,0(a0)
    1d8a:	872a                	mv	a4,a0
    1d8c:	b5b9                	j	1bda <strncpy+0xb2>

0000000000001d8e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d8e:	87aa                	mv	a5,a0
    1d90:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d92:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d96:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d9a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d9c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <openat>:
    register long a7 __asm__("a7") = n;
    1da6:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1daa:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dae:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <close>:
    register long a7 __asm__("a7") = n;
    1db6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <read>:
    register long a7 __asm__("a7") = n;
    1dc2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dca:	8082                	ret

0000000000001dcc <write>:
    register long a7 __asm__("a7") = n;
    1dcc:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dd4:	8082                	ret

0000000000001dd6 <getpid>:
    register long a7 __asm__("a7") = n;
    1dd6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dda:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <getppid>:
    register long a7 __asm__("a7") = n;
    1de2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1de6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dee:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <fork>:
    register long a7 __asm__("a7") = n;
    1dfa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dfe:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e00:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e02:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e0a:	85b2                	mv	a1,a2
    1e0c:	863a                	mv	a2,a4
    if (stack)
    1e0e:	c191                	beqz	a1,1e12 <clone+0x8>
	stack += stack_size;
    1e10:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e12:	4781                	li	a5,0
    1e14:	4701                	li	a4,0
    1e16:	4681                	li	a3,0
    1e18:	2601                	sext.w	a2,a2
    1e1a:	1ec0006f          	j	2006 <__clone>

0000000000001e1e <exit>:
    register long a7 __asm__("a7") = n;
    1e1e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e22:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e26:	8082                	ret

0000000000001e28 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e28:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e2c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e2e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <exec>:
    register long a7 __asm__("a7") = n;
    1e36:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <execve>:
    register long a7 __asm__("a7") = n;
    1e42:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e46:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <times>:
    register long a7 __asm__("a7") = n;
    1e4e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e52:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <get_time>:

int64 get_time()
{
    1e5a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e5c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e60:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e68:	2501                	sext.w	a0,a0
    1e6a:	ed09                	bnez	a0,1e84 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e6c:	67a2                	ld	a5,8(sp)
    1e6e:	3e800713          	li	a4,1000
    1e72:	00015503          	lhu	a0,0(sp)
    1e76:	02e7d7b3          	divu	a5,a5,a4
    1e7a:	02e50533          	mul	a0,a0,a4
    1e7e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e80:	0141                	addi	sp,sp,16
    1e82:	8082                	ret
        return -1;
    1e84:	557d                	li	a0,-1
    1e86:	bfed                	j	1e80 <get_time+0x26>

0000000000001e88 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e88:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <time>:
    register long a7 __asm__("a7") = n;
    1e94:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e98:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <sleep>:

int sleep(unsigned long long time)
{
    1ea0:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ea2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ea4:	850a                	mv	a0,sp
    1ea6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ea8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1eac:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eae:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eb2:	e501                	bnez	a0,1eba <sleep+0x1a>
    return 0;
    1eb4:	4501                	li	a0,0
}
    1eb6:	0141                	addi	sp,sp,16
    1eb8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eba:	4502                	lw	a0,0(sp)
}
    1ebc:	0141                	addi	sp,sp,16
    1ebe:	8082                	ret

0000000000001ec0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ec0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ecc:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ed0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ed4:	8082                	ret

0000000000001ed6 <munmap>:
    register long a7 __asm__("a7") = n;
    1ed6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <wait>:

int wait(int *code)
{
    1ee2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ee4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ee8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1eea:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eee:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <spawn>:
    register long a7 __asm__("a7") = n;
    1ef6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1efa:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <mailread>:
    register long a7 __asm__("a7") = n;
    1f02:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f06:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f0e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f12:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <fstat>:
    register long a7 __asm__("a7") = n;
    1f1a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f1e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f26:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f28:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f2c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f36:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f38:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f3c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <link>:

int link(char *old_path, char *new_path)
{
    1f46:	87aa                	mv	a5,a0
    1f48:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f4a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f54:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f58:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f5a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <unlink>:

int unlink(char *path)
{
    1f62:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f64:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f68:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f6c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f72:	2501                	sext.w	a0,a0
    1f74:	8082                	ret

0000000000001f76 <uname>:
    register long a7 __asm__("a7") = n;
    1f76:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f7a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <brk>:
    register long a7 __asm__("a7") = n;
    1f82:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f86:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <getcwd>:
    register long a7 __asm__("a7") = n;
    1f8e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f90:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f94:	8082                	ret

0000000000001f96 <chdir>:
    register long a7 __asm__("a7") = n;
    1f96:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f9a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fa2:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1fa4:	02059613          	slli	a2,a1,0x20
    1fa8:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1faa:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fae:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fb2:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb4:	00000073          	ecall
}
    1fb8:	2501                	sext.w	a0,a0
    1fba:	8082                	ret

0000000000001fbc <getdents>:
    register long a7 __asm__("a7") = n;
    1fbc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <pipe>:
    register long a7 __asm__("a7") = n;
    1fc8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fcc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fce:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fd2:	2501                	sext.w	a0,a0
    1fd4:	8082                	ret

0000000000001fd6 <dup>:
    register long a7 __asm__("a7") = n;
    1fd6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fd8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fdc:	2501                	sext.w	a0,a0
    1fde:	8082                	ret

0000000000001fe0 <dup2>:
    register long a7 __asm__("a7") = n;
    1fe0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fe2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fe4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fe8:	2501                	sext.w	a0,a0
    1fea:	8082                	ret

0000000000001fec <mount>:
    register long a7 __asm__("a7") = n;
    1fec:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ff0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ff4:	2501                	sext.w	a0,a0
    1ff6:	8082                	ret

0000000000001ff8 <umount>:
    register long a7 __asm__("a7") = n;
    1ff8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ffc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ffe:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    2002:	2501                	sext.w	a0,a0
    2004:	8082                	ret

0000000000002006 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2006:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2008:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    200a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    200c:	8532                	mv	a0,a2
	mv a2, a4
    200e:	863a                	mv	a2,a4
	mv a3, a5
    2010:	86be                	mv	a3,a5
	mv a4, a6
    2012:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2014:	0dc00893          	li	a7,220
	ecall
    2018:	00000073          	ecall

	beqz a0, 1f
    201c:	c111                	beqz	a0,2020 <__clone+0x1a>
	# Parent
	ret
    201e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2020:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2022:	6522                	ld	a0,8(sp)
	jalr a1
    2024:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2026:	05d00893          	li	a7,93
	ecall
    202a:	00000073          	ecall
