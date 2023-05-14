
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/chdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0c60006f          	j	10c8 <__start_main>

0000000000001006 <test_chdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

static char buffer[30];
void test_chdir(void){
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	ff850513          	addi	a0,a0,-8 # 2000 <__clone+0x28>
void test_chdir(void){
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1014:	2b4000ef          	jal	ra,12c8 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0c050513          	addi	a0,a0,192 # 20d8 <__func__.1187>
    1020:	2a8000ef          	jal	ra,12c8 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	ff450513          	addi	a0,a0,-12 # 2018 <__clone+0x40>
    102c:	29c000ef          	jal	ra,12c8 <puts>
    mkdir("test_chdir", 0666);
    1030:	1b600593          	li	a1,438
    1034:	00001517          	auipc	a0,0x1
    1038:	ff450513          	addi	a0,a0,-12 # 2028 <__clone+0x50>
    103c:	739000ef          	jal	ra,1f74 <mkdir>
    int ret = chdir("test_chdir");
    1040:	00001517          	auipc	a0,0x1
    1044:	fe850513          	addi	a0,a0,-24 # 2028 <__clone+0x50>
    1048:	721000ef          	jal	ra,1f68 <chdir>
    104c:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    104e:	85aa                	mv	a1,a0
    1050:	00001517          	auipc	a0,0x1
    1054:	fe850513          	addi	a0,a0,-24 # 2038 <__clone+0x60>
    1058:	292000ef          	jal	ra,12ea <printf>
    assert(ret == 0);
    105c:	e439                	bnez	s0,10aa <test_chdir+0xa4>
    getcwd(buffer, 30);
    105e:	45f9                	li	a1,30
    1060:	00001517          	auipc	a0,0x1
    1064:	05850513          	addi	a0,a0,88 # 20b8 <buffer>
    1068:	6f9000ef          	jal	ra,1f60 <getcwd>
    printf("  current working dir : %s\n", buffer);
    106c:	00001597          	auipc	a1,0x1
    1070:	04c58593          	addi	a1,a1,76 # 20b8 <buffer>
    1074:	00001517          	auipc	a0,0x1
    1078:	ff450513          	addi	a0,a0,-12 # 2068 <__clone+0x90>
    107c:	26e000ef          	jal	ra,12ea <printf>
    TEST_END(__func__);
    1080:	00001517          	auipc	a0,0x1
    1084:	00850513          	addi	a0,a0,8 # 2088 <__clone+0xb0>
    1088:	240000ef          	jal	ra,12c8 <puts>
    108c:	00001517          	auipc	a0,0x1
    1090:	04c50513          	addi	a0,a0,76 # 20d8 <__func__.1187>
    1094:	234000ef          	jal	ra,12c8 <puts>
}
    1098:	6402                	ld	s0,0(sp)
    109a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f7c50513          	addi	a0,a0,-132 # 2018 <__clone+0x40>
}
    10a4:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a6:	2220006f          	j	12c8 <puts>
    assert(ret == 0);
    10aa:	00001517          	auipc	a0,0x1
    10ae:	f9e50513          	addi	a0,a0,-98 # 2048 <__clone+0x70>
    10b2:	4dc000ef          	jal	ra,158e <panic>
    10b6:	b765                	j	105e <test_chdir+0x58>

00000000000010b8 <main>:

int main(void){
    10b8:	1141                	addi	sp,sp,-16
    10ba:	e406                	sd	ra,8(sp)
    test_chdir();
    10bc:	f4bff0ef          	jal	ra,1006 <test_chdir>
    return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	addi	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ca:	4108                	lw	a0,0(a0)
{
    10cc:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ce:	05a1                	addi	a1,a1,8
{
    10d0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d2:	fe7ff0ef          	jal	ra,10b8 <main>
    10d6:	51b000ef          	jal	ra,1df0 <exit>
	return 0;
}
    10da:	60a2                	ld	ra,8(sp)
    10dc:	4501                	li	a0,0
    10de:	0141                	addi	sp,sp,16
    10e0:	8082                	ret

00000000000010e2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e2:	7179                	addi	sp,sp,-48
    10e4:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e6:	12054e63          	bltz	a0,1222 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10ea:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10ee:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f0:	02b7f6bb          	remuw	a3,a5,a1
    10f4:	00001717          	auipc	a4,0x1
    10f8:	ff470713          	addi	a4,a4,-12 # 20e8 <digits>
    buf[16] = 0;
    10fc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1100:	1682                	slli	a3,a3,0x20
    1102:	9281                	srli	a3,a3,0x20
    1104:	96ba                	add	a3,a3,a4
    1106:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    110a:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    110e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1112:	16b7e363          	bltu	a5,a1,1278 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1116:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    111a:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    111e:	1602                	slli	a2,a2,0x20
    1120:	9201                	srli	a2,a2,0x20
    1122:	963a                	add	a2,a2,a4
    1124:	00064603          	lbu	a2,0(a2)
    1128:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112c:	0007861b          	sext.w	a2,a5
    1130:	12b6e863          	bltu	a3,a1,1260 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1134:	02b7f6bb          	remuw	a3,a5,a1
    1138:	1682                	slli	a3,a3,0x20
    113a:	9281                	srli	a3,a3,0x20
    113c:	96ba                	add	a3,a3,a4
    113e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1142:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1146:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    114a:	10b66e63          	bltu	a2,a1,1266 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    114e:	02b876bb          	remuw	a3,a6,a1
    1152:	1682                	slli	a3,a3,0x20
    1154:	9281                	srli	a3,a3,0x20
    1156:	96ba                	add	a3,a3,a4
    1158:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1160:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1164:	10b86463          	bltu	a6,a1,126c <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1168:	02b676bb          	remuw	a3,a2,a1
    116c:	1682                	slli	a3,a3,0x20
    116e:	9281                	srli	a3,a3,0x20
    1170:	96ba                	add	a3,a3,a4
    1172:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1176:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    117a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    117e:	0eb66a63          	bltu	a2,a1,1272 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1182:	02b876bb          	remuw	a3,a6,a1
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96ba                	add	a3,a3,a4
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1194:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1198:	0cb86163          	bltu	a6,a1,125a <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    119c:	02b676bb          	remuw	a3,a2,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ae:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11b2:	0cb66563          	bltu	a2,a1,127c <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11b6:	02b876bb          	remuw	a3,a6,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c8:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11cc:	0ab86b63          	bltu	a6,a1,1282 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11d0:	02b676bb          	remuw	a3,a2,a1
    11d4:	1682                	slli	a3,a3,0x20
    11d6:	9281                	srli	a3,a3,0x20
    11d8:	96ba                	add	a3,a3,a4
    11da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11de:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11e2:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11e6:	0ab66163          	bltu	a2,a1,1288 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11ea:	1782                	slli	a5,a5,0x20
    11ec:	9381                	srli	a5,a5,0x20
    11ee:	97ba                	add	a5,a5,a4
    11f0:	0007c703          	lbu	a4,0(a5)
    11f4:	4599                	li	a1,6
    11f6:	4795                	li	a5,5
    11f8:	00e10723          	sb	a4,14(sp)

    if (sign)
    11fc:	00055963          	bgez	a0,120e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1200:	1018                	addi	a4,sp,32
    1202:	973e                	add	a4,a4,a5
    1204:	02d00693          	li	a3,45
    1208:	fed70423          	sb	a3,-24(a4)
    120c:	85be                	mv	a1,a5
    write(f, s, l);
    120e:	003c                	addi	a5,sp,8
    1210:	4641                	li	a2,16
    1212:	9e0d                	subw	a2,a2,a1
    1214:	4505                	li	a0,1
    1216:	95be                	add	a1,a1,a5
    1218:	387000ef          	jal	ra,1d9e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121c:	70a2                	ld	ra,40(sp)
    121e:	6145                	addi	sp,sp,48
    1220:	8082                	ret
        x = -xx;
    1222:	40a0063b          	negw	a2,a0
    1226:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1228:	02b677bb          	remuw	a5,a2,a1
    122c:	00001717          	auipc	a4,0x1
    1230:	ebc70713          	addi	a4,a4,-324 # 20e8 <digits>
    buf[16] = 0;
    1234:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1238:	1782                	slli	a5,a5,0x20
    123a:	9381                	srli	a5,a5,0x20
    123c:	97ba                	add	a5,a5,a4
    123e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1242:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1246:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124a:	ecb676e3          	bleu	a1,a2,1116 <printint.constprop.0+0x34>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1256:	45b9                	li	a1,14
    1258:	bf5d                	j	120e <printint.constprop.0+0x12c>
    125a:	47a5                	li	a5,9
    125c:	45a9                	li	a1,10
    125e:	bf79                	j	11fc <printint.constprop.0+0x11a>
    1260:	47b5                	li	a5,13
    1262:	45b9                	li	a1,14
    1264:	bf61                	j	11fc <printint.constprop.0+0x11a>
    1266:	47b1                	li	a5,12
    1268:	45b5                	li	a1,13
    126a:	bf49                	j	11fc <printint.constprop.0+0x11a>
    126c:	47ad                	li	a5,11
    126e:	45b1                	li	a1,12
    1270:	b771                	j	11fc <printint.constprop.0+0x11a>
    1272:	47a9                	li	a5,10
    1274:	45ad                	li	a1,11
    1276:	b759                	j	11fc <printint.constprop.0+0x11a>
    i = 15;
    1278:	45bd                	li	a1,15
    127a:	bf51                	j	120e <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    127c:	47a1                	li	a5,8
    127e:	45a5                	li	a1,9
    1280:	bfb5                	j	11fc <printint.constprop.0+0x11a>
    1282:	479d                	li	a5,7
    1284:	45a1                	li	a1,8
    1286:	bf9d                	j	11fc <printint.constprop.0+0x11a>
    1288:	4799                	li	a5,6
    128a:	459d                	li	a1,7
    128c:	bf85                	j	11fc <printint.constprop.0+0x11a>

000000000000128e <getchar>:
{
    128e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1290:	00f10593          	addi	a1,sp,15
    1294:	4605                	li	a2,1
    1296:	4501                	li	a0,0
{
    1298:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    129e:	2f7000ef          	jal	ra,1d94 <read>
}
    12a2:	60e2                	ld	ra,24(sp)
    12a4:	00f14503          	lbu	a0,15(sp)
    12a8:	6105                	addi	sp,sp,32
    12aa:	8082                	ret

00000000000012ac <putchar>:
{
    12ac:	1101                	addi	sp,sp,-32
    char byte = c;
    12ae:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12b2:	00f10593          	addi	a1,sp,15
    12b6:	4605                	li	a2,1
    12b8:	4505                	li	a0,1
{
    12ba:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12bc:	2e3000ef          	jal	ra,1d9e <write>
}
    12c0:	60e2                	ld	ra,24(sp)
    12c2:	2501                	sext.w	a0,a0
    12c4:	6105                	addi	sp,sp,32
    12c6:	8082                	ret

00000000000012c8 <puts>:
{
    12c8:	1141                	addi	sp,sp,-16
    12ca:	e406                	sd	ra,8(sp)
    12cc:	e022                	sd	s0,0(sp)
    12ce:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d0:	5b2000ef          	jal	ra,1882 <strlen>
    12d4:	862a                	mv	a2,a0
    12d6:	85a2                	mv	a1,s0
    12d8:	4505                	li	a0,1
    12da:	2c5000ef          	jal	ra,1d9e <write>
}
    12de:	60a2                	ld	ra,8(sp)
    12e0:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e2:	957d                	srai	a0,a0,0x3f
    return r;
    12e4:	2501                	sext.w	a0,a0
}
    12e6:	0141                	addi	sp,sp,16
    12e8:	8082                	ret

00000000000012ea <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ea:	7131                	addi	sp,sp,-192
    12ec:	e0da                	sd	s6,64(sp)
    12ee:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12f0:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f2:	013c                	addi	a5,sp,136
{
    12f4:	f0ca                	sd	s2,96(sp)
    12f6:	ecce                	sd	s3,88(sp)
    12f8:	e8d2                	sd	s4,80(sp)
    12fa:	e4d6                	sd	s5,72(sp)
    12fc:	fc5e                	sd	s7,56(sp)
    12fe:	fc86                	sd	ra,120(sp)
    1300:	f8a2                	sd	s0,112(sp)
    1302:	f4a6                	sd	s1,104(sp)
    1304:	89aa                	mv	s3,a0
    1306:	e52e                	sd	a1,136(sp)
    1308:	e932                	sd	a2,144(sp)
    130a:	ed36                	sd	a3,152(sp)
    130c:	f13a                	sd	a4,160(sp)
    130e:	f942                	sd	a6,176(sp)
    1310:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1312:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1314:	02500913          	li	s2,37
    1318:	07000a93          	li	s5,112
    buf[i++] = '0';
    131c:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1320:	00001a17          	auipc	s4,0x1
    1324:	dc8a0a13          	addi	s4,s4,-568 # 20e8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1328:	00001b97          	auipc	s7,0x1
    132c:	d70b8b93          	addi	s7,s7,-656 # 2098 <__clone+0xc0>
        if (!*s)
    1330:	0009c783          	lbu	a5,0(s3)
    1334:	cfb9                	beqz	a5,1392 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1336:	23278d63          	beq	a5,s2,1570 <printf+0x286>
    133a:	864e                	mv	a2,s3
    133c:	a019                	j	1342 <printf+0x58>
    133e:	07278563          	beq	a5,s2,13a8 <printf+0xbe>
    1342:	0605                	addi	a2,a2,1
    1344:	00064783          	lbu	a5,0(a2)
    1348:	fbfd                	bnez	a5,133e <printf+0x54>
    134a:	84b2                	mv	s1,a2
        l = z - a;
    134c:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1350:	8622                	mv	a2,s0
    1352:	85ce                	mv	a1,s3
    1354:	4505                	li	a0,1
    1356:	249000ef          	jal	ra,1d9e <write>
        if (l)
    135a:	ec3d                	bnez	s0,13d8 <printf+0xee>
        if (s[1] == 0)
    135c:	0014c783          	lbu	a5,1(s1)
    1360:	cb8d                	beqz	a5,1392 <printf+0xa8>
        switch (s[1])
    1362:	09578b63          	beq	a5,s5,13f8 <printf+0x10e>
    1366:	06fafb63          	bleu	a5,s5,13dc <printf+0xf2>
    136a:	07300713          	li	a4,115
    136e:	1ce78e63          	beq	a5,a4,154a <printf+0x260>
    1372:	07800713          	li	a4,120
    1376:	1ae79563          	bne	a5,a4,1520 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    137a:	6782                	ld	a5,0(sp)
    137c:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    137e:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1382:	4388                	lw	a0,0(a5)
    1384:	07a1                	addi	a5,a5,8
    1386:	e03e                	sd	a5,0(sp)
    1388:	d5bff0ef          	jal	ra,10e2 <printint.constprop.0>
        if (!*s)
    138c:	0009c783          	lbu	a5,0(s3)
    1390:	f3dd                	bnez	a5,1336 <printf+0x4c>
    }
    va_end(ap);
}
    1392:	70e6                	ld	ra,120(sp)
    1394:	7446                	ld	s0,112(sp)
    1396:	74a6                	ld	s1,104(sp)
    1398:	7906                	ld	s2,96(sp)
    139a:	69e6                	ld	s3,88(sp)
    139c:	6a46                	ld	s4,80(sp)
    139e:	6aa6                	ld	s5,72(sp)
    13a0:	6b06                	ld	s6,64(sp)
    13a2:	7be2                	ld	s7,56(sp)
    13a4:	6129                	addi	sp,sp,192
    13a6:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13a8:	00164783          	lbu	a5,1(a2)
    13ac:	84b2                	mv	s1,a2
    13ae:	01278763          	beq	a5,s2,13bc <printf+0xd2>
    13b2:	bf69                	j	134c <printf+0x62>
    13b4:	0014c783          	lbu	a5,1(s1)
    13b8:	f9279ae3          	bne	a5,s2,134c <printf+0x62>
    13bc:	0489                	addi	s1,s1,2
    13be:	0004c783          	lbu	a5,0(s1)
    13c2:	0605                	addi	a2,a2,1
    13c4:	ff2788e3          	beq	a5,s2,13b4 <printf+0xca>
        l = z - a;
    13c8:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13cc:	8622                	mv	a2,s0
    13ce:	85ce                	mv	a1,s3
    13d0:	4505                	li	a0,1
    13d2:	1cd000ef          	jal	ra,1d9e <write>
        if (l)
    13d6:	d059                	beqz	s0,135c <printf+0x72>
    13d8:	89a6                	mv	s3,s1
    13da:	bf99                	j	1330 <printf+0x46>
    13dc:	06400713          	li	a4,100
    13e0:	14e79063          	bne	a5,a4,1520 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13e4:	6782                	ld	a5,0(sp)
    13e6:	45a9                	li	a1,10
        s += 2;
    13e8:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13ec:	4388                	lw	a0,0(a5)
    13ee:	07a1                	addi	a5,a5,8
    13f0:	e03e                	sd	a5,0(sp)
    13f2:	cf1ff0ef          	jal	ra,10e2 <printint.constprop.0>
        s += 2;
    13f6:	bf59                	j	138c <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13f8:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13fa:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13fe:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1400:	631c                	ld	a5,0(a4)
    1402:	0721                	addi	a4,a4,8
    1404:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1406:	00479293          	slli	t0,a5,0x4
    140a:	00879f93          	slli	t6,a5,0x8
    140e:	00c79f13          	slli	t5,a5,0xc
    1412:	01079e93          	slli	t4,a5,0x10
    1416:	01479e13          	slli	t3,a5,0x14
    141a:	01879313          	slli	t1,a5,0x18
    141e:	01c79893          	slli	a7,a5,0x1c
    1422:	02479813          	slli	a6,a5,0x24
    1426:	02879513          	slli	a0,a5,0x28
    142a:	02c79593          	slli	a1,a5,0x2c
    142e:	03079693          	slli	a3,a5,0x30
    1432:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1436:	03c7d413          	srli	s0,a5,0x3c
    143a:	01c7d39b          	srliw	t2,a5,0x1c
    143e:	03c2d293          	srli	t0,t0,0x3c
    1442:	03cfdf93          	srli	t6,t6,0x3c
    1446:	03cf5f13          	srli	t5,t5,0x3c
    144a:	03cede93          	srli	t4,t4,0x3c
    144e:	03ce5e13          	srli	t3,t3,0x3c
    1452:	03c35313          	srli	t1,t1,0x3c
    1456:	03c8d893          	srli	a7,a7,0x3c
    145a:	03c85813          	srli	a6,a6,0x3c
    145e:	9171                	srli	a0,a0,0x3c
    1460:	91f1                	srli	a1,a1,0x3c
    1462:	92f1                	srli	a3,a3,0x3c
    1464:	9371                	srli	a4,a4,0x3c
    1466:	96d2                	add	a3,a3,s4
    1468:	9752                	add	a4,a4,s4
    146a:	9452                	add	s0,s0,s4
    146c:	92d2                	add	t0,t0,s4
    146e:	9fd2                	add	t6,t6,s4
    1470:	9f52                	add	t5,t5,s4
    1472:	9ed2                	add	t4,t4,s4
    1474:	9e52                	add	t3,t3,s4
    1476:	9352                	add	t1,t1,s4
    1478:	98d2                	add	a7,a7,s4
    147a:	93d2                	add	t2,t2,s4
    147c:	9852                	add	a6,a6,s4
    147e:	9552                	add	a0,a0,s4
    1480:	95d2                	add	a1,a1,s4
    1482:	0006c983          	lbu	s3,0(a3)
    1486:	0002c283          	lbu	t0,0(t0)
    148a:	00074683          	lbu	a3,0(a4)
    148e:	000fcf83          	lbu	t6,0(t6)
    1492:	000f4f03          	lbu	t5,0(t5)
    1496:	000ece83          	lbu	t4,0(t4)
    149a:	000e4e03          	lbu	t3,0(t3)
    149e:	00034303          	lbu	t1,0(t1)
    14a2:	0008c883          	lbu	a7,0(a7)
    14a6:	0003c383          	lbu	t2,0(t2)
    14aa:	00084803          	lbu	a6,0(a6)
    14ae:	00054503          	lbu	a0,0(a0)
    14b2:	0005c583          	lbu	a1,0(a1)
    14b6:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ba:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14be:	9371                	srli	a4,a4,0x3c
    14c0:	8bbd                	andi	a5,a5,15
    14c2:	9752                	add	a4,a4,s4
    14c4:	97d2                	add	a5,a5,s4
    14c6:	005105a3          	sb	t0,11(sp)
    14ca:	01f10623          	sb	t6,12(sp)
    14ce:	01e106a3          	sb	t5,13(sp)
    14d2:	01d10723          	sb	t4,14(sp)
    14d6:	01c107a3          	sb	t3,15(sp)
    14da:	00610823          	sb	t1,16(sp)
    14de:	011108a3          	sb	a7,17(sp)
    14e2:	00710923          	sb	t2,18(sp)
    14e6:	010109a3          	sb	a6,19(sp)
    14ea:	00a10a23          	sb	a0,20(sp)
    14ee:	00b10aa3          	sb	a1,21(sp)
    14f2:	01310b23          	sb	s3,22(sp)
    14f6:	00d10ba3          	sb	a3,23(sp)
    14fa:	00810523          	sb	s0,10(sp)
    14fe:	00074703          	lbu	a4,0(a4)
    1502:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1506:	002c                	addi	a1,sp,8
    1508:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    150a:	00e10c23          	sb	a4,24(sp)
    150e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1512:	00010d23          	sb	zero,26(sp)
        s += 2;
    1516:	00248993          	addi	s3,s1,2
    write(f, s, l);
    151a:	085000ef          	jal	ra,1d9e <write>
        s += 2;
    151e:	b5bd                	j	138c <printf+0xa2>
    char byte = c;
    1520:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1524:	4605                	li	a2,1
    1526:	002c                	addi	a1,sp,8
    1528:	4505                	li	a0,1
    char byte = c;
    152a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    152e:	071000ef          	jal	ra,1d9e <write>
    char byte = c;
    1532:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1536:	4605                	li	a2,1
    1538:	002c                	addi	a1,sp,8
    153a:	4505                	li	a0,1
    char byte = c;
    153c:	00f10423          	sb	a5,8(sp)
        s += 2;
    1540:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1544:	05b000ef          	jal	ra,1d9e <write>
        s += 2;
    1548:	b591                	j	138c <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    154a:	6782                	ld	a5,0(sp)
    154c:	6380                	ld	s0,0(a5)
    154e:	07a1                	addi	a5,a5,8
    1550:	e03e                	sd	a5,0(sp)
    1552:	cc05                	beqz	s0,158a <printf+0x2a0>
            l = strnlen(a, 200);
    1554:	0c800593          	li	a1,200
    1558:	8522                	mv	a0,s0
    155a:	45a000ef          	jal	ra,19b4 <strnlen>
    write(f, s, l);
    155e:	0005061b          	sext.w	a2,a0
    1562:	85a2                	mv	a1,s0
    1564:	4505                	li	a0,1
    1566:	039000ef          	jal	ra,1d9e <write>
        s += 2;
    156a:	00248993          	addi	s3,s1,2
    156e:	bd39                	j	138c <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1570:	0019c783          	lbu	a5,1(s3)
    1574:	84ce                	mv	s1,s3
    1576:	864e                	mv	a2,s3
    1578:	e52782e3          	beq	a5,s2,13bc <printf+0xd2>
    write(f, s, l);
    157c:	4601                	li	a2,0
    157e:	85ce                	mv	a1,s3
    1580:	4505                	li	a0,1
    1582:	01d000ef          	jal	ra,1d9e <write>
    1586:	84ce                	mv	s1,s3
    1588:	bbd1                	j	135c <printf+0x72>
                a = "(null)";
    158a:	845e                	mv	s0,s7
    158c:	b7e1                	j	1554 <printf+0x26a>

000000000000158e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    158e:	1141                	addi	sp,sp,-16
    1590:	e406                	sd	ra,8(sp)
    puts(m);
    1592:	d37ff0ef          	jal	ra,12c8 <puts>
    exit(-100);
}
    1596:	60a2                	ld	ra,8(sp)
    exit(-100);
    1598:	f9c00513          	li	a0,-100
}
    159c:	0141                	addi	sp,sp,16
    exit(-100);
    159e:	0530006f          	j	1df0 <exit>

00000000000015a2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	02000793          	li	a5,32
    15a6:	00f50663          	beq	a0,a5,15b2 <isspace+0x10>
    15aa:	355d                	addiw	a0,a0,-9
    15ac:	00553513          	sltiu	a0,a0,5
    15b0:	8082                	ret
    15b2:	4505                	li	a0,1
}
    15b4:	8082                	ret

00000000000015b6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b6:	fd05051b          	addiw	a0,a0,-48
}
    15ba:	00a53513          	sltiu	a0,a0,10
    15be:	8082                	ret

00000000000015c0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c0:	02000613          	li	a2,32
    15c4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c6:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	0007079b          	sext.w	a5,a4
    15ce:	ff77869b          	addiw	a3,a5,-9
    15d2:	04c70b63          	beq	a4,a2,1628 <atoi+0x68>
    15d6:	04d5f963          	bleu	a3,a1,1628 <atoi+0x68>
        s++;
    switch (*s)
    15da:	02b00693          	li	a3,43
    15de:	04d70a63          	beq	a4,a3,1632 <atoi+0x72>
    15e2:	02d00693          	li	a3,45
    15e6:	06d70463          	beq	a4,a3,164e <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ea:	fd07859b          	addiw	a1,a5,-48
    15ee:	4625                	li	a2,9
    15f0:	873e                	mv	a4,a5
    15f2:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15f4:	4e01                	li	t3,0
    while (isdigit(*s))
    15f6:	04b66a63          	bltu	a2,a1,164a <atoi+0x8a>
    int n = 0, neg = 0;
    15fa:	4501                	li	a0,0
    while (isdigit(*s))
    15fc:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15fe:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1600:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1604:	0025179b          	slliw	a5,a0,0x2
    1608:	9d3d                	addw	a0,a0,a5
    160a:	fd07031b          	addiw	t1,a4,-48
    160e:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1612:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1616:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    161a:	0006071b          	sext.w	a4,a2
    161e:	feb870e3          	bleu	a1,a6,15fe <atoi+0x3e>
    return neg ? n : -n;
    1622:	000e0563          	beqz	t3,162c <atoi+0x6c>
}
    1626:	8082                	ret
        s++;
    1628:	0505                	addi	a0,a0,1
    162a:	bf71                	j	15c6 <atoi+0x6>
    162c:	4113053b          	subw	a0,t1,a7
    1630:	8082                	ret
    while (isdigit(*s))
    1632:	00154783          	lbu	a5,1(a0)
    1636:	4625                	li	a2,9
        s++;
    1638:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163c:	fd07859b          	addiw	a1,a5,-48
    1640:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1644:	4e01                	li	t3,0
    while (isdigit(*s))
    1646:	fab67ae3          	bleu	a1,a2,15fa <atoi+0x3a>
    164a:	4501                	li	a0,0
}
    164c:	8082                	ret
    while (isdigit(*s))
    164e:	00154783          	lbu	a5,1(a0)
    1652:	4625                	li	a2,9
        s++;
    1654:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1658:	fd07859b          	addiw	a1,a5,-48
    165c:	0007871b          	sext.w	a4,a5
    1660:	feb665e3          	bltu	a2,a1,164a <atoi+0x8a>
        neg = 1;
    1664:	4e05                	li	t3,1
    1666:	bf51                	j	15fa <atoi+0x3a>

0000000000001668 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1668:	16060d63          	beqz	a2,17e2 <memset+0x17a>
    166c:	40a007b3          	neg	a5,a0
    1670:	8b9d                	andi	a5,a5,7
    1672:	00778713          	addi	a4,a5,7
    1676:	482d                	li	a6,11
    1678:	0ff5f593          	andi	a1,a1,255
    167c:	fff60693          	addi	a3,a2,-1
    1680:	17076263          	bltu	a4,a6,17e4 <memset+0x17c>
    1684:	16e6ea63          	bltu	a3,a4,17f8 <memset+0x190>
    1688:	16078563          	beqz	a5,17f2 <memset+0x18a>
    168c:	00b50023          	sb	a1,0(a0)
    1690:	4705                	li	a4,1
    1692:	00150e93          	addi	t4,a0,1
    1696:	14e78c63          	beq	a5,a4,17ee <memset+0x186>
    169a:	00b500a3          	sb	a1,1(a0)
    169e:	4709                	li	a4,2
    16a0:	00250e93          	addi	t4,a0,2
    16a4:	14e78d63          	beq	a5,a4,17fe <memset+0x196>
    16a8:	00b50123          	sb	a1,2(a0)
    16ac:	470d                	li	a4,3
    16ae:	00350e93          	addi	t4,a0,3
    16b2:	12e78b63          	beq	a5,a4,17e8 <memset+0x180>
    16b6:	00b501a3          	sb	a1,3(a0)
    16ba:	4711                	li	a4,4
    16bc:	00450e93          	addi	t4,a0,4
    16c0:	14e78163          	beq	a5,a4,1802 <memset+0x19a>
    16c4:	00b50223          	sb	a1,4(a0)
    16c8:	4715                	li	a4,5
    16ca:	00550e93          	addi	t4,a0,5
    16ce:	12e78c63          	beq	a5,a4,1806 <memset+0x19e>
    16d2:	00b502a3          	sb	a1,5(a0)
    16d6:	471d                	li	a4,7
    16d8:	00650e93          	addi	t4,a0,6
    16dc:	12e79763          	bne	a5,a4,180a <memset+0x1a2>
    16e0:	00750e93          	addi	t4,a0,7
    16e4:	00b50323          	sb	a1,6(a0)
    16e8:	4f1d                	li	t5,7
    16ea:	00859713          	slli	a4,a1,0x8
    16ee:	8f4d                	or	a4,a4,a1
    16f0:	01059e13          	slli	t3,a1,0x10
    16f4:	01c76e33          	or	t3,a4,t3
    16f8:	01859313          	slli	t1,a1,0x18
    16fc:	006e6333          	or	t1,t3,t1
    1700:	02059893          	slli	a7,a1,0x20
    1704:	011368b3          	or	a7,t1,a7
    1708:	02859813          	slli	a6,a1,0x28
    170c:	40f60333          	sub	t1,a2,a5
    1710:	0108e833          	or	a6,a7,a6
    1714:	03059693          	slli	a3,a1,0x30
    1718:	00d866b3          	or	a3,a6,a3
    171c:	03859713          	slli	a4,a1,0x38
    1720:	97aa                	add	a5,a5,a0
    1722:	ff837813          	andi	a6,t1,-8
    1726:	8f55                	or	a4,a4,a3
    1728:	00f806b3          	add	a3,a6,a5
    172c:	e398                	sd	a4,0(a5)
    172e:	07a1                	addi	a5,a5,8
    1730:	fed79ee3          	bne	a5,a3,172c <memset+0xc4>
    1734:	ff837693          	andi	a3,t1,-8
    1738:	00de87b3          	add	a5,t4,a3
    173c:	01e6873b          	addw	a4,a3,t5
    1740:	0ad30663          	beq	t1,a3,17ec <memset+0x184>
    1744:	00b78023          	sb	a1,0(a5)
    1748:	0017069b          	addiw	a3,a4,1
    174c:	08c6fb63          	bleu	a2,a3,17e2 <memset+0x17a>
    1750:	00b780a3          	sb	a1,1(a5)
    1754:	0027069b          	addiw	a3,a4,2
    1758:	08c6f563          	bleu	a2,a3,17e2 <memset+0x17a>
    175c:	00b78123          	sb	a1,2(a5)
    1760:	0037069b          	addiw	a3,a4,3
    1764:	06c6ff63          	bleu	a2,a3,17e2 <memset+0x17a>
    1768:	00b781a3          	sb	a1,3(a5)
    176c:	0047069b          	addiw	a3,a4,4
    1770:	06c6f963          	bleu	a2,a3,17e2 <memset+0x17a>
    1774:	00b78223          	sb	a1,4(a5)
    1778:	0057069b          	addiw	a3,a4,5
    177c:	06c6f363          	bleu	a2,a3,17e2 <memset+0x17a>
    1780:	00b782a3          	sb	a1,5(a5)
    1784:	0067069b          	addiw	a3,a4,6
    1788:	04c6fd63          	bleu	a2,a3,17e2 <memset+0x17a>
    178c:	00b78323          	sb	a1,6(a5)
    1790:	0077069b          	addiw	a3,a4,7
    1794:	04c6f763          	bleu	a2,a3,17e2 <memset+0x17a>
    1798:	00b783a3          	sb	a1,7(a5)
    179c:	0087069b          	addiw	a3,a4,8
    17a0:	04c6f163          	bleu	a2,a3,17e2 <memset+0x17a>
    17a4:	00b78423          	sb	a1,8(a5)
    17a8:	0097069b          	addiw	a3,a4,9
    17ac:	02c6fb63          	bleu	a2,a3,17e2 <memset+0x17a>
    17b0:	00b784a3          	sb	a1,9(a5)
    17b4:	00a7069b          	addiw	a3,a4,10
    17b8:	02c6f563          	bleu	a2,a3,17e2 <memset+0x17a>
    17bc:	00b78523          	sb	a1,10(a5)
    17c0:	00b7069b          	addiw	a3,a4,11
    17c4:	00c6ff63          	bleu	a2,a3,17e2 <memset+0x17a>
    17c8:	00b785a3          	sb	a1,11(a5)
    17cc:	00c7069b          	addiw	a3,a4,12
    17d0:	00c6f963          	bleu	a2,a3,17e2 <memset+0x17a>
    17d4:	00b78623          	sb	a1,12(a5)
    17d8:	2735                	addiw	a4,a4,13
    17da:	00c77463          	bleu	a2,a4,17e2 <memset+0x17a>
    17de:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17e2:	8082                	ret
    17e4:	472d                	li	a4,11
    17e6:	bd79                	j	1684 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e8:	4f0d                	li	t5,3
    17ea:	b701                	j	16ea <memset+0x82>
    17ec:	8082                	ret
    17ee:	4f05                	li	t5,1
    17f0:	bded                	j	16ea <memset+0x82>
    17f2:	8eaa                	mv	t4,a0
    17f4:	4f01                	li	t5,0
    17f6:	bdd5                	j	16ea <memset+0x82>
    17f8:	87aa                	mv	a5,a0
    17fa:	4701                	li	a4,0
    17fc:	b7a1                	j	1744 <memset+0xdc>
    17fe:	4f09                	li	t5,2
    1800:	b5ed                	j	16ea <memset+0x82>
    1802:	4f11                	li	t5,4
    1804:	b5dd                	j	16ea <memset+0x82>
    1806:	4f15                	li	t5,5
    1808:	b5cd                	j	16ea <memset+0x82>
    180a:	4f19                	li	t5,6
    180c:	bdf9                	j	16ea <memset+0x82>

000000000000180e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    180e:	00054703          	lbu	a4,0(a0)
    1812:	0005c783          	lbu	a5,0(a1)
    1816:	00e79b63          	bne	a5,a4,182c <strcmp+0x1e>
    181a:	cf89                	beqz	a5,1834 <strcmp+0x26>
    181c:	0505                	addi	a0,a0,1
    181e:	0585                	addi	a1,a1,1
    1820:	0005c783          	lbu	a5,0(a1)
    1824:	00054703          	lbu	a4,0(a0)
    1828:	fef709e3          	beq	a4,a5,181a <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    182c:	0007051b          	sext.w	a0,a4
}
    1830:	9d1d                	subw	a0,a0,a5
    1832:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1834:	4501                	li	a0,0
}
    1836:	9d1d                	subw	a0,a0,a5
    1838:	8082                	ret

000000000000183a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    183a:	c231                	beqz	a2,187e <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    183c:	00054783          	lbu	a5,0(a0)
    1840:	0005c683          	lbu	a3,0(a1)
    1844:	c795                	beqz	a5,1870 <strncmp+0x36>
    1846:	ca85                	beqz	a3,1876 <strncmp+0x3c>
    if (!n--)
    1848:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184a:	c615                	beqz	a2,1876 <strncmp+0x3c>
    184c:	00150713          	addi	a4,a0,1
    1850:	9532                	add	a0,a0,a2
    1852:	00d78963          	beq	a5,a3,1864 <strncmp+0x2a>
    1856:	a005                	j	1876 <strncmp+0x3c>
    1858:	ce99                	beqz	a3,1876 <strncmp+0x3c>
    185a:	00e50e63          	beq	a0,a4,1876 <strncmp+0x3c>
    185e:	0705                	addi	a4,a4,1
    1860:	00d79b63          	bne	a5,a3,1876 <strncmp+0x3c>
    1864:	00074783          	lbu	a5,0(a4)
    1868:	0585                	addi	a1,a1,1
    186a:	0005c683          	lbu	a3,0(a1)
    186e:	f7ed                	bnez	a5,1858 <strncmp+0x1e>
    1870:	4501                	li	a0,0
        ;
    return *l - *r;
    1872:	9d15                	subw	a0,a0,a3
    1874:	8082                	ret
    1876:	0007851b          	sext.w	a0,a5
    187a:	9d15                	subw	a0,a0,a3
    187c:	8082                	ret
        return 0;
    187e:	4501                	li	a0,0
}
    1880:	8082                	ret

0000000000001882 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1882:	00757793          	andi	a5,a0,7
    1886:	cfa1                	beqz	a5,18de <strlen+0x5c>
        if (!*s)
    1888:	00054783          	lbu	a5,0(a0)
    188c:	cbb9                	beqz	a5,18e2 <strlen+0x60>
    188e:	87aa                	mv	a5,a0
    1890:	a021                	j	1898 <strlen+0x16>
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	c329                	beqz	a4,18d8 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1898:	0785                	addi	a5,a5,1
    189a:	0077f713          	andi	a4,a5,7
    189e:	fb75                	bnez	a4,1892 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a0:	00001717          	auipc	a4,0x1
    18a4:	80070713          	addi	a4,a4,-2048 # 20a0 <__clone+0xc8>
    18a8:	630c                	ld	a1,0(a4)
    18aa:	00000717          	auipc	a4,0x0
    18ae:	7fe70713          	addi	a4,a4,2046 # 20a8 <__clone+0xd0>
    18b2:	6394                	ld	a3,0(a5)
    18b4:	6310                	ld	a2,0(a4)
    18b6:	a019                	j	18bc <strlen+0x3a>
    18b8:	07a1                	addi	a5,a5,8
    18ba:	6394                	ld	a3,0(a5)
    18bc:	00b68733          	add	a4,a3,a1
    18c0:	fff6c693          	not	a3,a3
    18c4:	8f75                	and	a4,a4,a3
    18c6:	8f71                	and	a4,a4,a2
    18c8:	db65                	beqz	a4,18b8 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	c709                	beqz	a4,18d8 <strlen+0x56>
    18d0:	0785                	addi	a5,a5,1
    18d2:	0007c703          	lbu	a4,0(a5)
    18d6:	ff6d                	bnez	a4,18d0 <strlen+0x4e>
        ;
    return s - a;
    18d8:	40a78533          	sub	a0,a5,a0
}
    18dc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18de:	87aa                	mv	a5,a0
    18e0:	b7c1                	j	18a0 <strlen+0x1e>
        if (!*s)
    18e2:	4501                	li	a0,0
            return s - a;
    18e4:	8082                	ret

00000000000018e6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e6:	00757793          	andi	a5,a0,7
    18ea:	0ff5f593          	andi	a1,a1,255
    18ee:	cb99                	beqz	a5,1904 <memchr+0x1e>
    18f0:	c655                	beqz	a2,199c <memchr+0xb6>
    18f2:	00054783          	lbu	a5,0(a0)
    18f6:	0ab78663          	beq	a5,a1,19a2 <memchr+0xbc>
    18fa:	0505                	addi	a0,a0,1
    18fc:	00757793          	andi	a5,a0,7
    1900:	167d                	addi	a2,a2,-1
    1902:	f7fd                	bnez	a5,18f0 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1904:	4701                	li	a4,0
    if (n && *s != c)
    1906:	ca49                	beqz	a2,1998 <memchr+0xb2>
    1908:	00054783          	lbu	a5,0(a0)
    190c:	08b78b63          	beq	a5,a1,19a2 <memchr+0xbc>
        size_t k = ONES * c;
    1910:	00000797          	auipc	a5,0x0
    1914:	7a078793          	addi	a5,a5,1952 # 20b0 <__clone+0xd8>
    1918:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	479d                	li	a5,7
        size_t k = ONES * c;
    191c:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1920:	08c7f863          	bleu	a2,a5,19b0 <memchr+0xca>
    1924:	611c                	ld	a5,0(a0)
    1926:	00000317          	auipc	t1,0x0
    192a:	78230313          	addi	t1,t1,1922 # 20a8 <__clone+0xd0>
    192e:	00033803          	ld	a6,0(t1)
    1932:	00f8c7b3          	xor	a5,a7,a5
    1936:	fff7c713          	not	a4,a5
    193a:	8f95                	sub	a5,a5,a3
    193c:	8ff9                	and	a5,a5,a4
    193e:	0107f7b3          	and	a5,a5,a6
    1942:	e7bd                	bnez	a5,19b0 <memchr+0xca>
    1944:	4e1d                	li	t3,7
    1946:	00000e97          	auipc	t4,0x0
    194a:	75ae8e93          	addi	t4,t4,1882 # 20a0 <__clone+0xc8>
    194e:	a005                	j	196e <memchr+0x88>
    1950:	6514                	ld	a3,8(a0)
    1952:	000eb783          	ld	a5,0(t4)
    1956:	00033803          	ld	a6,0(t1)
    195a:	00d8c6b3          	xor	a3,a7,a3
    195e:	97b6                	add	a5,a5,a3
    1960:	fff6c693          	not	a3,a3
    1964:	8ff5                	and	a5,a5,a3
    1966:	0107f7b3          	and	a5,a5,a6
    196a:	e3a1                	bnez	a5,19aa <memchr+0xc4>
    196c:	853a                	mv	a0,a4
    196e:	1661                	addi	a2,a2,-8
    1970:	00850713          	addi	a4,a0,8
    1974:	fcce6ee3          	bltu	t3,a2,1950 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1978:	c215                	beqz	a2,199c <memchr+0xb6>
    197a:	00074783          	lbu	a5,0(a4)
    197e:	00f58d63          	beq	a1,a5,1998 <memchr+0xb2>
    1982:	00170793          	addi	a5,a4,1
    1986:	963a                	add	a2,a2,a4
    1988:	873e                	mv	a4,a5
    198a:	00f60963          	beq	a2,a5,199c <memchr+0xb6>
    198e:	0007c683          	lbu	a3,0(a5)
    1992:	0785                	addi	a5,a5,1
    1994:	feb69ae3          	bne	a3,a1,1988 <memchr+0xa2>
}
    1998:	853a                	mv	a0,a4
    199a:	8082                	ret
    return n ? (void *)s : 0;
    199c:	4701                	li	a4,0
}
    199e:	853a                	mv	a0,a4
    19a0:	8082                	ret
    19a2:	872a                	mv	a4,a0
    19a4:	00074783          	lbu	a5,0(a4)
    19a8:	bfd9                	j	197e <memchr+0x98>
    19aa:	00854783          	lbu	a5,8(a0)
    19ae:	bfc1                	j	197e <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19b0:	872a                	mv	a4,a0
    19b2:	bfc1                	j	1982 <memchr+0x9c>

00000000000019b4 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19b4:	00757793          	andi	a5,a0,7
    19b8:	cfc5                	beqz	a5,1a70 <strnlen+0xbc>
    19ba:	c1c5                	beqz	a1,1a5a <strnlen+0xa6>
    19bc:	00054783          	lbu	a5,0(a0)
    19c0:	cfd9                	beqz	a5,1a5e <strnlen+0xaa>
    19c2:	87ae                	mv	a5,a1
    19c4:	86aa                	mv	a3,a0
    19c6:	a029                	j	19d0 <strnlen+0x1c>
    19c8:	cbc9                	beqz	a5,1a5a <strnlen+0xa6>
    19ca:	0006c703          	lbu	a4,0(a3)
    19ce:	cb51                	beqz	a4,1a62 <strnlen+0xae>
    19d0:	0685                	addi	a3,a3,1
    19d2:	0076f713          	andi	a4,a3,7
    19d6:	17fd                	addi	a5,a5,-1
    19d8:	fb65                	bnez	a4,19c8 <strnlen+0x14>
    if (n && *s != c)
    19da:	c3c1                	beqz	a5,1a5a <strnlen+0xa6>
    19dc:	0006c703          	lbu	a4,0(a3)
    19e0:	c349                	beqz	a4,1a62 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19e2:	471d                	li	a4,7
    19e4:	08f77a63          	bleu	a5,a4,1a78 <strnlen+0xc4>
    19e8:	00000e17          	auipc	t3,0x0
    19ec:	6b8e0e13          	addi	t3,t3,1720 # 20a0 <__clone+0xc8>
    19f0:	6290                	ld	a2,0(a3)
    19f2:	000e3703          	ld	a4,0(t3)
    19f6:	00000e97          	auipc	t4,0x0
    19fa:	6b2e8e93          	addi	t4,t4,1714 # 20a8 <__clone+0xd0>
    19fe:	000eb803          	ld	a6,0(t4)
    1a02:	9732                	add	a4,a4,a2
    1a04:	fff64613          	not	a2,a2
    1a08:	8f71                	and	a4,a4,a2
    1a0a:	01077733          	and	a4,a4,a6
    1a0e:	e72d                	bnez	a4,1a78 <strnlen+0xc4>
    1a10:	4f1d                	li	t5,7
    1a12:	a839                	j	1a30 <strnlen+0x7c>
    1a14:	6698                	ld	a4,8(a3)
    1a16:	000e3303          	ld	t1,0(t3)
    1a1a:	000eb803          	ld	a6,0(t4)
    1a1e:	fff74893          	not	a7,a4
    1a22:	971a                	add	a4,a4,t1
    1a24:	01177733          	and	a4,a4,a7
    1a28:	01077733          	and	a4,a4,a6
    1a2c:	ef1d                	bnez	a4,1a6a <strnlen+0xb6>
    1a2e:	86b2                	mv	a3,a2
    1a30:	17e1                	addi	a5,a5,-8
    1a32:	00868613          	addi	a2,a3,8
    1a36:	fcff6fe3          	bltu	t5,a5,1a14 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a3a:	c385                	beqz	a5,1a5a <strnlen+0xa6>
    1a3c:	00064703          	lbu	a4,0(a2)
    1a40:	cb19                	beqz	a4,1a56 <strnlen+0xa2>
    1a42:	00160713          	addi	a4,a2,1
    1a46:	97b2                	add	a5,a5,a2
    1a48:	863a                	mv	a2,a4
    1a4a:	00e78863          	beq	a5,a4,1a5a <strnlen+0xa6>
    1a4e:	0705                	addi	a4,a4,1
    1a50:	fff74683          	lbu	a3,-1(a4)
    1a54:	faf5                	bnez	a3,1a48 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a56:	40a605b3          	sub	a1,a2,a0
}
    1a5a:	852e                	mv	a0,a1
    1a5c:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a5e:	87ae                	mv	a5,a1
    1a60:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a62:	8636                	mv	a2,a3
    1a64:	00064703          	lbu	a4,0(a2)
    1a68:	bfe1                	j	1a40 <strnlen+0x8c>
    1a6a:	0086c703          	lbu	a4,8(a3)
    1a6e:	bfc9                	j	1a40 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a70:	87ae                	mv	a5,a1
    1a72:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a74:	f7a5                	bnez	a5,19dc <strnlen+0x28>
    1a76:	b7d5                	j	1a5a <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a78:	8636                	mv	a2,a3
    1a7a:	b7e1                	j	1a42 <strnlen+0x8e>

0000000000001a7c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a7c:	00b547b3          	xor	a5,a0,a1
    1a80:	8b9d                	andi	a5,a5,7
    1a82:	efa9                	bnez	a5,1adc <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a84:	0075f793          	andi	a5,a1,7
    1a88:	c38d                	beqz	a5,1aaa <strcpy+0x2e>
            if (!(*d = *s))
    1a8a:	0005c783          	lbu	a5,0(a1)
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	e799                	bnez	a5,1aa0 <strcpy+0x24>
    1a94:	a095                	j	1af8 <strcpy+0x7c>
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	00f50023          	sb	a5,0(a0)
    1a9e:	cbb9                	beqz	a5,1af4 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aa0:	0585                	addi	a1,a1,1
    1aa2:	0075f793          	andi	a5,a1,7
    1aa6:	0505                	addi	a0,a0,1
    1aa8:	f7fd                	bnez	a5,1a96 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aaa:	00000797          	auipc	a5,0x0
    1aae:	5f678793          	addi	a5,a5,1526 # 20a0 <__clone+0xc8>
    1ab2:	0007b803          	ld	a6,0(a5)
    1ab6:	00000797          	auipc	a5,0x0
    1aba:	5f278793          	addi	a5,a5,1522 # 20a8 <__clone+0xd0>
    1abe:	6198                	ld	a4,0(a1)
    1ac0:	6390                	ld	a2,0(a5)
    1ac2:	a031                	j	1ace <strcpy+0x52>
    1ac4:	0521                	addi	a0,a0,8
    1ac6:	05a1                	addi	a1,a1,8
    1ac8:	fee53c23          	sd	a4,-8(a0)
    1acc:	6198                	ld	a4,0(a1)
    1ace:	010707b3          	add	a5,a4,a6
    1ad2:	fff74693          	not	a3,a4
    1ad6:	8ff5                	and	a5,a5,a3
    1ad8:	8ff1                	and	a5,a5,a2
    1ada:	d7ed                	beqz	a5,1ac4 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1adc:	0005c783          	lbu	a5,0(a1)
    1ae0:	00f50023          	sb	a5,0(a0)
    1ae4:	cb89                	beqz	a5,1af6 <strcpy+0x7a>
    1ae6:	0585                	addi	a1,a1,1
    1ae8:	0005c783          	lbu	a5,0(a1)
    1aec:	0505                	addi	a0,a0,1
    1aee:	00f50023          	sb	a5,0(a0)
    1af2:	fbf5                	bnez	a5,1ae6 <strcpy+0x6a>
        ;
    return d;
}
    1af4:	8082                	ret
    1af6:	8082                	ret
    1af8:	8082                	ret

0000000000001afa <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1afa:	00b547b3          	xor	a5,a0,a1
    1afe:	8b9d                	andi	a5,a5,7
    1b00:	ebc1                	bnez	a5,1b90 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b02:	0075f793          	andi	a5,a1,7
    1b06:	cf91                	beqz	a5,1b22 <strncpy+0x28>
    1b08:	20060e63          	beqz	a2,1d24 <strncpy+0x22a>
    1b0c:	0005c783          	lbu	a5,0(a1)
    1b10:	00f50023          	sb	a5,0(a0)
    1b14:	c3d5                	beqz	a5,1bb8 <strncpy+0xbe>
    1b16:	0585                	addi	a1,a1,1
    1b18:	0075f793          	andi	a5,a1,7
    1b1c:	167d                	addi	a2,a2,-1
    1b1e:	0505                	addi	a0,a0,1
    1b20:	f7e5                	bnez	a5,1b08 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b22:	20060163          	beqz	a2,1d24 <strncpy+0x22a>
    1b26:	0005c683          	lbu	a3,0(a1)
    1b2a:	c6d9                	beqz	a3,1bb8 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2c:	479d                	li	a5,7
    1b2e:	22c7f563          	bleu	a2,a5,1d58 <strncpy+0x25e>
    1b32:	00000317          	auipc	t1,0x0
    1b36:	56e30313          	addi	t1,t1,1390 # 20a0 <__clone+0xc8>
    1b3a:	6198                	ld	a4,0(a1)
    1b3c:	00033783          	ld	a5,0(t1)
    1b40:	00000e17          	auipc	t3,0x0
    1b44:	568e0e13          	addi	t3,t3,1384 # 20a8 <__clone+0xd0>
    1b48:	000e3803          	ld	a6,0(t3)
    1b4c:	97ba                	add	a5,a5,a4
    1b4e:	fff74893          	not	a7,a4
    1b52:	0117f7b3          	and	a5,a5,a7
    1b56:	0107f7b3          	and	a5,a5,a6
    1b5a:	1e079f63          	bnez	a5,1d58 <strncpy+0x25e>
    1b5e:	4e9d                	li	t4,7
    1b60:	a005                	j	1b80 <strncpy+0x86>
    1b62:	6598                	ld	a4,8(a1)
    1b64:	00033783          	ld	a5,0(t1)
    1b68:	000e3803          	ld	a6,0(t3)
    1b6c:	fff74893          	not	a7,a4
    1b70:	97ba                	add	a5,a5,a4
    1b72:	0117f7b3          	and	a5,a5,a7
    1b76:	0107f7b3          	and	a5,a5,a6
    1b7a:	1a079f63          	bnez	a5,1d38 <strncpy+0x23e>
    1b7e:	85b6                	mv	a1,a3
            *wd = *ws;
    1b80:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b82:	1661                	addi	a2,a2,-8
    1b84:	00858693          	addi	a3,a1,8
    1b88:	0521                	addi	a0,a0,8
    1b8a:	fcceece3          	bltu	t4,a2,1b62 <strncpy+0x68>
    1b8e:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b90:	18060a63          	beqz	a2,1d24 <strncpy+0x22a>
    1b94:	0005c783          	lbu	a5,0(a1)
    1b98:	872a                	mv	a4,a0
    1b9a:	00f50023          	sb	a5,0(a0)
    1b9e:	e799                	bnez	a5,1bac <strncpy+0xb2>
    1ba0:	a829                	j	1bba <strncpy+0xc0>
    1ba2:	0005c783          	lbu	a5,0(a1)
    1ba6:	00f70023          	sb	a5,0(a4)
    1baa:	cb81                	beqz	a5,1bba <strncpy+0xc0>
    1bac:	167d                	addi	a2,a2,-1
    1bae:	0585                	addi	a1,a1,1
    1bb0:	0705                	addi	a4,a4,1
    1bb2:	fa65                	bnez	a2,1ba2 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bb4:	853a                	mv	a0,a4
    1bb6:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bb8:	872a                	mv	a4,a0
    1bba:	4805                	li	a6,1
    1bbc:	14061c63          	bnez	a2,1d14 <strncpy+0x21a>
    1bc0:	40e007b3          	neg	a5,a4
    1bc4:	8b9d                	andi	a5,a5,7
    1bc6:	4581                	li	a1,0
    1bc8:	12061e63          	bnez	a2,1d04 <strncpy+0x20a>
    1bcc:	00778693          	addi	a3,a5,7
    1bd0:	452d                	li	a0,11
    1bd2:	12a6e763          	bltu	a3,a0,1d00 <strncpy+0x206>
    1bd6:	16d5e663          	bltu	a1,a3,1d42 <strncpy+0x248>
    1bda:	14078c63          	beqz	a5,1d32 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bde:	00070023          	sb	zero,0(a4)
    1be2:	4585                	li	a1,1
    1be4:	00170693          	addi	a3,a4,1
    1be8:	14b78363          	beq	a5,a1,1d2e <strncpy+0x234>
    1bec:	000700a3          	sb	zero,1(a4)
    1bf0:	4589                	li	a1,2
    1bf2:	00270693          	addi	a3,a4,2
    1bf6:	14b78963          	beq	a5,a1,1d48 <strncpy+0x24e>
    1bfa:	00070123          	sb	zero,2(a4)
    1bfe:	458d                	li	a1,3
    1c00:	00370693          	addi	a3,a4,3
    1c04:	12b78363          	beq	a5,a1,1d2a <strncpy+0x230>
    1c08:	000701a3          	sb	zero,3(a4)
    1c0c:	4591                	li	a1,4
    1c0e:	00470693          	addi	a3,a4,4
    1c12:	12b78d63          	beq	a5,a1,1d4c <strncpy+0x252>
    1c16:	00070223          	sb	zero,4(a4)
    1c1a:	4595                	li	a1,5
    1c1c:	00570693          	addi	a3,a4,5
    1c20:	12b78863          	beq	a5,a1,1d50 <strncpy+0x256>
    1c24:	000702a3          	sb	zero,5(a4)
    1c28:	459d                	li	a1,7
    1c2a:	00670693          	addi	a3,a4,6
    1c2e:	12b79363          	bne	a5,a1,1d54 <strncpy+0x25a>
    1c32:	00770693          	addi	a3,a4,7
    1c36:	00070323          	sb	zero,6(a4)
    1c3a:	40f80833          	sub	a6,a6,a5
    1c3e:	ff887513          	andi	a0,a6,-8
    1c42:	97ba                	add	a5,a5,a4
    1c44:	953e                	add	a0,a0,a5
    1c46:	0007b023          	sd	zero,0(a5)
    1c4a:	07a1                	addi	a5,a5,8
    1c4c:	fea79de3          	bne	a5,a0,1c46 <strncpy+0x14c>
    1c50:	ff887513          	andi	a0,a6,-8
    1c54:	9da9                	addw	a1,a1,a0
    1c56:	00a687b3          	add	a5,a3,a0
    1c5a:	f4a80de3          	beq	a6,a0,1bb4 <strncpy+0xba>
    1c5e:	00078023          	sb	zero,0(a5)
    1c62:	0015869b          	addiw	a3,a1,1
    1c66:	f4c6f7e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1c6a:	000780a3          	sb	zero,1(a5)
    1c6e:	0025869b          	addiw	a3,a1,2
    1c72:	f4c6f1e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1c76:	00078123          	sb	zero,2(a5)
    1c7a:	0035869b          	addiw	a3,a1,3
    1c7e:	f2c6fbe3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1c82:	000781a3          	sb	zero,3(a5)
    1c86:	0045869b          	addiw	a3,a1,4
    1c8a:	f2c6f5e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1c8e:	00078223          	sb	zero,4(a5)
    1c92:	0055869b          	addiw	a3,a1,5
    1c96:	f0c6ffe3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1c9a:	000782a3          	sb	zero,5(a5)
    1c9e:	0065869b          	addiw	a3,a1,6
    1ca2:	f0c6f9e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1ca6:	00078323          	sb	zero,6(a5)
    1caa:	0075869b          	addiw	a3,a1,7
    1cae:	f0c6f3e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1cb2:	000783a3          	sb	zero,7(a5)
    1cb6:	0085869b          	addiw	a3,a1,8
    1cba:	eec6fde3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1cbe:	00078423          	sb	zero,8(a5)
    1cc2:	0095869b          	addiw	a3,a1,9
    1cc6:	eec6f7e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1cca:	000784a3          	sb	zero,9(a5)
    1cce:	00a5869b          	addiw	a3,a1,10
    1cd2:	eec6f1e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1cd6:	00078523          	sb	zero,10(a5)
    1cda:	00b5869b          	addiw	a3,a1,11
    1cde:	ecc6fbe3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1ce2:	000785a3          	sb	zero,11(a5)
    1ce6:	00c5869b          	addiw	a3,a1,12
    1cea:	ecc6f5e3          	bleu	a2,a3,1bb4 <strncpy+0xba>
    1cee:	00078623          	sb	zero,12(a5)
    1cf2:	25b5                	addiw	a1,a1,13
    1cf4:	ecc5f0e3          	bleu	a2,a1,1bb4 <strncpy+0xba>
    1cf8:	000786a3          	sb	zero,13(a5)
}
    1cfc:	853a                	mv	a0,a4
    1cfe:	8082                	ret
    1d00:	46ad                	li	a3,11
    1d02:	bdd1                	j	1bd6 <strncpy+0xdc>
    1d04:	00778693          	addi	a3,a5,7
    1d08:	452d                	li	a0,11
    1d0a:	fff60593          	addi	a1,a2,-1
    1d0e:	eca6f4e3          	bleu	a0,a3,1bd6 <strncpy+0xdc>
    1d12:	b7fd                	j	1d00 <strncpy+0x206>
    1d14:	40e007b3          	neg	a5,a4
    1d18:	8832                	mv	a6,a2
    1d1a:	8b9d                	andi	a5,a5,7
    1d1c:	4581                	li	a1,0
    1d1e:	ea0607e3          	beqz	a2,1bcc <strncpy+0xd2>
    1d22:	b7cd                	j	1d04 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d24:	872a                	mv	a4,a0
}
    1d26:	853a                	mv	a0,a4
    1d28:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d2a:	458d                	li	a1,3
    1d2c:	b739                	j	1c3a <strncpy+0x140>
    1d2e:	4585                	li	a1,1
    1d30:	b729                	j	1c3a <strncpy+0x140>
    1d32:	86ba                	mv	a3,a4
    1d34:	4581                	li	a1,0
    1d36:	b711                	j	1c3a <strncpy+0x140>
    1d38:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d3c:	872a                	mv	a4,a0
    1d3e:	85b6                	mv	a1,a3
    1d40:	bda9                	j	1b9a <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d42:	87ba                	mv	a5,a4
    1d44:	4581                	li	a1,0
    1d46:	bf21                	j	1c5e <strncpy+0x164>
    1d48:	4589                	li	a1,2
    1d4a:	bdc5                	j	1c3a <strncpy+0x140>
    1d4c:	4591                	li	a1,4
    1d4e:	b5f5                	j	1c3a <strncpy+0x140>
    1d50:	4595                	li	a1,5
    1d52:	b5e5                	j	1c3a <strncpy+0x140>
    1d54:	4599                	li	a1,6
    1d56:	b5d5                	j	1c3a <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d58:	00d50023          	sb	a3,0(a0)
    1d5c:	872a                	mv	a4,a0
    1d5e:	b5b9                	j	1bac <strncpy+0xb2>

0000000000001d60 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d60:	87aa                	mv	a5,a0
    1d62:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d64:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d6c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d6e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d70:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <openat>:
    register long a7 __asm__("a7") = n;
    1d78:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d7c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d80:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <close>:
    register long a7 __asm__("a7") = n;
    1d88:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d8c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <read>:
    register long a7 __asm__("a7") = n;
    1d94:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d98:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d9c:	8082                	ret

0000000000001d9e <write>:
    register long a7 __asm__("a7") = n;
    1d9e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1da6:	8082                	ret

0000000000001da8 <getpid>:
    register long a7 __asm__("a7") = n;
    1da8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dac:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <getppid>:
    register long a7 __asm__("a7") = n;
    1db4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1db8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dc0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dc4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <fork>:
    register long a7 __asm__("a7") = n;
    1dcc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dd0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dd2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ddc:	85b2                	mv	a1,a2
    1dde:	863a                	mv	a2,a4
    if (stack)
    1de0:	c191                	beqz	a1,1de4 <clone+0x8>
	stack += stack_size;
    1de2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1de4:	4781                	li	a5,0
    1de6:	4701                	li	a4,0
    1de8:	4681                	li	a3,0
    1dea:	2601                	sext.w	a2,a2
    1dec:	1ec0006f          	j	1fd8 <__clone>

0000000000001df0 <exit>:
    register long a7 __asm__("a7") = n;
    1df0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1df8:	8082                	ret

0000000000001dfa <waitpid>:
    register long a7 __asm__("a7") = n;
    1dfa:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dfe:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e00:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <exec>:
    register long a7 __asm__("a7") = n;
    1e08:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <execve>:
    register long a7 __asm__("a7") = n;
    1e14:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e18:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <times>:
    register long a7 __asm__("a7") = n;
    1e20:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <get_time>:

int64 get_time()
{
    1e2c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e2e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e32:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	ed09                	bnez	a0,1e56 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e3e:	67a2                	ld	a5,8(sp)
    1e40:	3e800713          	li	a4,1000
    1e44:	00015503          	lhu	a0,0(sp)
    1e48:	02e7d7b3          	divu	a5,a5,a4
    1e4c:	02e50533          	mul	a0,a0,a4
    1e50:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e52:	0141                	addi	sp,sp,16
    1e54:	8082                	ret
        return -1;
    1e56:	557d                	li	a0,-1
    1e58:	bfed                	j	1e52 <get_time+0x26>

0000000000001e5a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e5a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <time>:
    register long a7 __asm__("a7") = n;
    1e66:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e6a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <sleep>:

int sleep(unsigned long long time)
{
    1e72:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e74:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e76:	850a                	mv	a0,sp
    1e78:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e7a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e7e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e84:	e501                	bnez	a0,1e8c <sleep+0x1a>
    return 0;
    1e86:	4501                	li	a0,0
}
    1e88:	0141                	addi	sp,sp,16
    1e8a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e8c:	4502                	lw	a0,0(sp)
}
    1e8e:	0141                	addi	sp,sp,16
    1e90:	8082                	ret

0000000000001e92 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e92:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e96:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	8082                	ret

0000000000001e9e <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e9e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ea2:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ea6:	8082                	ret

0000000000001ea8 <munmap>:
    register long a7 __asm__("a7") = n;
    1ea8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <wait>:

int wait(int *code)
{
    1eb4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eb6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eba:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ebc:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ebe:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ec0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <spawn>:
    register long a7 __asm__("a7") = n;
    1ec8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ecc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <mailread>:
    register long a7 __asm__("a7") = n;
    1ed4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ee0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <fstat>:
    register long a7 __asm__("a7") = n;
    1eec:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ef8:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1efa:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1efe:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f00:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f08:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f0e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f10:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <link>:

int link(char *old_path, char *new_path)
{
    1f18:	87aa                	mv	a5,a0
    1f1a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f1c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f20:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f24:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f26:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f2a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <unlink>:

int unlink(char *path)
{
    1f34:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f36:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f3a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f3e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f40:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <uname>:
    register long a7 __asm__("a7") = n;
    1f48:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f4c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <brk>:
    register long a7 __asm__("a7") = n;
    1f54:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f58:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f60:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f62:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f66:	8082                	ret

0000000000001f68 <chdir>:
    register long a7 __asm__("a7") = n;
    1f68:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f6c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f74:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f76:	02059613          	slli	a2,a1,0x20
    1f7a:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f7c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f84:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f86:	00000073          	ecall
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <getdents>:
    register long a7 __asm__("a7") = n;
    1f8e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f92:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f96:	2501                	sext.w	a0,a0
    1f98:	8082                	ret

0000000000001f9a <pipe>:
    register long a7 __asm__("a7") = n;
    1f9a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <dup>:
    register long a7 __asm__("a7") = n;
    1fa8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1faa:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <dup2>:
    register long a7 __asm__("a7") = n;
    1fb2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fb4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fba:	2501                	sext.w	a0,a0
    1fbc:	8082                	ret

0000000000001fbe <mount>:
    register long a7 __asm__("a7") = n;
    1fbe:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fc6:	2501                	sext.w	a0,a0
    1fc8:	8082                	ret

0000000000001fca <umount>:
    register long a7 __asm__("a7") = n;
    1fca:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fce:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fd0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fd4:	2501                	sext.w	a0,a0
    1fd6:	8082                	ret

0000000000001fd8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fd8:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fda:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fdc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fde:	8532                	mv	a0,a2
	mv a2, a4
    1fe0:	863a                	mv	a2,a4
	mv a3, a5
    1fe2:	86be                	mv	a3,a5
	mv a4, a6
    1fe4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fe6:	0dc00893          	li	a7,220
	ecall
    1fea:	00000073          	ecall

	beqz a0, 1f
    1fee:	c111                	beqz	a0,1ff2 <__clone+0x1a>
	# Parent
	ret
    1ff0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ff2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ff4:	6522                	ld	a0,8(sp)
	jalr a1
    1ff6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ff8:	05d00893          	li	a7,93
	ecall
    1ffc:	00000073          	ecall
