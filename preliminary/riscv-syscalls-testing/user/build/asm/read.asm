
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/read:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0ac0006f          	j	10ae <__start_main>

0000000000001006 <test_read>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_read() {
    1006:	712d                	addi	sp,sp,-288
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fe050513          	addi	a0,a0,-32 # 1fe8 <__clone+0x2a>
void test_read() {
    1010:	ee06                	sd	ra,280(sp)
    1012:	ea22                	sd	s0,272(sp)
	TEST_START(__func__);
    1014:	29a000ef          	jal	ra,12ae <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	05850513          	addi	a0,a0,88 # 2070 <__func__.1185>
    1020:	28e000ef          	jal	ra,12ae <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fdc50513          	addi	a0,a0,-36 # 2000 <__clone+0x42>
    102c:	282000ef          	jal	ra,12ae <puts>
	int fd = open("./text.txt", 0);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	fde50513          	addi	a0,a0,-34 # 2010 <__clone+0x52>
    103a:	50d000ef          	jal	ra,1d46 <open>
	char buf[256];
	int size = read(fd, buf, 256);
    103e:	10000613          	li	a2,256
    1042:	080c                	addi	a1,sp,16
	int fd = open("./text.txt", 0);
    1044:	842a                	mv	s0,a0
	int size = read(fd, buf, 256);
    1046:	535000ef          	jal	ra,1d7a <read>
    104a:	0005061b          	sext.w	a2,a0
	assert(size >= 0);
    104e:	02064f63          	bltz	a2,108c <test_read+0x86>

	write(STDOUT, buf, size);
    1052:	080c                	addi	a1,sp,16
    1054:	4505                	li	a0,1
    1056:	52f000ef          	jal	ra,1d84 <write>
	close(fd);
    105a:	8522                	mv	a0,s0
    105c:	513000ef          	jal	ra,1d6e <close>
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	fe050513          	addi	a0,a0,-32 # 2040 <__clone+0x82>
    1068:	246000ef          	jal	ra,12ae <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	00450513          	addi	a0,a0,4 # 2070 <__func__.1185>
    1074:	23a000ef          	jal	ra,12ae <puts>
    1078:	00001517          	auipc	a0,0x1
    107c:	f8850513          	addi	a0,a0,-120 # 2000 <__clone+0x42>
    1080:	22e000ef          	jal	ra,12ae <puts>
}
    1084:	60f2                	ld	ra,280(sp)
    1086:	6452                	ld	s0,272(sp)
    1088:	6115                	addi	sp,sp,288
    108a:	8082                	ret
	assert(size >= 0);
    108c:	00001517          	auipc	a0,0x1
    1090:	f9450513          	addi	a0,a0,-108 # 2020 <__clone+0x62>
    1094:	e432                	sd	a2,8(sp)
    1096:	4de000ef          	jal	ra,1574 <panic>
    109a:	6622                	ld	a2,8(sp)
    109c:	bf5d                	j	1052 <test_read+0x4c>

000000000000109e <main>:

int main(void) {
    109e:	1141                	addi	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
	test_read();
    10a2:	f65ff0ef          	jal	ra,1006 <test_read>
	return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	addi	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ae:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b0:	4108                	lw	a0,0(a0)
{
    10b2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b4:	05a1                	addi	a1,a1,8
{
    10b6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b8:	fe7ff0ef          	jal	ra,109e <main>
    10bc:	51b000ef          	jal	ra,1dd6 <exit>
	return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	addi	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c8:	7179                	addi	sp,sp,-48
    10ca:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10cc:	12054e63          	bltz	a0,1208 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10d0:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10d4:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d6:	02b7f6bb          	remuw	a3,a5,a1
    10da:	00001717          	auipc	a4,0x1
    10de:	fa670713          	addi	a4,a4,-90 # 2080 <digits>
    buf[16] = 0;
    10e2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e6:	1682                	slli	a3,a3,0x20
    10e8:	9281                	srli	a3,a3,0x20
    10ea:	96ba                	add	a3,a3,a4
    10ec:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10f0:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10f4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10f8:	16b7e363          	bltu	a5,a1,125e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10fc:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1100:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1104:	1602                	slli	a2,a2,0x20
    1106:	9201                	srli	a2,a2,0x20
    1108:	963a                	add	a2,a2,a4
    110a:	00064603          	lbu	a2,0(a2)
    110e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1112:	0007861b          	sext.w	a2,a5
    1116:	12b6e863          	bltu	a3,a1,1246 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    111a:	02b7f6bb          	remuw	a3,a5,a1
    111e:	1682                	slli	a3,a3,0x20
    1120:	9281                	srli	a3,a3,0x20
    1122:	96ba                	add	a3,a3,a4
    1124:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1128:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    112c:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1130:	10b66e63          	bltu	a2,a1,124c <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1134:	02b876bb          	remuw	a3,a6,a1
    1138:	1682                	slli	a3,a3,0x20
    113a:	9281                	srli	a3,a3,0x20
    113c:	96ba                	add	a3,a3,a4
    113e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1142:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1146:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    114a:	10b86463          	bltu	a6,a1,1252 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    114e:	02b676bb          	remuw	a3,a2,a1
    1152:	1682                	slli	a3,a3,0x20
    1154:	9281                	srli	a3,a3,0x20
    1156:	96ba                	add	a3,a3,a4
    1158:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1160:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1164:	0eb66a63          	bltu	a2,a1,1258 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1168:	02b876bb          	remuw	a3,a6,a1
    116c:	1682                	slli	a3,a3,0x20
    116e:	9281                	srli	a3,a3,0x20
    1170:	96ba                	add	a3,a3,a4
    1172:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1176:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    117a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    117e:	0cb86163          	bltu	a6,a1,1240 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1182:	02b676bb          	remuw	a3,a2,a1
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96ba                	add	a3,a3,a4
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1194:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1198:	0cb66563          	bltu	a2,a1,1262 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    119c:	02b876bb          	remuw	a3,a6,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ae:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11b2:	0ab86b63          	bltu	a6,a1,1268 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11b6:	02b676bb          	remuw	a3,a2,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11c8:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11cc:	0ab66163          	bltu	a2,a1,126e <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11d0:	1782                	slli	a5,a5,0x20
    11d2:	9381                	srli	a5,a5,0x20
    11d4:	97ba                	add	a5,a5,a4
    11d6:	0007c703          	lbu	a4,0(a5)
    11da:	4599                	li	a1,6
    11dc:	4795                	li	a5,5
    11de:	00e10723          	sb	a4,14(sp)

    if (sign)
    11e2:	00055963          	bgez	a0,11f4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e6:	1018                	addi	a4,sp,32
    11e8:	973e                	add	a4,a4,a5
    11ea:	02d00693          	li	a3,45
    11ee:	fed70423          	sb	a3,-24(a4)
    11f2:	85be                	mv	a1,a5
    write(f, s, l);
    11f4:	003c                	addi	a5,sp,8
    11f6:	4641                	li	a2,16
    11f8:	9e0d                	subw	a2,a2,a1
    11fa:	4505                	li	a0,1
    11fc:	95be                	add	a1,a1,a5
    11fe:	387000ef          	jal	ra,1d84 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1202:	70a2                	ld	ra,40(sp)
    1204:	6145                	addi	sp,sp,48
    1206:	8082                	ret
        x = -xx;
    1208:	40a0063b          	negw	a2,a0
    120c:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    120e:	02b677bb          	remuw	a5,a2,a1
    1212:	00001717          	auipc	a4,0x1
    1216:	e6e70713          	addi	a4,a4,-402 # 2080 <digits>
    buf[16] = 0;
    121a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    121e:	1782                	slli	a5,a5,0x20
    1220:	9381                	srli	a5,a5,0x20
    1222:	97ba                	add	a5,a5,a4
    1224:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1228:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    122c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1230:	ecb676e3          	bleu	a1,a2,10fc <printint.constprop.0+0x34>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123c:	45b9                	li	a1,14
    123e:	bf5d                	j	11f4 <printint.constprop.0+0x12c>
    1240:	47a5                	li	a5,9
    1242:	45a9                	li	a1,10
    1244:	bf79                	j	11e2 <printint.constprop.0+0x11a>
    1246:	47b5                	li	a5,13
    1248:	45b9                	li	a1,14
    124a:	bf61                	j	11e2 <printint.constprop.0+0x11a>
    124c:	47b1                	li	a5,12
    124e:	45b5                	li	a1,13
    1250:	bf49                	j	11e2 <printint.constprop.0+0x11a>
    1252:	47ad                	li	a5,11
    1254:	45b1                	li	a1,12
    1256:	b771                	j	11e2 <printint.constprop.0+0x11a>
    1258:	47a9                	li	a5,10
    125a:	45ad                	li	a1,11
    125c:	b759                	j	11e2 <printint.constprop.0+0x11a>
    i = 15;
    125e:	45bd                	li	a1,15
    1260:	bf51                	j	11f4 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1262:	47a1                	li	a5,8
    1264:	45a5                	li	a1,9
    1266:	bfb5                	j	11e2 <printint.constprop.0+0x11a>
    1268:	479d                	li	a5,7
    126a:	45a1                	li	a1,8
    126c:	bf9d                	j	11e2 <printint.constprop.0+0x11a>
    126e:	4799                	li	a5,6
    1270:	459d                	li	a1,7
    1272:	bf85                	j	11e2 <printint.constprop.0+0x11a>

0000000000001274 <getchar>:
{
    1274:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1276:	00f10593          	addi	a1,sp,15
    127a:	4605                	li	a2,1
    127c:	4501                	li	a0,0
{
    127e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1280:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1284:	2f7000ef          	jal	ra,1d7a <read>
}
    1288:	60e2                	ld	ra,24(sp)
    128a:	00f14503          	lbu	a0,15(sp)
    128e:	6105                	addi	sp,sp,32
    1290:	8082                	ret

0000000000001292 <putchar>:
{
    1292:	1101                	addi	sp,sp,-32
    char byte = c;
    1294:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1298:	00f10593          	addi	a1,sp,15
    129c:	4605                	li	a2,1
    129e:	4505                	li	a0,1
{
    12a0:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12a2:	2e3000ef          	jal	ra,1d84 <write>
}
    12a6:	60e2                	ld	ra,24(sp)
    12a8:	2501                	sext.w	a0,a0
    12aa:	6105                	addi	sp,sp,32
    12ac:	8082                	ret

00000000000012ae <puts>:
{
    12ae:	1141                	addi	sp,sp,-16
    12b0:	e406                	sd	ra,8(sp)
    12b2:	e022                	sd	s0,0(sp)
    12b4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b6:	5b2000ef          	jal	ra,1868 <strlen>
    12ba:	862a                	mv	a2,a0
    12bc:	85a2                	mv	a1,s0
    12be:	4505                	li	a0,1
    12c0:	2c5000ef          	jal	ra,1d84 <write>
}
    12c4:	60a2                	ld	ra,8(sp)
    12c6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12c8:	957d                	srai	a0,a0,0x3f
    return r;
    12ca:	2501                	sext.w	a0,a0
}
    12cc:	0141                	addi	sp,sp,16
    12ce:	8082                	ret

00000000000012d0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d0:	7131                	addi	sp,sp,-192
    12d2:	e0da                	sd	s6,64(sp)
    12d4:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12d6:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12d8:	013c                	addi	a5,sp,136
{
    12da:	f0ca                	sd	s2,96(sp)
    12dc:	ecce                	sd	s3,88(sp)
    12de:	e8d2                	sd	s4,80(sp)
    12e0:	e4d6                	sd	s5,72(sp)
    12e2:	fc5e                	sd	s7,56(sp)
    12e4:	fc86                	sd	ra,120(sp)
    12e6:	f8a2                	sd	s0,112(sp)
    12e8:	f4a6                	sd	s1,104(sp)
    12ea:	89aa                	mv	s3,a0
    12ec:	e52e                	sd	a1,136(sp)
    12ee:	e932                	sd	a2,144(sp)
    12f0:	ed36                	sd	a3,152(sp)
    12f2:	f13a                	sd	a4,160(sp)
    12f4:	f942                	sd	a6,176(sp)
    12f6:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12f8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12fa:	02500913          	li	s2,37
    12fe:	07000a93          	li	s5,112
    buf[i++] = '0';
    1302:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1306:	00001a17          	auipc	s4,0x1
    130a:	d7aa0a13          	addi	s4,s4,-646 # 2080 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    130e:	00001b97          	auipc	s7,0x1
    1312:	d42b8b93          	addi	s7,s7,-702 # 2050 <__clone+0x92>
        if (!*s)
    1316:	0009c783          	lbu	a5,0(s3)
    131a:	cfb9                	beqz	a5,1378 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    131c:	23278d63          	beq	a5,s2,1556 <printf+0x286>
    1320:	864e                	mv	a2,s3
    1322:	a019                	j	1328 <printf+0x58>
    1324:	07278563          	beq	a5,s2,138e <printf+0xbe>
    1328:	0605                	addi	a2,a2,1
    132a:	00064783          	lbu	a5,0(a2)
    132e:	fbfd                	bnez	a5,1324 <printf+0x54>
    1330:	84b2                	mv	s1,a2
        l = z - a;
    1332:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1336:	8622                	mv	a2,s0
    1338:	85ce                	mv	a1,s3
    133a:	4505                	li	a0,1
    133c:	249000ef          	jal	ra,1d84 <write>
        if (l)
    1340:	ec3d                	bnez	s0,13be <printf+0xee>
        if (s[1] == 0)
    1342:	0014c783          	lbu	a5,1(s1)
    1346:	cb8d                	beqz	a5,1378 <printf+0xa8>
        switch (s[1])
    1348:	09578b63          	beq	a5,s5,13de <printf+0x10e>
    134c:	06fafb63          	bleu	a5,s5,13c2 <printf+0xf2>
    1350:	07300713          	li	a4,115
    1354:	1ce78e63          	beq	a5,a4,1530 <printf+0x260>
    1358:	07800713          	li	a4,120
    135c:	1ae79563          	bne	a5,a4,1506 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1360:	6782                	ld	a5,0(sp)
    1362:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1364:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1368:	4388                	lw	a0,0(a5)
    136a:	07a1                	addi	a5,a5,8
    136c:	e03e                	sd	a5,0(sp)
    136e:	d5bff0ef          	jal	ra,10c8 <printint.constprop.0>
        if (!*s)
    1372:	0009c783          	lbu	a5,0(s3)
    1376:	f3dd                	bnez	a5,131c <printf+0x4c>
    }
    va_end(ap);
}
    1378:	70e6                	ld	ra,120(sp)
    137a:	7446                	ld	s0,112(sp)
    137c:	74a6                	ld	s1,104(sp)
    137e:	7906                	ld	s2,96(sp)
    1380:	69e6                	ld	s3,88(sp)
    1382:	6a46                	ld	s4,80(sp)
    1384:	6aa6                	ld	s5,72(sp)
    1386:	6b06                	ld	s6,64(sp)
    1388:	7be2                	ld	s7,56(sp)
    138a:	6129                	addi	sp,sp,192
    138c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    138e:	00164783          	lbu	a5,1(a2)
    1392:	84b2                	mv	s1,a2
    1394:	01278763          	beq	a5,s2,13a2 <printf+0xd2>
    1398:	bf69                	j	1332 <printf+0x62>
    139a:	0014c783          	lbu	a5,1(s1)
    139e:	f9279ae3          	bne	a5,s2,1332 <printf+0x62>
    13a2:	0489                	addi	s1,s1,2
    13a4:	0004c783          	lbu	a5,0(s1)
    13a8:	0605                	addi	a2,a2,1
    13aa:	ff2788e3          	beq	a5,s2,139a <printf+0xca>
        l = z - a;
    13ae:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13b2:	8622                	mv	a2,s0
    13b4:	85ce                	mv	a1,s3
    13b6:	4505                	li	a0,1
    13b8:	1cd000ef          	jal	ra,1d84 <write>
        if (l)
    13bc:	d059                	beqz	s0,1342 <printf+0x72>
    13be:	89a6                	mv	s3,s1
    13c0:	bf99                	j	1316 <printf+0x46>
    13c2:	06400713          	li	a4,100
    13c6:	14e79063          	bne	a5,a4,1506 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13ca:	6782                	ld	a5,0(sp)
    13cc:	45a9                	li	a1,10
        s += 2;
    13ce:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13d2:	4388                	lw	a0,0(a5)
    13d4:	07a1                	addi	a5,a5,8
    13d6:	e03e                	sd	a5,0(sp)
    13d8:	cf1ff0ef          	jal	ra,10c8 <printint.constprop.0>
        s += 2;
    13dc:	bf59                	j	1372 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13de:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13e4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13e6:	631c                	ld	a5,0(a4)
    13e8:	0721                	addi	a4,a4,8
    13ea:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ec:	00479293          	slli	t0,a5,0x4
    13f0:	00879f93          	slli	t6,a5,0x8
    13f4:	00c79f13          	slli	t5,a5,0xc
    13f8:	01079e93          	slli	t4,a5,0x10
    13fc:	01479e13          	slli	t3,a5,0x14
    1400:	01879313          	slli	t1,a5,0x18
    1404:	01c79893          	slli	a7,a5,0x1c
    1408:	02479813          	slli	a6,a5,0x24
    140c:	02879513          	slli	a0,a5,0x28
    1410:	02c79593          	slli	a1,a5,0x2c
    1414:	03079693          	slli	a3,a5,0x30
    1418:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141c:	03c7d413          	srli	s0,a5,0x3c
    1420:	01c7d39b          	srliw	t2,a5,0x1c
    1424:	03c2d293          	srli	t0,t0,0x3c
    1428:	03cfdf93          	srli	t6,t6,0x3c
    142c:	03cf5f13          	srli	t5,t5,0x3c
    1430:	03cede93          	srli	t4,t4,0x3c
    1434:	03ce5e13          	srli	t3,t3,0x3c
    1438:	03c35313          	srli	t1,t1,0x3c
    143c:	03c8d893          	srli	a7,a7,0x3c
    1440:	03c85813          	srli	a6,a6,0x3c
    1444:	9171                	srli	a0,a0,0x3c
    1446:	91f1                	srli	a1,a1,0x3c
    1448:	92f1                	srli	a3,a3,0x3c
    144a:	9371                	srli	a4,a4,0x3c
    144c:	96d2                	add	a3,a3,s4
    144e:	9752                	add	a4,a4,s4
    1450:	9452                	add	s0,s0,s4
    1452:	92d2                	add	t0,t0,s4
    1454:	9fd2                	add	t6,t6,s4
    1456:	9f52                	add	t5,t5,s4
    1458:	9ed2                	add	t4,t4,s4
    145a:	9e52                	add	t3,t3,s4
    145c:	9352                	add	t1,t1,s4
    145e:	98d2                	add	a7,a7,s4
    1460:	93d2                	add	t2,t2,s4
    1462:	9852                	add	a6,a6,s4
    1464:	9552                	add	a0,a0,s4
    1466:	95d2                	add	a1,a1,s4
    1468:	0006c983          	lbu	s3,0(a3)
    146c:	0002c283          	lbu	t0,0(t0)
    1470:	00074683          	lbu	a3,0(a4)
    1474:	000fcf83          	lbu	t6,0(t6)
    1478:	000f4f03          	lbu	t5,0(t5)
    147c:	000ece83          	lbu	t4,0(t4)
    1480:	000e4e03          	lbu	t3,0(t3)
    1484:	00034303          	lbu	t1,0(t1)
    1488:	0008c883          	lbu	a7,0(a7)
    148c:	0003c383          	lbu	t2,0(t2)
    1490:	00084803          	lbu	a6,0(a6)
    1494:	00054503          	lbu	a0,0(a0)
    1498:	0005c583          	lbu	a1,0(a1)
    149c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a0:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a4:	9371                	srli	a4,a4,0x3c
    14a6:	8bbd                	andi	a5,a5,15
    14a8:	9752                	add	a4,a4,s4
    14aa:	97d2                	add	a5,a5,s4
    14ac:	005105a3          	sb	t0,11(sp)
    14b0:	01f10623          	sb	t6,12(sp)
    14b4:	01e106a3          	sb	t5,13(sp)
    14b8:	01d10723          	sb	t4,14(sp)
    14bc:	01c107a3          	sb	t3,15(sp)
    14c0:	00610823          	sb	t1,16(sp)
    14c4:	011108a3          	sb	a7,17(sp)
    14c8:	00710923          	sb	t2,18(sp)
    14cc:	010109a3          	sb	a6,19(sp)
    14d0:	00a10a23          	sb	a0,20(sp)
    14d4:	00b10aa3          	sb	a1,21(sp)
    14d8:	01310b23          	sb	s3,22(sp)
    14dc:	00d10ba3          	sb	a3,23(sp)
    14e0:	00810523          	sb	s0,10(sp)
    14e4:	00074703          	lbu	a4,0(a4)
    14e8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ec:	002c                	addi	a1,sp,8
    14ee:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f0:	00e10c23          	sb	a4,24(sp)
    14f4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f8:	00010d23          	sb	zero,26(sp)
        s += 2;
    14fc:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1500:	085000ef          	jal	ra,1d84 <write>
        s += 2;
    1504:	b5bd                	j	1372 <printf+0xa2>
    char byte = c;
    1506:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    150a:	4605                	li	a2,1
    150c:	002c                	addi	a1,sp,8
    150e:	4505                	li	a0,1
    char byte = c;
    1510:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1514:	071000ef          	jal	ra,1d84 <write>
    char byte = c;
    1518:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
        s += 2;
    1526:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    152a:	05b000ef          	jal	ra,1d84 <write>
        s += 2;
    152e:	b591                	j	1372 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1530:	6782                	ld	a5,0(sp)
    1532:	6380                	ld	s0,0(a5)
    1534:	07a1                	addi	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	cc05                	beqz	s0,1570 <printf+0x2a0>
            l = strnlen(a, 200);
    153a:	0c800593          	li	a1,200
    153e:	8522                	mv	a0,s0
    1540:	45a000ef          	jal	ra,199a <strnlen>
    write(f, s, l);
    1544:	0005061b          	sext.w	a2,a0
    1548:	85a2                	mv	a1,s0
    154a:	4505                	li	a0,1
    154c:	039000ef          	jal	ra,1d84 <write>
        s += 2;
    1550:	00248993          	addi	s3,s1,2
    1554:	bd39                	j	1372 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1556:	0019c783          	lbu	a5,1(s3)
    155a:	84ce                	mv	s1,s3
    155c:	864e                	mv	a2,s3
    155e:	e52782e3          	beq	a5,s2,13a2 <printf+0xd2>
    write(f, s, l);
    1562:	4601                	li	a2,0
    1564:	85ce                	mv	a1,s3
    1566:	4505                	li	a0,1
    1568:	01d000ef          	jal	ra,1d84 <write>
    156c:	84ce                	mv	s1,s3
    156e:	bbd1                	j	1342 <printf+0x72>
                a = "(null)";
    1570:	845e                	mv	s0,s7
    1572:	b7e1                	j	153a <printf+0x26a>

0000000000001574 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1574:	1141                	addi	sp,sp,-16
    1576:	e406                	sd	ra,8(sp)
    puts(m);
    1578:	d37ff0ef          	jal	ra,12ae <puts>
    exit(-100);
}
    157c:	60a2                	ld	ra,8(sp)
    exit(-100);
    157e:	f9c00513          	li	a0,-100
}
    1582:	0141                	addi	sp,sp,16
    exit(-100);
    1584:	0530006f          	j	1dd6 <exit>

0000000000001588 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1588:	02000793          	li	a5,32
    158c:	00f50663          	beq	a0,a5,1598 <isspace+0x10>
    1590:	355d                	addiw	a0,a0,-9
    1592:	00553513          	sltiu	a0,a0,5
    1596:	8082                	ret
    1598:	4505                	li	a0,1
}
    159a:	8082                	ret

000000000000159c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159c:	fd05051b          	addiw	a0,a0,-48
}
    15a0:	00a53513          	sltiu	a0,a0,10
    15a4:	8082                	ret

00000000000015a6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	02000613          	li	a2,32
    15aa:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ac:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	0007079b          	sext.w	a5,a4
    15b4:	ff77869b          	addiw	a3,a5,-9
    15b8:	04c70b63          	beq	a4,a2,160e <atoi+0x68>
    15bc:	04d5f963          	bleu	a3,a1,160e <atoi+0x68>
        s++;
    switch (*s)
    15c0:	02b00693          	li	a3,43
    15c4:	04d70a63          	beq	a4,a3,1618 <atoi+0x72>
    15c8:	02d00693          	li	a3,45
    15cc:	06d70463          	beq	a4,a3,1634 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d0:	fd07859b          	addiw	a1,a5,-48
    15d4:	4625                	li	a2,9
    15d6:	873e                	mv	a4,a5
    15d8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15da:	4e01                	li	t3,0
    while (isdigit(*s))
    15dc:	04b66a63          	bltu	a2,a1,1630 <atoi+0x8a>
    int n = 0, neg = 0;
    15e0:	4501                	li	a0,0
    while (isdigit(*s))
    15e2:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15e4:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15e6:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15ea:	0025179b          	slliw	a5,a0,0x2
    15ee:	9d3d                	addw	a0,a0,a5
    15f0:	fd07031b          	addiw	t1,a4,-48
    15f4:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15fc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1600:	0006071b          	sext.w	a4,a2
    1604:	feb870e3          	bleu	a1,a6,15e4 <atoi+0x3e>
    return neg ? n : -n;
    1608:	000e0563          	beqz	t3,1612 <atoi+0x6c>
}
    160c:	8082                	ret
        s++;
    160e:	0505                	addi	a0,a0,1
    1610:	bf71                	j	15ac <atoi+0x6>
    1612:	4113053b          	subw	a0,t1,a7
    1616:	8082                	ret
    while (isdigit(*s))
    1618:	00154783          	lbu	a5,1(a0)
    161c:	4625                	li	a2,9
        s++;
    161e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1622:	fd07859b          	addiw	a1,a5,-48
    1626:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    162a:	4e01                	li	t3,0
    while (isdigit(*s))
    162c:	fab67ae3          	bleu	a1,a2,15e0 <atoi+0x3a>
    1630:	4501                	li	a0,0
}
    1632:	8082                	ret
    while (isdigit(*s))
    1634:	00154783          	lbu	a5,1(a0)
    1638:	4625                	li	a2,9
        s++;
    163a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163e:	fd07859b          	addiw	a1,a5,-48
    1642:	0007871b          	sext.w	a4,a5
    1646:	feb665e3          	bltu	a2,a1,1630 <atoi+0x8a>
        neg = 1;
    164a:	4e05                	li	t3,1
    164c:	bf51                	j	15e0 <atoi+0x3a>

000000000000164e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164e:	16060d63          	beqz	a2,17c8 <memset+0x17a>
    1652:	40a007b3          	neg	a5,a0
    1656:	8b9d                	andi	a5,a5,7
    1658:	00778713          	addi	a4,a5,7
    165c:	482d                	li	a6,11
    165e:	0ff5f593          	andi	a1,a1,255
    1662:	fff60693          	addi	a3,a2,-1
    1666:	17076263          	bltu	a4,a6,17ca <memset+0x17c>
    166a:	16e6ea63          	bltu	a3,a4,17de <memset+0x190>
    166e:	16078563          	beqz	a5,17d8 <memset+0x18a>
    1672:	00b50023          	sb	a1,0(a0)
    1676:	4705                	li	a4,1
    1678:	00150e93          	addi	t4,a0,1
    167c:	14e78c63          	beq	a5,a4,17d4 <memset+0x186>
    1680:	00b500a3          	sb	a1,1(a0)
    1684:	4709                	li	a4,2
    1686:	00250e93          	addi	t4,a0,2
    168a:	14e78d63          	beq	a5,a4,17e4 <memset+0x196>
    168e:	00b50123          	sb	a1,2(a0)
    1692:	470d                	li	a4,3
    1694:	00350e93          	addi	t4,a0,3
    1698:	12e78b63          	beq	a5,a4,17ce <memset+0x180>
    169c:	00b501a3          	sb	a1,3(a0)
    16a0:	4711                	li	a4,4
    16a2:	00450e93          	addi	t4,a0,4
    16a6:	14e78163          	beq	a5,a4,17e8 <memset+0x19a>
    16aa:	00b50223          	sb	a1,4(a0)
    16ae:	4715                	li	a4,5
    16b0:	00550e93          	addi	t4,a0,5
    16b4:	12e78c63          	beq	a5,a4,17ec <memset+0x19e>
    16b8:	00b502a3          	sb	a1,5(a0)
    16bc:	471d                	li	a4,7
    16be:	00650e93          	addi	t4,a0,6
    16c2:	12e79763          	bne	a5,a4,17f0 <memset+0x1a2>
    16c6:	00750e93          	addi	t4,a0,7
    16ca:	00b50323          	sb	a1,6(a0)
    16ce:	4f1d                	li	t5,7
    16d0:	00859713          	slli	a4,a1,0x8
    16d4:	8f4d                	or	a4,a4,a1
    16d6:	01059e13          	slli	t3,a1,0x10
    16da:	01c76e33          	or	t3,a4,t3
    16de:	01859313          	slli	t1,a1,0x18
    16e2:	006e6333          	or	t1,t3,t1
    16e6:	02059893          	slli	a7,a1,0x20
    16ea:	011368b3          	or	a7,t1,a7
    16ee:	02859813          	slli	a6,a1,0x28
    16f2:	40f60333          	sub	t1,a2,a5
    16f6:	0108e833          	or	a6,a7,a6
    16fa:	03059693          	slli	a3,a1,0x30
    16fe:	00d866b3          	or	a3,a6,a3
    1702:	03859713          	slli	a4,a1,0x38
    1706:	97aa                	add	a5,a5,a0
    1708:	ff837813          	andi	a6,t1,-8
    170c:	8f55                	or	a4,a4,a3
    170e:	00f806b3          	add	a3,a6,a5
    1712:	e398                	sd	a4,0(a5)
    1714:	07a1                	addi	a5,a5,8
    1716:	fed79ee3          	bne	a5,a3,1712 <memset+0xc4>
    171a:	ff837693          	andi	a3,t1,-8
    171e:	00de87b3          	add	a5,t4,a3
    1722:	01e6873b          	addw	a4,a3,t5
    1726:	0ad30663          	beq	t1,a3,17d2 <memset+0x184>
    172a:	00b78023          	sb	a1,0(a5)
    172e:	0017069b          	addiw	a3,a4,1
    1732:	08c6fb63          	bleu	a2,a3,17c8 <memset+0x17a>
    1736:	00b780a3          	sb	a1,1(a5)
    173a:	0027069b          	addiw	a3,a4,2
    173e:	08c6f563          	bleu	a2,a3,17c8 <memset+0x17a>
    1742:	00b78123          	sb	a1,2(a5)
    1746:	0037069b          	addiw	a3,a4,3
    174a:	06c6ff63          	bleu	a2,a3,17c8 <memset+0x17a>
    174e:	00b781a3          	sb	a1,3(a5)
    1752:	0047069b          	addiw	a3,a4,4
    1756:	06c6f963          	bleu	a2,a3,17c8 <memset+0x17a>
    175a:	00b78223          	sb	a1,4(a5)
    175e:	0057069b          	addiw	a3,a4,5
    1762:	06c6f363          	bleu	a2,a3,17c8 <memset+0x17a>
    1766:	00b782a3          	sb	a1,5(a5)
    176a:	0067069b          	addiw	a3,a4,6
    176e:	04c6fd63          	bleu	a2,a3,17c8 <memset+0x17a>
    1772:	00b78323          	sb	a1,6(a5)
    1776:	0077069b          	addiw	a3,a4,7
    177a:	04c6f763          	bleu	a2,a3,17c8 <memset+0x17a>
    177e:	00b783a3          	sb	a1,7(a5)
    1782:	0087069b          	addiw	a3,a4,8
    1786:	04c6f163          	bleu	a2,a3,17c8 <memset+0x17a>
    178a:	00b78423          	sb	a1,8(a5)
    178e:	0097069b          	addiw	a3,a4,9
    1792:	02c6fb63          	bleu	a2,a3,17c8 <memset+0x17a>
    1796:	00b784a3          	sb	a1,9(a5)
    179a:	00a7069b          	addiw	a3,a4,10
    179e:	02c6f563          	bleu	a2,a3,17c8 <memset+0x17a>
    17a2:	00b78523          	sb	a1,10(a5)
    17a6:	00b7069b          	addiw	a3,a4,11
    17aa:	00c6ff63          	bleu	a2,a3,17c8 <memset+0x17a>
    17ae:	00b785a3          	sb	a1,11(a5)
    17b2:	00c7069b          	addiw	a3,a4,12
    17b6:	00c6f963          	bleu	a2,a3,17c8 <memset+0x17a>
    17ba:	00b78623          	sb	a1,12(a5)
    17be:	2735                	addiw	a4,a4,13
    17c0:	00c77463          	bleu	a2,a4,17c8 <memset+0x17a>
    17c4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c8:	8082                	ret
    17ca:	472d                	li	a4,11
    17cc:	bd79                	j	166a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ce:	4f0d                	li	t5,3
    17d0:	b701                	j	16d0 <memset+0x82>
    17d2:	8082                	ret
    17d4:	4f05                	li	t5,1
    17d6:	bded                	j	16d0 <memset+0x82>
    17d8:	8eaa                	mv	t4,a0
    17da:	4f01                	li	t5,0
    17dc:	bdd5                	j	16d0 <memset+0x82>
    17de:	87aa                	mv	a5,a0
    17e0:	4701                	li	a4,0
    17e2:	b7a1                	j	172a <memset+0xdc>
    17e4:	4f09                	li	t5,2
    17e6:	b5ed                	j	16d0 <memset+0x82>
    17e8:	4f11                	li	t5,4
    17ea:	b5dd                	j	16d0 <memset+0x82>
    17ec:	4f15                	li	t5,5
    17ee:	b5cd                	j	16d0 <memset+0x82>
    17f0:	4f19                	li	t5,6
    17f2:	bdf9                	j	16d0 <memset+0x82>

00000000000017f4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f4:	00054703          	lbu	a4,0(a0)
    17f8:	0005c783          	lbu	a5,0(a1)
    17fc:	00e79b63          	bne	a5,a4,1812 <strcmp+0x1e>
    1800:	cf89                	beqz	a5,181a <strcmp+0x26>
    1802:	0505                	addi	a0,a0,1
    1804:	0585                	addi	a1,a1,1
    1806:	0005c783          	lbu	a5,0(a1)
    180a:	00054703          	lbu	a4,0(a0)
    180e:	fef709e3          	beq	a4,a5,1800 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1812:	0007051b          	sext.w	a0,a4
}
    1816:	9d1d                	subw	a0,a0,a5
    1818:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    181a:	4501                	li	a0,0
}
    181c:	9d1d                	subw	a0,a0,a5
    181e:	8082                	ret

0000000000001820 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1820:	c231                	beqz	a2,1864 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1822:	00054783          	lbu	a5,0(a0)
    1826:	0005c683          	lbu	a3,0(a1)
    182a:	c795                	beqz	a5,1856 <strncmp+0x36>
    182c:	ca85                	beqz	a3,185c <strncmp+0x3c>
    if (!n--)
    182e:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1830:	c615                	beqz	a2,185c <strncmp+0x3c>
    1832:	00150713          	addi	a4,a0,1
    1836:	9532                	add	a0,a0,a2
    1838:	00d78963          	beq	a5,a3,184a <strncmp+0x2a>
    183c:	a005                	j	185c <strncmp+0x3c>
    183e:	ce99                	beqz	a3,185c <strncmp+0x3c>
    1840:	00e50e63          	beq	a0,a4,185c <strncmp+0x3c>
    1844:	0705                	addi	a4,a4,1
    1846:	00d79b63          	bne	a5,a3,185c <strncmp+0x3c>
    184a:	00074783          	lbu	a5,0(a4)
    184e:	0585                	addi	a1,a1,1
    1850:	0005c683          	lbu	a3,0(a1)
    1854:	f7ed                	bnez	a5,183e <strncmp+0x1e>
    1856:	4501                	li	a0,0
        ;
    return *l - *r;
    1858:	9d15                	subw	a0,a0,a3
    185a:	8082                	ret
    185c:	0007851b          	sext.w	a0,a5
    1860:	9d15                	subw	a0,a0,a3
    1862:	8082                	ret
        return 0;
    1864:	4501                	li	a0,0
}
    1866:	8082                	ret

0000000000001868 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1868:	00757793          	andi	a5,a0,7
    186c:	cfa1                	beqz	a5,18c4 <strlen+0x5c>
        if (!*s)
    186e:	00054783          	lbu	a5,0(a0)
    1872:	cbb9                	beqz	a5,18c8 <strlen+0x60>
    1874:	87aa                	mv	a5,a0
    1876:	a021                	j	187e <strlen+0x16>
    1878:	0007c703          	lbu	a4,0(a5)
    187c:	c329                	beqz	a4,18be <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    187e:	0785                	addi	a5,a5,1
    1880:	0077f713          	andi	a4,a5,7
    1884:	fb75                	bnez	a4,1878 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1886:	00000717          	auipc	a4,0x0
    188a:	7d270713          	addi	a4,a4,2002 # 2058 <__clone+0x9a>
    188e:	630c                	ld	a1,0(a4)
    1890:	00000717          	auipc	a4,0x0
    1894:	7d070713          	addi	a4,a4,2000 # 2060 <__clone+0xa2>
    1898:	6394                	ld	a3,0(a5)
    189a:	6310                	ld	a2,0(a4)
    189c:	a019                	j	18a2 <strlen+0x3a>
    189e:	07a1                	addi	a5,a5,8
    18a0:	6394                	ld	a3,0(a5)
    18a2:	00b68733          	add	a4,a3,a1
    18a6:	fff6c693          	not	a3,a3
    18aa:	8f75                	and	a4,a4,a3
    18ac:	8f71                	and	a4,a4,a2
    18ae:	db65                	beqz	a4,189e <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18b0:	0007c703          	lbu	a4,0(a5)
    18b4:	c709                	beqz	a4,18be <strlen+0x56>
    18b6:	0785                	addi	a5,a5,1
    18b8:	0007c703          	lbu	a4,0(a5)
    18bc:	ff6d                	bnez	a4,18b6 <strlen+0x4e>
        ;
    return s - a;
    18be:	40a78533          	sub	a0,a5,a0
}
    18c2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c4:	87aa                	mv	a5,a0
    18c6:	b7c1                	j	1886 <strlen+0x1e>
        if (!*s)
    18c8:	4501                	li	a0,0
            return s - a;
    18ca:	8082                	ret

00000000000018cc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18cc:	00757793          	andi	a5,a0,7
    18d0:	0ff5f593          	andi	a1,a1,255
    18d4:	cb99                	beqz	a5,18ea <memchr+0x1e>
    18d6:	c655                	beqz	a2,1982 <memchr+0xb6>
    18d8:	00054783          	lbu	a5,0(a0)
    18dc:	0ab78663          	beq	a5,a1,1988 <memchr+0xbc>
    18e0:	0505                	addi	a0,a0,1
    18e2:	00757793          	andi	a5,a0,7
    18e6:	167d                	addi	a2,a2,-1
    18e8:	f7fd                	bnez	a5,18d6 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ea:	4701                	li	a4,0
    if (n && *s != c)
    18ec:	ca49                	beqz	a2,197e <memchr+0xb2>
    18ee:	00054783          	lbu	a5,0(a0)
    18f2:	08b78b63          	beq	a5,a1,1988 <memchr+0xbc>
        size_t k = ONES * c;
    18f6:	00000797          	auipc	a5,0x0
    18fa:	77278793          	addi	a5,a5,1906 # 2068 <__clone+0xaa>
    18fe:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1900:	479d                	li	a5,7
        size_t k = ONES * c;
    1902:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1906:	08c7f863          	bleu	a2,a5,1996 <memchr+0xca>
    190a:	611c                	ld	a5,0(a0)
    190c:	00000317          	auipc	t1,0x0
    1910:	75430313          	addi	t1,t1,1876 # 2060 <__clone+0xa2>
    1914:	00033803          	ld	a6,0(t1)
    1918:	00f8c7b3          	xor	a5,a7,a5
    191c:	fff7c713          	not	a4,a5
    1920:	8f95                	sub	a5,a5,a3
    1922:	8ff9                	and	a5,a5,a4
    1924:	0107f7b3          	and	a5,a5,a6
    1928:	e7bd                	bnez	a5,1996 <memchr+0xca>
    192a:	4e1d                	li	t3,7
    192c:	00000e97          	auipc	t4,0x0
    1930:	72ce8e93          	addi	t4,t4,1836 # 2058 <__clone+0x9a>
    1934:	a005                	j	1954 <memchr+0x88>
    1936:	6514                	ld	a3,8(a0)
    1938:	000eb783          	ld	a5,0(t4)
    193c:	00033803          	ld	a6,0(t1)
    1940:	00d8c6b3          	xor	a3,a7,a3
    1944:	97b6                	add	a5,a5,a3
    1946:	fff6c693          	not	a3,a3
    194a:	8ff5                	and	a5,a5,a3
    194c:	0107f7b3          	and	a5,a5,a6
    1950:	e3a1                	bnez	a5,1990 <memchr+0xc4>
    1952:	853a                	mv	a0,a4
    1954:	1661                	addi	a2,a2,-8
    1956:	00850713          	addi	a4,a0,8
    195a:	fcce6ee3          	bltu	t3,a2,1936 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    195e:	c215                	beqz	a2,1982 <memchr+0xb6>
    1960:	00074783          	lbu	a5,0(a4)
    1964:	00f58d63          	beq	a1,a5,197e <memchr+0xb2>
    1968:	00170793          	addi	a5,a4,1
    196c:	963a                	add	a2,a2,a4
    196e:	873e                	mv	a4,a5
    1970:	00f60963          	beq	a2,a5,1982 <memchr+0xb6>
    1974:	0007c683          	lbu	a3,0(a5)
    1978:	0785                	addi	a5,a5,1
    197a:	feb69ae3          	bne	a3,a1,196e <memchr+0xa2>
}
    197e:	853a                	mv	a0,a4
    1980:	8082                	ret
    return n ? (void *)s : 0;
    1982:	4701                	li	a4,0
}
    1984:	853a                	mv	a0,a4
    1986:	8082                	ret
    1988:	872a                	mv	a4,a0
    198a:	00074783          	lbu	a5,0(a4)
    198e:	bfd9                	j	1964 <memchr+0x98>
    1990:	00854783          	lbu	a5,8(a0)
    1994:	bfc1                	j	1964 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1996:	872a                	mv	a4,a0
    1998:	bfc1                	j	1968 <memchr+0x9c>

000000000000199a <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    199a:	00757793          	andi	a5,a0,7
    199e:	cfc5                	beqz	a5,1a56 <strnlen+0xbc>
    19a0:	c1c5                	beqz	a1,1a40 <strnlen+0xa6>
    19a2:	00054783          	lbu	a5,0(a0)
    19a6:	cfd9                	beqz	a5,1a44 <strnlen+0xaa>
    19a8:	87ae                	mv	a5,a1
    19aa:	86aa                	mv	a3,a0
    19ac:	a029                	j	19b6 <strnlen+0x1c>
    19ae:	cbc9                	beqz	a5,1a40 <strnlen+0xa6>
    19b0:	0006c703          	lbu	a4,0(a3)
    19b4:	cb51                	beqz	a4,1a48 <strnlen+0xae>
    19b6:	0685                	addi	a3,a3,1
    19b8:	0076f713          	andi	a4,a3,7
    19bc:	17fd                	addi	a5,a5,-1
    19be:	fb65                	bnez	a4,19ae <strnlen+0x14>
    if (n && *s != c)
    19c0:	c3c1                	beqz	a5,1a40 <strnlen+0xa6>
    19c2:	0006c703          	lbu	a4,0(a3)
    19c6:	c349                	beqz	a4,1a48 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c8:	471d                	li	a4,7
    19ca:	08f77a63          	bleu	a5,a4,1a5e <strnlen+0xc4>
    19ce:	00000e17          	auipc	t3,0x0
    19d2:	68ae0e13          	addi	t3,t3,1674 # 2058 <__clone+0x9a>
    19d6:	6290                	ld	a2,0(a3)
    19d8:	000e3703          	ld	a4,0(t3)
    19dc:	00000e97          	auipc	t4,0x0
    19e0:	684e8e93          	addi	t4,t4,1668 # 2060 <__clone+0xa2>
    19e4:	000eb803          	ld	a6,0(t4)
    19e8:	9732                	add	a4,a4,a2
    19ea:	fff64613          	not	a2,a2
    19ee:	8f71                	and	a4,a4,a2
    19f0:	01077733          	and	a4,a4,a6
    19f4:	e72d                	bnez	a4,1a5e <strnlen+0xc4>
    19f6:	4f1d                	li	t5,7
    19f8:	a839                	j	1a16 <strnlen+0x7c>
    19fa:	6698                	ld	a4,8(a3)
    19fc:	000e3303          	ld	t1,0(t3)
    1a00:	000eb803          	ld	a6,0(t4)
    1a04:	fff74893          	not	a7,a4
    1a08:	971a                	add	a4,a4,t1
    1a0a:	01177733          	and	a4,a4,a7
    1a0e:	01077733          	and	a4,a4,a6
    1a12:	ef1d                	bnez	a4,1a50 <strnlen+0xb6>
    1a14:	86b2                	mv	a3,a2
    1a16:	17e1                	addi	a5,a5,-8
    1a18:	00868613          	addi	a2,a3,8
    1a1c:	fcff6fe3          	bltu	t5,a5,19fa <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a20:	c385                	beqz	a5,1a40 <strnlen+0xa6>
    1a22:	00064703          	lbu	a4,0(a2)
    1a26:	cb19                	beqz	a4,1a3c <strnlen+0xa2>
    1a28:	00160713          	addi	a4,a2,1
    1a2c:	97b2                	add	a5,a5,a2
    1a2e:	863a                	mv	a2,a4
    1a30:	00e78863          	beq	a5,a4,1a40 <strnlen+0xa6>
    1a34:	0705                	addi	a4,a4,1
    1a36:	fff74683          	lbu	a3,-1(a4)
    1a3a:	faf5                	bnez	a3,1a2e <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a3c:	40a605b3          	sub	a1,a2,a0
}
    1a40:	852e                	mv	a0,a1
    1a42:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a44:	87ae                	mv	a5,a1
    1a46:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a48:	8636                	mv	a2,a3
    1a4a:	00064703          	lbu	a4,0(a2)
    1a4e:	bfe1                	j	1a26 <strnlen+0x8c>
    1a50:	0086c703          	lbu	a4,8(a3)
    1a54:	bfc9                	j	1a26 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a56:	87ae                	mv	a5,a1
    1a58:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a5a:	f7a5                	bnez	a5,19c2 <strnlen+0x28>
    1a5c:	b7d5                	j	1a40 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a5e:	8636                	mv	a2,a3
    1a60:	b7e1                	j	1a28 <strnlen+0x8e>

0000000000001a62 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a62:	00b547b3          	xor	a5,a0,a1
    1a66:	8b9d                	andi	a5,a5,7
    1a68:	efa9                	bnez	a5,1ac2 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a6a:	0075f793          	andi	a5,a1,7
    1a6e:	c38d                	beqz	a5,1a90 <strcpy+0x2e>
            if (!(*d = *s))
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	00f50023          	sb	a5,0(a0)
    1a78:	e799                	bnez	a5,1a86 <strcpy+0x24>
    1a7a:	a095                	j	1ade <strcpy+0x7c>
    1a7c:	0005c783          	lbu	a5,0(a1)
    1a80:	00f50023          	sb	a5,0(a0)
    1a84:	cbb9                	beqz	a5,1ada <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a86:	0585                	addi	a1,a1,1
    1a88:	0075f793          	andi	a5,a1,7
    1a8c:	0505                	addi	a0,a0,1
    1a8e:	f7fd                	bnez	a5,1a7c <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a90:	00000797          	auipc	a5,0x0
    1a94:	5c878793          	addi	a5,a5,1480 # 2058 <__clone+0x9a>
    1a98:	0007b803          	ld	a6,0(a5)
    1a9c:	00000797          	auipc	a5,0x0
    1aa0:	5c478793          	addi	a5,a5,1476 # 2060 <__clone+0xa2>
    1aa4:	6198                	ld	a4,0(a1)
    1aa6:	6390                	ld	a2,0(a5)
    1aa8:	a031                	j	1ab4 <strcpy+0x52>
    1aaa:	0521                	addi	a0,a0,8
    1aac:	05a1                	addi	a1,a1,8
    1aae:	fee53c23          	sd	a4,-8(a0)
    1ab2:	6198                	ld	a4,0(a1)
    1ab4:	010707b3          	add	a5,a4,a6
    1ab8:	fff74693          	not	a3,a4
    1abc:	8ff5                	and	a5,a5,a3
    1abe:	8ff1                	and	a5,a5,a2
    1ac0:	d7ed                	beqz	a5,1aaa <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ac2:	0005c783          	lbu	a5,0(a1)
    1ac6:	00f50023          	sb	a5,0(a0)
    1aca:	cb89                	beqz	a5,1adc <strcpy+0x7a>
    1acc:	0585                	addi	a1,a1,1
    1ace:	0005c783          	lbu	a5,0(a1)
    1ad2:	0505                	addi	a0,a0,1
    1ad4:	00f50023          	sb	a5,0(a0)
    1ad8:	fbf5                	bnez	a5,1acc <strcpy+0x6a>
        ;
    return d;
}
    1ada:	8082                	ret
    1adc:	8082                	ret
    1ade:	8082                	ret

0000000000001ae0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ae0:	00b547b3          	xor	a5,a0,a1
    1ae4:	8b9d                	andi	a5,a5,7
    1ae6:	ebc1                	bnez	a5,1b76 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ae8:	0075f793          	andi	a5,a1,7
    1aec:	cf91                	beqz	a5,1b08 <strncpy+0x28>
    1aee:	20060e63          	beqz	a2,1d0a <strncpy+0x22a>
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	c3d5                	beqz	a5,1b9e <strncpy+0xbe>
    1afc:	0585                	addi	a1,a1,1
    1afe:	0075f793          	andi	a5,a1,7
    1b02:	167d                	addi	a2,a2,-1
    1b04:	0505                	addi	a0,a0,1
    1b06:	f7e5                	bnez	a5,1aee <strncpy+0xe>
            ;
        if (!n || !*s)
    1b08:	20060163          	beqz	a2,1d0a <strncpy+0x22a>
    1b0c:	0005c683          	lbu	a3,0(a1)
    1b10:	c6d9                	beqz	a3,1b9e <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b12:	479d                	li	a5,7
    1b14:	22c7f563          	bleu	a2,a5,1d3e <strncpy+0x25e>
    1b18:	00000317          	auipc	t1,0x0
    1b1c:	54030313          	addi	t1,t1,1344 # 2058 <__clone+0x9a>
    1b20:	6198                	ld	a4,0(a1)
    1b22:	00033783          	ld	a5,0(t1)
    1b26:	00000e17          	auipc	t3,0x0
    1b2a:	53ae0e13          	addi	t3,t3,1338 # 2060 <__clone+0xa2>
    1b2e:	000e3803          	ld	a6,0(t3)
    1b32:	97ba                	add	a5,a5,a4
    1b34:	fff74893          	not	a7,a4
    1b38:	0117f7b3          	and	a5,a5,a7
    1b3c:	0107f7b3          	and	a5,a5,a6
    1b40:	1e079f63          	bnez	a5,1d3e <strncpy+0x25e>
    1b44:	4e9d                	li	t4,7
    1b46:	a005                	j	1b66 <strncpy+0x86>
    1b48:	6598                	ld	a4,8(a1)
    1b4a:	00033783          	ld	a5,0(t1)
    1b4e:	000e3803          	ld	a6,0(t3)
    1b52:	fff74893          	not	a7,a4
    1b56:	97ba                	add	a5,a5,a4
    1b58:	0117f7b3          	and	a5,a5,a7
    1b5c:	0107f7b3          	and	a5,a5,a6
    1b60:	1a079f63          	bnez	a5,1d1e <strncpy+0x23e>
    1b64:	85b6                	mv	a1,a3
            *wd = *ws;
    1b66:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b68:	1661                	addi	a2,a2,-8
    1b6a:	00858693          	addi	a3,a1,8
    1b6e:	0521                	addi	a0,a0,8
    1b70:	fcceece3          	bltu	t4,a2,1b48 <strncpy+0x68>
    1b74:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b76:	18060a63          	beqz	a2,1d0a <strncpy+0x22a>
    1b7a:	0005c783          	lbu	a5,0(a1)
    1b7e:	872a                	mv	a4,a0
    1b80:	00f50023          	sb	a5,0(a0)
    1b84:	e799                	bnez	a5,1b92 <strncpy+0xb2>
    1b86:	a829                	j	1ba0 <strncpy+0xc0>
    1b88:	0005c783          	lbu	a5,0(a1)
    1b8c:	00f70023          	sb	a5,0(a4)
    1b90:	cb81                	beqz	a5,1ba0 <strncpy+0xc0>
    1b92:	167d                	addi	a2,a2,-1
    1b94:	0585                	addi	a1,a1,1
    1b96:	0705                	addi	a4,a4,1
    1b98:	fa65                	bnez	a2,1b88 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b9a:	853a                	mv	a0,a4
    1b9c:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b9e:	872a                	mv	a4,a0
    1ba0:	4805                	li	a6,1
    1ba2:	14061c63          	bnez	a2,1cfa <strncpy+0x21a>
    1ba6:	40e007b3          	neg	a5,a4
    1baa:	8b9d                	andi	a5,a5,7
    1bac:	4581                	li	a1,0
    1bae:	12061e63          	bnez	a2,1cea <strncpy+0x20a>
    1bb2:	00778693          	addi	a3,a5,7
    1bb6:	452d                	li	a0,11
    1bb8:	12a6e763          	bltu	a3,a0,1ce6 <strncpy+0x206>
    1bbc:	16d5e663          	bltu	a1,a3,1d28 <strncpy+0x248>
    1bc0:	14078c63          	beqz	a5,1d18 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc4:	00070023          	sb	zero,0(a4)
    1bc8:	4585                	li	a1,1
    1bca:	00170693          	addi	a3,a4,1
    1bce:	14b78363          	beq	a5,a1,1d14 <strncpy+0x234>
    1bd2:	000700a3          	sb	zero,1(a4)
    1bd6:	4589                	li	a1,2
    1bd8:	00270693          	addi	a3,a4,2
    1bdc:	14b78963          	beq	a5,a1,1d2e <strncpy+0x24e>
    1be0:	00070123          	sb	zero,2(a4)
    1be4:	458d                	li	a1,3
    1be6:	00370693          	addi	a3,a4,3
    1bea:	12b78363          	beq	a5,a1,1d10 <strncpy+0x230>
    1bee:	000701a3          	sb	zero,3(a4)
    1bf2:	4591                	li	a1,4
    1bf4:	00470693          	addi	a3,a4,4
    1bf8:	12b78d63          	beq	a5,a1,1d32 <strncpy+0x252>
    1bfc:	00070223          	sb	zero,4(a4)
    1c00:	4595                	li	a1,5
    1c02:	00570693          	addi	a3,a4,5
    1c06:	12b78863          	beq	a5,a1,1d36 <strncpy+0x256>
    1c0a:	000702a3          	sb	zero,5(a4)
    1c0e:	459d                	li	a1,7
    1c10:	00670693          	addi	a3,a4,6
    1c14:	12b79363          	bne	a5,a1,1d3a <strncpy+0x25a>
    1c18:	00770693          	addi	a3,a4,7
    1c1c:	00070323          	sb	zero,6(a4)
    1c20:	40f80833          	sub	a6,a6,a5
    1c24:	ff887513          	andi	a0,a6,-8
    1c28:	97ba                	add	a5,a5,a4
    1c2a:	953e                	add	a0,a0,a5
    1c2c:	0007b023          	sd	zero,0(a5)
    1c30:	07a1                	addi	a5,a5,8
    1c32:	fea79de3          	bne	a5,a0,1c2c <strncpy+0x14c>
    1c36:	ff887513          	andi	a0,a6,-8
    1c3a:	9da9                	addw	a1,a1,a0
    1c3c:	00a687b3          	add	a5,a3,a0
    1c40:	f4a80de3          	beq	a6,a0,1b9a <strncpy+0xba>
    1c44:	00078023          	sb	zero,0(a5)
    1c48:	0015869b          	addiw	a3,a1,1
    1c4c:	f4c6f7e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c50:	000780a3          	sb	zero,1(a5)
    1c54:	0025869b          	addiw	a3,a1,2
    1c58:	f4c6f1e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c5c:	00078123          	sb	zero,2(a5)
    1c60:	0035869b          	addiw	a3,a1,3
    1c64:	f2c6fbe3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c68:	000781a3          	sb	zero,3(a5)
    1c6c:	0045869b          	addiw	a3,a1,4
    1c70:	f2c6f5e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c74:	00078223          	sb	zero,4(a5)
    1c78:	0055869b          	addiw	a3,a1,5
    1c7c:	f0c6ffe3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c80:	000782a3          	sb	zero,5(a5)
    1c84:	0065869b          	addiw	a3,a1,6
    1c88:	f0c6f9e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c8c:	00078323          	sb	zero,6(a5)
    1c90:	0075869b          	addiw	a3,a1,7
    1c94:	f0c6f3e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1c98:	000783a3          	sb	zero,7(a5)
    1c9c:	0085869b          	addiw	a3,a1,8
    1ca0:	eec6fde3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1ca4:	00078423          	sb	zero,8(a5)
    1ca8:	0095869b          	addiw	a3,a1,9
    1cac:	eec6f7e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1cb0:	000784a3          	sb	zero,9(a5)
    1cb4:	00a5869b          	addiw	a3,a1,10
    1cb8:	eec6f1e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1cbc:	00078523          	sb	zero,10(a5)
    1cc0:	00b5869b          	addiw	a3,a1,11
    1cc4:	ecc6fbe3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1cc8:	000785a3          	sb	zero,11(a5)
    1ccc:	00c5869b          	addiw	a3,a1,12
    1cd0:	ecc6f5e3          	bleu	a2,a3,1b9a <strncpy+0xba>
    1cd4:	00078623          	sb	zero,12(a5)
    1cd8:	25b5                	addiw	a1,a1,13
    1cda:	ecc5f0e3          	bleu	a2,a1,1b9a <strncpy+0xba>
    1cde:	000786a3          	sb	zero,13(a5)
}
    1ce2:	853a                	mv	a0,a4
    1ce4:	8082                	ret
    1ce6:	46ad                	li	a3,11
    1ce8:	bdd1                	j	1bbc <strncpy+0xdc>
    1cea:	00778693          	addi	a3,a5,7
    1cee:	452d                	li	a0,11
    1cf0:	fff60593          	addi	a1,a2,-1
    1cf4:	eca6f4e3          	bleu	a0,a3,1bbc <strncpy+0xdc>
    1cf8:	b7fd                	j	1ce6 <strncpy+0x206>
    1cfa:	40e007b3          	neg	a5,a4
    1cfe:	8832                	mv	a6,a2
    1d00:	8b9d                	andi	a5,a5,7
    1d02:	4581                	li	a1,0
    1d04:	ea0607e3          	beqz	a2,1bb2 <strncpy+0xd2>
    1d08:	b7cd                	j	1cea <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d0a:	872a                	mv	a4,a0
}
    1d0c:	853a                	mv	a0,a4
    1d0e:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d10:	458d                	li	a1,3
    1d12:	b739                	j	1c20 <strncpy+0x140>
    1d14:	4585                	li	a1,1
    1d16:	b729                	j	1c20 <strncpy+0x140>
    1d18:	86ba                	mv	a3,a4
    1d1a:	4581                	li	a1,0
    1d1c:	b711                	j	1c20 <strncpy+0x140>
    1d1e:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d22:	872a                	mv	a4,a0
    1d24:	85b6                	mv	a1,a3
    1d26:	bda9                	j	1b80 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d28:	87ba                	mv	a5,a4
    1d2a:	4581                	li	a1,0
    1d2c:	bf21                	j	1c44 <strncpy+0x164>
    1d2e:	4589                	li	a1,2
    1d30:	bdc5                	j	1c20 <strncpy+0x140>
    1d32:	4591                	li	a1,4
    1d34:	b5f5                	j	1c20 <strncpy+0x140>
    1d36:	4595                	li	a1,5
    1d38:	b5e5                	j	1c20 <strncpy+0x140>
    1d3a:	4599                	li	a1,6
    1d3c:	b5d5                	j	1c20 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d3e:	00d50023          	sb	a3,0(a0)
    1d42:	872a                	mv	a4,a0
    1d44:	b5b9                	j	1b92 <strncpy+0xb2>

0000000000001d46 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d46:	87aa                	mv	a5,a0
    1d48:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d4a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d4e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d52:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d54:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d56:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <openat>:
    register long a7 __asm__("a7") = n;
    1d5e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d62:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d66:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <close>:
    register long a7 __asm__("a7") = n;
    1d6e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <read>:
    register long a7 __asm__("a7") = n;
    1d7a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d82:	8082                	ret

0000000000001d84 <write>:
    register long a7 __asm__("a7") = n;
    1d84:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d88:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d8c:	8082                	ret

0000000000001d8e <getpid>:
    register long a7 __asm__("a7") = n;
    1d8e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d92:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <getppid>:
    register long a7 __asm__("a7") = n;
    1d9a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d9e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1da6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1daa:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <fork>:
    register long a7 __asm__("a7") = n;
    1db2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1db6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1db8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dba:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dc2:	85b2                	mv	a1,a2
    1dc4:	863a                	mv	a2,a4
    if (stack)
    1dc6:	c191                	beqz	a1,1dca <clone+0x8>
	stack += stack_size;
    1dc8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dca:	4781                	li	a5,0
    1dcc:	4701                	li	a4,0
    1dce:	4681                	li	a3,0
    1dd0:	2601                	sext.w	a2,a2
    1dd2:	1ec0006f          	j	1fbe <__clone>

0000000000001dd6 <exit>:
    register long a7 __asm__("a7") = n;
    1dd6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dda:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dde:	8082                	ret

0000000000001de0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1de0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1de4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1de6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <exec>:
    register long a7 __asm__("a7") = n;
    1dee:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <execve>:
    register long a7 __asm__("a7") = n;
    1dfa:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <times>:
    register long a7 __asm__("a7") = n;
    1e06:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e0a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <get_time>:

int64 get_time()
{
    1e12:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e14:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e18:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e1a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e20:	2501                	sext.w	a0,a0
    1e22:	ed09                	bnez	a0,1e3c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e24:	67a2                	ld	a5,8(sp)
    1e26:	3e800713          	li	a4,1000
    1e2a:	00015503          	lhu	a0,0(sp)
    1e2e:	02e7d7b3          	divu	a5,a5,a4
    1e32:	02e50533          	mul	a0,a0,a4
    1e36:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e38:	0141                	addi	sp,sp,16
    1e3a:	8082                	ret
        return -1;
    1e3c:	557d                	li	a0,-1
    1e3e:	bfed                	j	1e38 <get_time+0x26>

0000000000001e40 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e40:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <time>:
    register long a7 __asm__("a7") = n;
    1e4c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <sleep>:

int sleep(unsigned long long time)
{
    1e58:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e5a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e5c:	850a                	mv	a0,sp
    1e5e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e60:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e64:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e66:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e6a:	e501                	bnez	a0,1e72 <sleep+0x1a>
    return 0;
    1e6c:	4501                	li	a0,0
}
    1e6e:	0141                	addi	sp,sp,16
    1e70:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e72:	4502                	lw	a0,0(sp)
}
    1e74:	0141                	addi	sp,sp,16
    1e76:	8082                	ret

0000000000001e78 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e78:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e7c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e84:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e88:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e8c:	8082                	ret

0000000000001e8e <munmap>:
    register long a7 __asm__("a7") = n;
    1e8e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <wait>:

int wait(int *code)
{
    1e9a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ea0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ea2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ea4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ea6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <spawn>:
    register long a7 __asm__("a7") = n;
    1eae:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eb2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <mailread>:
    register long a7 __asm__("a7") = n;
    1eba:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebe:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ec6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eca:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <fstat>:
    register long a7 __asm__("a7") = n;
    1ed2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ede:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ee0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ee4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eee:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ef0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ef4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <link>:

int link(char *old_path, char *new_path)
{
    1efe:	87aa                	mv	a5,a0
    1f00:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f02:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f06:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f0a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f0c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f10:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f12:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <unlink>:

int unlink(char *path)
{
    1f1a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f1c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f20:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f24:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f26:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <uname>:
    register long a7 __asm__("a7") = n;
    1f2e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f32:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <brk>:
    register long a7 __asm__("a7") = n;
    1f3a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f3e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f46:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f48:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f4c:	8082                	ret

0000000000001f4e <chdir>:
    register long a7 __asm__("a7") = n;
    1f4e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f52:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f56:	2501                	sext.w	a0,a0
    1f58:	8082                	ret

0000000000001f5a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f5a:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f5c:	02059613          	slli	a2,a1,0x20
    1f60:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f62:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f66:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f6a:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6c:	00000073          	ecall
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <getdents>:
    register long a7 __asm__("a7") = n;
    1f74:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f78:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <pipe>:
    register long a7 __asm__("a7") = n;
    1f80:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f84:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f86:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <dup>:
    register long a7 __asm__("a7") = n;
    1f8e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f90:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <dup2>:
    register long a7 __asm__("a7") = n;
    1f98:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f9a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fa0:	2501                	sext.w	a0,a0
    1fa2:	8082                	ret

0000000000001fa4 <mount>:
    register long a7 __asm__("a7") = n;
    1fa4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <umount>:
    register long a7 __asm__("a7") = n;
    1fb0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fb4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fba:	2501                	sext.w	a0,a0
    1fbc:	8082                	ret

0000000000001fbe <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fbe:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fc0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fc2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fc4:	8532                	mv	a0,a2
	mv a2, a4
    1fc6:	863a                	mv	a2,a4
	mv a3, a5
    1fc8:	86be                	mv	a3,a5
	mv a4, a6
    1fca:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fcc:	0dc00893          	li	a7,220
	ecall
    1fd0:	00000073          	ecall

	beqz a0, 1f
    1fd4:	c111                	beqz	a0,1fd8 <__clone+0x1a>
	# Parent
	ret
    1fd6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fd8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fda:	6522                	ld	a0,8(sp)
	jalr a1
    1fdc:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fde:	05d00893          	li	a7,93
	ecall
    1fe2:	00000073          	ecall
