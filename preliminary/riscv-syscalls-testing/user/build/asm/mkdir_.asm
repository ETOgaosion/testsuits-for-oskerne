
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mkdir_:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0d20006f          	j	10d4 <__start_main>

0000000000001006 <test_mkdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_mkdir(void){
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	00850513          	addi	a0,a0,8 # 2010 <__clone+0x2c>
void test_mkdir(void){
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1014:	2c0000ef          	jal	ra,12d4 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0b850513          	addi	a0,a0,184 # 20d0 <__func__.1186>
    1020:	2b4000ef          	jal	ra,12d4 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	00450513          	addi	a0,a0,4 # 2028 <__clone+0x44>
    102c:	2a8000ef          	jal	ra,12d4 <puts>
    int rt, fd;

    rt = mkdir("test_mkdir", 0666);
    1030:	1b600593          	li	a1,438
    1034:	00001517          	auipc	a0,0x1
    1038:	00450513          	addi	a0,a0,4 # 2038 <__clone+0x54>
    103c:	745000ef          	jal	ra,1f80 <mkdir>
    printf("mkdir ret: %d\n", rt);
    1040:	85aa                	mv	a1,a0
    rt = mkdir("test_mkdir", 0666);
    1042:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", rt);
    1044:	00001517          	auipc	a0,0x1
    1048:	00450513          	addi	a0,a0,4 # 2048 <__clone+0x64>
    104c:	2aa000ef          	jal	ra,12f6 <printf>
    assert(rt != -1);
    1050:	57fd                	li	a5,-1
    1052:	06f40263          	beq	s0,a5,10b6 <test_mkdir+0xb0>
    fd = open("test_mkdir", O_RDONLY | O_DIRECTORY);
    1056:	002005b7          	lui	a1,0x200
    105a:	00001517          	auipc	a0,0x1
    105e:	fde50513          	addi	a0,a0,-34 # 2038 <__clone+0x54>
    1062:	50b000ef          	jal	ra,1d6c <open>
    1066:	842a                	mv	s0,a0
    if(fd > 0){
    1068:	04a05063          	blez	a0,10a8 <test_mkdir+0xa2>
        printf("  mkdir success.\n");
    106c:	00001517          	auipc	a0,0x1
    1070:	00c50513          	addi	a0,a0,12 # 2078 <__clone+0x94>
    1074:	282000ef          	jal	ra,12f6 <printf>
        close(fd);
    1078:	8522                	mv	a0,s0
    107a:	51b000ef          	jal	ra,1d94 <close>
    }
    else printf("  mkdir error.\n");
    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	02250513          	addi	a0,a0,34 # 20a0 <__clone+0xbc>
    1086:	24e000ef          	jal	ra,12d4 <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	04650513          	addi	a0,a0,70 # 20d0 <__func__.1186>
    1092:	242000ef          	jal	ra,12d4 <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	f8e50513          	addi	a0,a0,-114 # 2028 <__clone+0x44>
}
    10a2:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a4:	2300006f          	j	12d4 <puts>
    else printf("  mkdir error.\n");
    10a8:	00001517          	auipc	a0,0x1
    10ac:	fe850513          	addi	a0,a0,-24 # 2090 <__clone+0xac>
    10b0:	246000ef          	jal	ra,12f6 <printf>
    10b4:	b7e9                	j	107e <test_mkdir+0x78>
    assert(rt != -1);
    10b6:	00001517          	auipc	a0,0x1
    10ba:	fa250513          	addi	a0,a0,-94 # 2058 <__clone+0x74>
    10be:	4dc000ef          	jal	ra,159a <panic>
    10c2:	bf51                	j	1056 <test_mkdir+0x50>

00000000000010c4 <main>:

int main(void){
    10c4:	1141                	addi	sp,sp,-16
    10c6:	e406                	sd	ra,8(sp)
    test_mkdir();
    10c8:	f3fff0ef          	jal	ra,1006 <test_mkdir>
    return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	addi	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d6:	4108                	lw	a0,0(a0)
{
    10d8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10da:	05a1                	addi	a1,a1,8
{
    10dc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10de:	fe7ff0ef          	jal	ra,10c4 <main>
    10e2:	51b000ef          	jal	ra,1dfc <exit>
	return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ee:	7179                	addi	sp,sp,-48
    10f0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f2:	12054e63          	bltz	a0,122e <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10f6:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10fa:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fc:	02b7f6bb          	remuw	a3,a5,a1
    1100:	00001717          	auipc	a4,0x1
    1104:	fe070713          	addi	a4,a4,-32 # 20e0 <digits>
    buf[16] = 0;
    1108:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110c:	1682                	slli	a3,a3,0x20
    110e:	9281                	srli	a3,a3,0x20
    1110:	96ba                	add	a3,a3,a4
    1112:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1116:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    111a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    111e:	16b7e363          	bltu	a5,a1,1284 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1122:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1126:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    112a:	1602                	slli	a2,a2,0x20
    112c:	9201                	srli	a2,a2,0x20
    112e:	963a                	add	a2,a2,a4
    1130:	00064603          	lbu	a2,0(a2)
    1134:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1138:	0007861b          	sext.w	a2,a5
    113c:	12b6e863          	bltu	a3,a1,126c <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1140:	02b7f6bb          	remuw	a3,a5,a1
    1144:	1682                	slli	a3,a3,0x20
    1146:	9281                	srli	a3,a3,0x20
    1148:	96ba                	add	a3,a3,a4
    114a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114e:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1152:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1156:	10b66e63          	bltu	a2,a1,1272 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    115a:	02b876bb          	remuw	a3,a6,a1
    115e:	1682                	slli	a3,a3,0x20
    1160:	9281                	srli	a3,a3,0x20
    1162:	96ba                	add	a3,a3,a4
    1164:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1168:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    116c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1170:	10b86463          	bltu	a6,a1,1278 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1174:	02b676bb          	remuw	a3,a2,a1
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96ba                	add	a3,a3,a4
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1186:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    118a:	0eb66a63          	bltu	a2,a1,127e <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    118e:	02b876bb          	remuw	a3,a6,a1
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96ba                	add	a3,a3,a4
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11a0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a4:	0cb86163          	bltu	a6,a1,1266 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11a8:	02b676bb          	remuw	a3,a2,a1
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96ba                	add	a3,a3,a4
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ba:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11be:	0cb66563          	bltu	a2,a1,1288 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11c2:	02b876bb          	remuw	a3,a6,a1
    11c6:	1682                	slli	a3,a3,0x20
    11c8:	9281                	srli	a3,a3,0x20
    11ca:	96ba                	add	a3,a3,a4
    11cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d0:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11d4:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d8:	0ab86b63          	bltu	a6,a1,128e <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11dc:	02b676bb          	remuw	a3,a2,a1
    11e0:	1682                	slli	a3,a3,0x20
    11e2:	9281                	srli	a3,a3,0x20
    11e4:	96ba                	add	a3,a3,a4
    11e6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ea:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ee:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11f2:	0ab66163          	bltu	a2,a1,1294 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11f6:	1782                	slli	a5,a5,0x20
    11f8:	9381                	srli	a5,a5,0x20
    11fa:	97ba                	add	a5,a5,a4
    11fc:	0007c703          	lbu	a4,0(a5)
    1200:	4599                	li	a1,6
    1202:	4795                	li	a5,5
    1204:	00e10723          	sb	a4,14(sp)

    if (sign)
    1208:	00055963          	bgez	a0,121a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120c:	1018                	addi	a4,sp,32
    120e:	973e                	add	a4,a4,a5
    1210:	02d00693          	li	a3,45
    1214:	fed70423          	sb	a3,-24(a4)
    1218:	85be                	mv	a1,a5
    write(f, s, l);
    121a:	003c                	addi	a5,sp,8
    121c:	4641                	li	a2,16
    121e:	9e0d                	subw	a2,a2,a1
    1220:	4505                	li	a0,1
    1222:	95be                	add	a1,a1,a5
    1224:	387000ef          	jal	ra,1daa <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1228:	70a2                	ld	ra,40(sp)
    122a:	6145                	addi	sp,sp,48
    122c:	8082                	ret
        x = -xx;
    122e:	40a0063b          	negw	a2,a0
    1232:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1234:	02b677bb          	remuw	a5,a2,a1
    1238:	00001717          	auipc	a4,0x1
    123c:	ea870713          	addi	a4,a4,-344 # 20e0 <digits>
    buf[16] = 0;
    1240:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1244:	1782                	slli	a5,a5,0x20
    1246:	9381                	srli	a5,a5,0x20
    1248:	97ba                	add	a5,a5,a4
    124a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124e:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1252:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1256:	ecb676e3          	bleu	a1,a2,1122 <printint.constprop.0+0x34>
        buf[i--] = '-';
    125a:	02d00793          	li	a5,45
    125e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1262:	45b9                	li	a1,14
    1264:	bf5d                	j	121a <printint.constprop.0+0x12c>
    1266:	47a5                	li	a5,9
    1268:	45a9                	li	a1,10
    126a:	bf79                	j	1208 <printint.constprop.0+0x11a>
    126c:	47b5                	li	a5,13
    126e:	45b9                	li	a1,14
    1270:	bf61                	j	1208 <printint.constprop.0+0x11a>
    1272:	47b1                	li	a5,12
    1274:	45b5                	li	a1,13
    1276:	bf49                	j	1208 <printint.constprop.0+0x11a>
    1278:	47ad                	li	a5,11
    127a:	45b1                	li	a1,12
    127c:	b771                	j	1208 <printint.constprop.0+0x11a>
    127e:	47a9                	li	a5,10
    1280:	45ad                	li	a1,11
    1282:	b759                	j	1208 <printint.constprop.0+0x11a>
    i = 15;
    1284:	45bd                	li	a1,15
    1286:	bf51                	j	121a <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1288:	47a1                	li	a5,8
    128a:	45a5                	li	a1,9
    128c:	bfb5                	j	1208 <printint.constprop.0+0x11a>
    128e:	479d                	li	a5,7
    1290:	45a1                	li	a1,8
    1292:	bf9d                	j	1208 <printint.constprop.0+0x11a>
    1294:	4799                	li	a5,6
    1296:	459d                	li	a1,7
    1298:	bf85                	j	1208 <printint.constprop.0+0x11a>

000000000000129a <getchar>:
{
    129a:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    129c:	00f10593          	addi	a1,sp,15
    12a0:	4605                	li	a2,1
    12a2:	4501                	li	a0,0
{
    12a4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12aa:	2f7000ef          	jal	ra,1da0 <read>
}
    12ae:	60e2                	ld	ra,24(sp)
    12b0:	00f14503          	lbu	a0,15(sp)
    12b4:	6105                	addi	sp,sp,32
    12b6:	8082                	ret

00000000000012b8 <putchar>:
{
    12b8:	1101                	addi	sp,sp,-32
    char byte = c;
    12ba:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12be:	00f10593          	addi	a1,sp,15
    12c2:	4605                	li	a2,1
    12c4:	4505                	li	a0,1
{
    12c6:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12c8:	2e3000ef          	jal	ra,1daa <write>
}
    12cc:	60e2                	ld	ra,24(sp)
    12ce:	2501                	sext.w	a0,a0
    12d0:	6105                	addi	sp,sp,32
    12d2:	8082                	ret

00000000000012d4 <puts>:
{
    12d4:	1141                	addi	sp,sp,-16
    12d6:	e406                	sd	ra,8(sp)
    12d8:	e022                	sd	s0,0(sp)
    12da:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12dc:	5b2000ef          	jal	ra,188e <strlen>
    12e0:	862a                	mv	a2,a0
    12e2:	85a2                	mv	a1,s0
    12e4:	4505                	li	a0,1
    12e6:	2c5000ef          	jal	ra,1daa <write>
}
    12ea:	60a2                	ld	ra,8(sp)
    12ec:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ee:	957d                	srai	a0,a0,0x3f
    return r;
    12f0:	2501                	sext.w	a0,a0
}
    12f2:	0141                	addi	sp,sp,16
    12f4:	8082                	ret

00000000000012f6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f6:	7131                	addi	sp,sp,-192
    12f8:	e0da                	sd	s6,64(sp)
    12fa:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12fc:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12fe:	013c                	addi	a5,sp,136
{
    1300:	f0ca                	sd	s2,96(sp)
    1302:	ecce                	sd	s3,88(sp)
    1304:	e8d2                	sd	s4,80(sp)
    1306:	e4d6                	sd	s5,72(sp)
    1308:	fc5e                	sd	s7,56(sp)
    130a:	fc86                	sd	ra,120(sp)
    130c:	f8a2                	sd	s0,112(sp)
    130e:	f4a6                	sd	s1,104(sp)
    1310:	89aa                	mv	s3,a0
    1312:	e52e                	sd	a1,136(sp)
    1314:	e932                	sd	a2,144(sp)
    1316:	ed36                	sd	a3,152(sp)
    1318:	f13a                	sd	a4,160(sp)
    131a:	f942                	sd	a6,176(sp)
    131c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1320:	02500913          	li	s2,37
    1324:	07000a93          	li	s5,112
    buf[i++] = '0';
    1328:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132c:	00001a17          	auipc	s4,0x1
    1330:	db4a0a13          	addi	s4,s4,-588 # 20e0 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1334:	00001b97          	auipc	s7,0x1
    1338:	d7cb8b93          	addi	s7,s7,-644 # 20b0 <__clone+0xcc>
        if (!*s)
    133c:	0009c783          	lbu	a5,0(s3)
    1340:	cfb9                	beqz	a5,139e <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1342:	23278d63          	beq	a5,s2,157c <printf+0x286>
    1346:	864e                	mv	a2,s3
    1348:	a019                	j	134e <printf+0x58>
    134a:	07278563          	beq	a5,s2,13b4 <printf+0xbe>
    134e:	0605                	addi	a2,a2,1
    1350:	00064783          	lbu	a5,0(a2)
    1354:	fbfd                	bnez	a5,134a <printf+0x54>
    1356:	84b2                	mv	s1,a2
        l = z - a;
    1358:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    135c:	8622                	mv	a2,s0
    135e:	85ce                	mv	a1,s3
    1360:	4505                	li	a0,1
    1362:	249000ef          	jal	ra,1daa <write>
        if (l)
    1366:	ec3d                	bnez	s0,13e4 <printf+0xee>
        if (s[1] == 0)
    1368:	0014c783          	lbu	a5,1(s1)
    136c:	cb8d                	beqz	a5,139e <printf+0xa8>
        switch (s[1])
    136e:	09578b63          	beq	a5,s5,1404 <printf+0x10e>
    1372:	06fafb63          	bleu	a5,s5,13e8 <printf+0xf2>
    1376:	07300713          	li	a4,115
    137a:	1ce78e63          	beq	a5,a4,1556 <printf+0x260>
    137e:	07800713          	li	a4,120
    1382:	1ae79563          	bne	a5,a4,152c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1386:	6782                	ld	a5,0(sp)
    1388:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    138a:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    138e:	4388                	lw	a0,0(a5)
    1390:	07a1                	addi	a5,a5,8
    1392:	e03e                	sd	a5,0(sp)
    1394:	d5bff0ef          	jal	ra,10ee <printint.constprop.0>
        if (!*s)
    1398:	0009c783          	lbu	a5,0(s3)
    139c:	f3dd                	bnez	a5,1342 <printf+0x4c>
    }
    va_end(ap);
}
    139e:	70e6                	ld	ra,120(sp)
    13a0:	7446                	ld	s0,112(sp)
    13a2:	74a6                	ld	s1,104(sp)
    13a4:	7906                	ld	s2,96(sp)
    13a6:	69e6                	ld	s3,88(sp)
    13a8:	6a46                	ld	s4,80(sp)
    13aa:	6aa6                	ld	s5,72(sp)
    13ac:	6b06                	ld	s6,64(sp)
    13ae:	7be2                	ld	s7,56(sp)
    13b0:	6129                	addi	sp,sp,192
    13b2:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13b4:	00164783          	lbu	a5,1(a2)
    13b8:	84b2                	mv	s1,a2
    13ba:	01278763          	beq	a5,s2,13c8 <printf+0xd2>
    13be:	bf69                	j	1358 <printf+0x62>
    13c0:	0014c783          	lbu	a5,1(s1)
    13c4:	f9279ae3          	bne	a5,s2,1358 <printf+0x62>
    13c8:	0489                	addi	s1,s1,2
    13ca:	0004c783          	lbu	a5,0(s1)
    13ce:	0605                	addi	a2,a2,1
    13d0:	ff2788e3          	beq	a5,s2,13c0 <printf+0xca>
        l = z - a;
    13d4:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13d8:	8622                	mv	a2,s0
    13da:	85ce                	mv	a1,s3
    13dc:	4505                	li	a0,1
    13de:	1cd000ef          	jal	ra,1daa <write>
        if (l)
    13e2:	d059                	beqz	s0,1368 <printf+0x72>
    13e4:	89a6                	mv	s3,s1
    13e6:	bf99                	j	133c <printf+0x46>
    13e8:	06400713          	li	a4,100
    13ec:	14e79063          	bne	a5,a4,152c <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13f0:	6782                	ld	a5,0(sp)
    13f2:	45a9                	li	a1,10
        s += 2;
    13f4:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13f8:	4388                	lw	a0,0(a5)
    13fa:	07a1                	addi	a5,a5,8
    13fc:	e03e                	sd	a5,0(sp)
    13fe:	cf1ff0ef          	jal	ra,10ee <printint.constprop.0>
        s += 2;
    1402:	bf59                	j	1398 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1404:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1406:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    140a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    140c:	631c                	ld	a5,0(a4)
    140e:	0721                	addi	a4,a4,8
    1410:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1412:	00479293          	slli	t0,a5,0x4
    1416:	00879f93          	slli	t6,a5,0x8
    141a:	00c79f13          	slli	t5,a5,0xc
    141e:	01079e93          	slli	t4,a5,0x10
    1422:	01479e13          	slli	t3,a5,0x14
    1426:	01879313          	slli	t1,a5,0x18
    142a:	01c79893          	slli	a7,a5,0x1c
    142e:	02479813          	slli	a6,a5,0x24
    1432:	02879513          	slli	a0,a5,0x28
    1436:	02c79593          	slli	a1,a5,0x2c
    143a:	03079693          	slli	a3,a5,0x30
    143e:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1442:	03c7d413          	srli	s0,a5,0x3c
    1446:	01c7d39b          	srliw	t2,a5,0x1c
    144a:	03c2d293          	srli	t0,t0,0x3c
    144e:	03cfdf93          	srli	t6,t6,0x3c
    1452:	03cf5f13          	srli	t5,t5,0x3c
    1456:	03cede93          	srli	t4,t4,0x3c
    145a:	03ce5e13          	srli	t3,t3,0x3c
    145e:	03c35313          	srli	t1,t1,0x3c
    1462:	03c8d893          	srli	a7,a7,0x3c
    1466:	03c85813          	srli	a6,a6,0x3c
    146a:	9171                	srli	a0,a0,0x3c
    146c:	91f1                	srli	a1,a1,0x3c
    146e:	92f1                	srli	a3,a3,0x3c
    1470:	9371                	srli	a4,a4,0x3c
    1472:	96d2                	add	a3,a3,s4
    1474:	9752                	add	a4,a4,s4
    1476:	9452                	add	s0,s0,s4
    1478:	92d2                	add	t0,t0,s4
    147a:	9fd2                	add	t6,t6,s4
    147c:	9f52                	add	t5,t5,s4
    147e:	9ed2                	add	t4,t4,s4
    1480:	9e52                	add	t3,t3,s4
    1482:	9352                	add	t1,t1,s4
    1484:	98d2                	add	a7,a7,s4
    1486:	93d2                	add	t2,t2,s4
    1488:	9852                	add	a6,a6,s4
    148a:	9552                	add	a0,a0,s4
    148c:	95d2                	add	a1,a1,s4
    148e:	0006c983          	lbu	s3,0(a3)
    1492:	0002c283          	lbu	t0,0(t0)
    1496:	00074683          	lbu	a3,0(a4)
    149a:	000fcf83          	lbu	t6,0(t6)
    149e:	000f4f03          	lbu	t5,0(t5)
    14a2:	000ece83          	lbu	t4,0(t4)
    14a6:	000e4e03          	lbu	t3,0(t3)
    14aa:	00034303          	lbu	t1,0(t1)
    14ae:	0008c883          	lbu	a7,0(a7)
    14b2:	0003c383          	lbu	t2,0(t2)
    14b6:	00084803          	lbu	a6,0(a6)
    14ba:	00054503          	lbu	a0,0(a0)
    14be:	0005c583          	lbu	a1,0(a1) # 200000 <digits+0x1fdf20>
    14c2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c6:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ca:	9371                	srli	a4,a4,0x3c
    14cc:	8bbd                	andi	a5,a5,15
    14ce:	9752                	add	a4,a4,s4
    14d0:	97d2                	add	a5,a5,s4
    14d2:	005105a3          	sb	t0,11(sp)
    14d6:	01f10623          	sb	t6,12(sp)
    14da:	01e106a3          	sb	t5,13(sp)
    14de:	01d10723          	sb	t4,14(sp)
    14e2:	01c107a3          	sb	t3,15(sp)
    14e6:	00610823          	sb	t1,16(sp)
    14ea:	011108a3          	sb	a7,17(sp)
    14ee:	00710923          	sb	t2,18(sp)
    14f2:	010109a3          	sb	a6,19(sp)
    14f6:	00a10a23          	sb	a0,20(sp)
    14fa:	00b10aa3          	sb	a1,21(sp)
    14fe:	01310b23          	sb	s3,22(sp)
    1502:	00d10ba3          	sb	a3,23(sp)
    1506:	00810523          	sb	s0,10(sp)
    150a:	00074703          	lbu	a4,0(a4)
    150e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1512:	002c                	addi	a1,sp,8
    1514:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1516:	00e10c23          	sb	a4,24(sp)
    151a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151e:	00010d23          	sb	zero,26(sp)
        s += 2;
    1522:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1526:	085000ef          	jal	ra,1daa <write>
        s += 2;
    152a:	b5bd                	j	1398 <printf+0xa2>
    char byte = c;
    152c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1530:	4605                	li	a2,1
    1532:	002c                	addi	a1,sp,8
    1534:	4505                	li	a0,1
    char byte = c;
    1536:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    153a:	071000ef          	jal	ra,1daa <write>
    char byte = c;
    153e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1542:	4605                	li	a2,1
    1544:	002c                	addi	a1,sp,8
    1546:	4505                	li	a0,1
    char byte = c;
    1548:	00f10423          	sb	a5,8(sp)
        s += 2;
    154c:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1550:	05b000ef          	jal	ra,1daa <write>
        s += 2;
    1554:	b591                	j	1398 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1556:	6782                	ld	a5,0(sp)
    1558:	6380                	ld	s0,0(a5)
    155a:	07a1                	addi	a5,a5,8
    155c:	e03e                	sd	a5,0(sp)
    155e:	cc05                	beqz	s0,1596 <printf+0x2a0>
            l = strnlen(a, 200);
    1560:	0c800593          	li	a1,200
    1564:	8522                	mv	a0,s0
    1566:	45a000ef          	jal	ra,19c0 <strnlen>
    write(f, s, l);
    156a:	0005061b          	sext.w	a2,a0
    156e:	85a2                	mv	a1,s0
    1570:	4505                	li	a0,1
    1572:	039000ef          	jal	ra,1daa <write>
        s += 2;
    1576:	00248993          	addi	s3,s1,2
    157a:	bd39                	j	1398 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    157c:	0019c783          	lbu	a5,1(s3)
    1580:	84ce                	mv	s1,s3
    1582:	864e                	mv	a2,s3
    1584:	e52782e3          	beq	a5,s2,13c8 <printf+0xd2>
    write(f, s, l);
    1588:	4601                	li	a2,0
    158a:	85ce                	mv	a1,s3
    158c:	4505                	li	a0,1
    158e:	01d000ef          	jal	ra,1daa <write>
    1592:	84ce                	mv	s1,s3
    1594:	bbd1                	j	1368 <printf+0x72>
                a = "(null)";
    1596:	845e                	mv	s0,s7
    1598:	b7e1                	j	1560 <printf+0x26a>

000000000000159a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    159a:	1141                	addi	sp,sp,-16
    159c:	e406                	sd	ra,8(sp)
    puts(m);
    159e:	d37ff0ef          	jal	ra,12d4 <puts>
    exit(-100);
}
    15a2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a4:	f9c00513          	li	a0,-100
}
    15a8:	0141                	addi	sp,sp,16
    exit(-100);
    15aa:	0530006f          	j	1dfc <exit>

00000000000015ae <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	02000793          	li	a5,32
    15b2:	00f50663          	beq	a0,a5,15be <isspace+0x10>
    15b6:	355d                	addiw	a0,a0,-9
    15b8:	00553513          	sltiu	a0,a0,5
    15bc:	8082                	ret
    15be:	4505                	li	a0,1
}
    15c0:	8082                	ret

00000000000015c2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c2:	fd05051b          	addiw	a0,a0,-48
}
    15c6:	00a53513          	sltiu	a0,a0,10
    15ca:	8082                	ret

00000000000015cc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	02000613          	li	a2,32
    15d0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d2:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d6:	0007079b          	sext.w	a5,a4
    15da:	ff77869b          	addiw	a3,a5,-9
    15de:	04c70b63          	beq	a4,a2,1634 <atoi+0x68>
    15e2:	04d5f963          	bleu	a3,a1,1634 <atoi+0x68>
        s++;
    switch (*s)
    15e6:	02b00693          	li	a3,43
    15ea:	04d70a63          	beq	a4,a3,163e <atoi+0x72>
    15ee:	02d00693          	li	a3,45
    15f2:	06d70463          	beq	a4,a3,165a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f6:	fd07859b          	addiw	a1,a5,-48
    15fa:	4625                	li	a2,9
    15fc:	873e                	mv	a4,a5
    15fe:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1600:	4e01                	li	t3,0
    while (isdigit(*s))
    1602:	04b66a63          	bltu	a2,a1,1656 <atoi+0x8a>
    int n = 0, neg = 0;
    1606:	4501                	li	a0,0
    while (isdigit(*s))
    1608:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    160a:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    160c:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1610:	0025179b          	slliw	a5,a0,0x2
    1614:	9d3d                	addw	a0,a0,a5
    1616:	fd07031b          	addiw	t1,a4,-48
    161a:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    161e:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1622:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1626:	0006071b          	sext.w	a4,a2
    162a:	feb870e3          	bleu	a1,a6,160a <atoi+0x3e>
    return neg ? n : -n;
    162e:	000e0563          	beqz	t3,1638 <atoi+0x6c>
}
    1632:	8082                	ret
        s++;
    1634:	0505                	addi	a0,a0,1
    1636:	bf71                	j	15d2 <atoi+0x6>
    1638:	4113053b          	subw	a0,t1,a7
    163c:	8082                	ret
    while (isdigit(*s))
    163e:	00154783          	lbu	a5,1(a0)
    1642:	4625                	li	a2,9
        s++;
    1644:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1648:	fd07859b          	addiw	a1,a5,-48
    164c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1650:	4e01                	li	t3,0
    while (isdigit(*s))
    1652:	fab67ae3          	bleu	a1,a2,1606 <atoi+0x3a>
    1656:	4501                	li	a0,0
}
    1658:	8082                	ret
    while (isdigit(*s))
    165a:	00154783          	lbu	a5,1(a0)
    165e:	4625                	li	a2,9
        s++;
    1660:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1664:	fd07859b          	addiw	a1,a5,-48
    1668:	0007871b          	sext.w	a4,a5
    166c:	feb665e3          	bltu	a2,a1,1656 <atoi+0x8a>
        neg = 1;
    1670:	4e05                	li	t3,1
    1672:	bf51                	j	1606 <atoi+0x3a>

0000000000001674 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1674:	16060d63          	beqz	a2,17ee <memset+0x17a>
    1678:	40a007b3          	neg	a5,a0
    167c:	8b9d                	andi	a5,a5,7
    167e:	00778713          	addi	a4,a5,7
    1682:	482d                	li	a6,11
    1684:	0ff5f593          	andi	a1,a1,255
    1688:	fff60693          	addi	a3,a2,-1
    168c:	17076263          	bltu	a4,a6,17f0 <memset+0x17c>
    1690:	16e6ea63          	bltu	a3,a4,1804 <memset+0x190>
    1694:	16078563          	beqz	a5,17fe <memset+0x18a>
    1698:	00b50023          	sb	a1,0(a0)
    169c:	4705                	li	a4,1
    169e:	00150e93          	addi	t4,a0,1
    16a2:	14e78c63          	beq	a5,a4,17fa <memset+0x186>
    16a6:	00b500a3          	sb	a1,1(a0)
    16aa:	4709                	li	a4,2
    16ac:	00250e93          	addi	t4,a0,2
    16b0:	14e78d63          	beq	a5,a4,180a <memset+0x196>
    16b4:	00b50123          	sb	a1,2(a0)
    16b8:	470d                	li	a4,3
    16ba:	00350e93          	addi	t4,a0,3
    16be:	12e78b63          	beq	a5,a4,17f4 <memset+0x180>
    16c2:	00b501a3          	sb	a1,3(a0)
    16c6:	4711                	li	a4,4
    16c8:	00450e93          	addi	t4,a0,4
    16cc:	14e78163          	beq	a5,a4,180e <memset+0x19a>
    16d0:	00b50223          	sb	a1,4(a0)
    16d4:	4715                	li	a4,5
    16d6:	00550e93          	addi	t4,a0,5
    16da:	12e78c63          	beq	a5,a4,1812 <memset+0x19e>
    16de:	00b502a3          	sb	a1,5(a0)
    16e2:	471d                	li	a4,7
    16e4:	00650e93          	addi	t4,a0,6
    16e8:	12e79763          	bne	a5,a4,1816 <memset+0x1a2>
    16ec:	00750e93          	addi	t4,a0,7
    16f0:	00b50323          	sb	a1,6(a0)
    16f4:	4f1d                	li	t5,7
    16f6:	00859713          	slli	a4,a1,0x8
    16fa:	8f4d                	or	a4,a4,a1
    16fc:	01059e13          	slli	t3,a1,0x10
    1700:	01c76e33          	or	t3,a4,t3
    1704:	01859313          	slli	t1,a1,0x18
    1708:	006e6333          	or	t1,t3,t1
    170c:	02059893          	slli	a7,a1,0x20
    1710:	011368b3          	or	a7,t1,a7
    1714:	02859813          	slli	a6,a1,0x28
    1718:	40f60333          	sub	t1,a2,a5
    171c:	0108e833          	or	a6,a7,a6
    1720:	03059693          	slli	a3,a1,0x30
    1724:	00d866b3          	or	a3,a6,a3
    1728:	03859713          	slli	a4,a1,0x38
    172c:	97aa                	add	a5,a5,a0
    172e:	ff837813          	andi	a6,t1,-8
    1732:	8f55                	or	a4,a4,a3
    1734:	00f806b3          	add	a3,a6,a5
    1738:	e398                	sd	a4,0(a5)
    173a:	07a1                	addi	a5,a5,8
    173c:	fed79ee3          	bne	a5,a3,1738 <memset+0xc4>
    1740:	ff837693          	andi	a3,t1,-8
    1744:	00de87b3          	add	a5,t4,a3
    1748:	01e6873b          	addw	a4,a3,t5
    174c:	0ad30663          	beq	t1,a3,17f8 <memset+0x184>
    1750:	00b78023          	sb	a1,0(a5)
    1754:	0017069b          	addiw	a3,a4,1
    1758:	08c6fb63          	bleu	a2,a3,17ee <memset+0x17a>
    175c:	00b780a3          	sb	a1,1(a5)
    1760:	0027069b          	addiw	a3,a4,2
    1764:	08c6f563          	bleu	a2,a3,17ee <memset+0x17a>
    1768:	00b78123          	sb	a1,2(a5)
    176c:	0037069b          	addiw	a3,a4,3
    1770:	06c6ff63          	bleu	a2,a3,17ee <memset+0x17a>
    1774:	00b781a3          	sb	a1,3(a5)
    1778:	0047069b          	addiw	a3,a4,4
    177c:	06c6f963          	bleu	a2,a3,17ee <memset+0x17a>
    1780:	00b78223          	sb	a1,4(a5)
    1784:	0057069b          	addiw	a3,a4,5
    1788:	06c6f363          	bleu	a2,a3,17ee <memset+0x17a>
    178c:	00b782a3          	sb	a1,5(a5)
    1790:	0067069b          	addiw	a3,a4,6
    1794:	04c6fd63          	bleu	a2,a3,17ee <memset+0x17a>
    1798:	00b78323          	sb	a1,6(a5)
    179c:	0077069b          	addiw	a3,a4,7
    17a0:	04c6f763          	bleu	a2,a3,17ee <memset+0x17a>
    17a4:	00b783a3          	sb	a1,7(a5)
    17a8:	0087069b          	addiw	a3,a4,8
    17ac:	04c6f163          	bleu	a2,a3,17ee <memset+0x17a>
    17b0:	00b78423          	sb	a1,8(a5)
    17b4:	0097069b          	addiw	a3,a4,9
    17b8:	02c6fb63          	bleu	a2,a3,17ee <memset+0x17a>
    17bc:	00b784a3          	sb	a1,9(a5)
    17c0:	00a7069b          	addiw	a3,a4,10
    17c4:	02c6f563          	bleu	a2,a3,17ee <memset+0x17a>
    17c8:	00b78523          	sb	a1,10(a5)
    17cc:	00b7069b          	addiw	a3,a4,11
    17d0:	00c6ff63          	bleu	a2,a3,17ee <memset+0x17a>
    17d4:	00b785a3          	sb	a1,11(a5)
    17d8:	00c7069b          	addiw	a3,a4,12
    17dc:	00c6f963          	bleu	a2,a3,17ee <memset+0x17a>
    17e0:	00b78623          	sb	a1,12(a5)
    17e4:	2735                	addiw	a4,a4,13
    17e6:	00c77463          	bleu	a2,a4,17ee <memset+0x17a>
    17ea:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ee:	8082                	ret
    17f0:	472d                	li	a4,11
    17f2:	bd79                	j	1690 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f4:	4f0d                	li	t5,3
    17f6:	b701                	j	16f6 <memset+0x82>
    17f8:	8082                	ret
    17fa:	4f05                	li	t5,1
    17fc:	bded                	j	16f6 <memset+0x82>
    17fe:	8eaa                	mv	t4,a0
    1800:	4f01                	li	t5,0
    1802:	bdd5                	j	16f6 <memset+0x82>
    1804:	87aa                	mv	a5,a0
    1806:	4701                	li	a4,0
    1808:	b7a1                	j	1750 <memset+0xdc>
    180a:	4f09                	li	t5,2
    180c:	b5ed                	j	16f6 <memset+0x82>
    180e:	4f11                	li	t5,4
    1810:	b5dd                	j	16f6 <memset+0x82>
    1812:	4f15                	li	t5,5
    1814:	b5cd                	j	16f6 <memset+0x82>
    1816:	4f19                	li	t5,6
    1818:	bdf9                	j	16f6 <memset+0x82>

000000000000181a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    181a:	00054703          	lbu	a4,0(a0)
    181e:	0005c783          	lbu	a5,0(a1)
    1822:	00e79b63          	bne	a5,a4,1838 <strcmp+0x1e>
    1826:	cf89                	beqz	a5,1840 <strcmp+0x26>
    1828:	0505                	addi	a0,a0,1
    182a:	0585                	addi	a1,a1,1
    182c:	0005c783          	lbu	a5,0(a1)
    1830:	00054703          	lbu	a4,0(a0)
    1834:	fef709e3          	beq	a4,a5,1826 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1838:	0007051b          	sext.w	a0,a4
}
    183c:	9d1d                	subw	a0,a0,a5
    183e:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1840:	4501                	li	a0,0
}
    1842:	9d1d                	subw	a0,a0,a5
    1844:	8082                	ret

0000000000001846 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1846:	c231                	beqz	a2,188a <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1848:	00054783          	lbu	a5,0(a0)
    184c:	0005c683          	lbu	a3,0(a1)
    1850:	c795                	beqz	a5,187c <strncmp+0x36>
    1852:	ca85                	beqz	a3,1882 <strncmp+0x3c>
    if (!n--)
    1854:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1856:	c615                	beqz	a2,1882 <strncmp+0x3c>
    1858:	00150713          	addi	a4,a0,1
    185c:	9532                	add	a0,a0,a2
    185e:	00d78963          	beq	a5,a3,1870 <strncmp+0x2a>
    1862:	a005                	j	1882 <strncmp+0x3c>
    1864:	ce99                	beqz	a3,1882 <strncmp+0x3c>
    1866:	00e50e63          	beq	a0,a4,1882 <strncmp+0x3c>
    186a:	0705                	addi	a4,a4,1
    186c:	00d79b63          	bne	a5,a3,1882 <strncmp+0x3c>
    1870:	00074783          	lbu	a5,0(a4)
    1874:	0585                	addi	a1,a1,1
    1876:	0005c683          	lbu	a3,0(a1)
    187a:	f7ed                	bnez	a5,1864 <strncmp+0x1e>
    187c:	4501                	li	a0,0
        ;
    return *l - *r;
    187e:	9d15                	subw	a0,a0,a3
    1880:	8082                	ret
    1882:	0007851b          	sext.w	a0,a5
    1886:	9d15                	subw	a0,a0,a3
    1888:	8082                	ret
        return 0;
    188a:	4501                	li	a0,0
}
    188c:	8082                	ret

000000000000188e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188e:	00757793          	andi	a5,a0,7
    1892:	cfa1                	beqz	a5,18ea <strlen+0x5c>
        if (!*s)
    1894:	00054783          	lbu	a5,0(a0)
    1898:	cbb9                	beqz	a5,18ee <strlen+0x60>
    189a:	87aa                	mv	a5,a0
    189c:	a021                	j	18a4 <strlen+0x16>
    189e:	0007c703          	lbu	a4,0(a5)
    18a2:	c329                	beqz	a4,18e4 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18a4:	0785                	addi	a5,a5,1
    18a6:	0077f713          	andi	a4,a5,7
    18aa:	fb75                	bnez	a4,189e <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ac:	00001717          	auipc	a4,0x1
    18b0:	80c70713          	addi	a4,a4,-2036 # 20b8 <__clone+0xd4>
    18b4:	630c                	ld	a1,0(a4)
    18b6:	00001717          	auipc	a4,0x1
    18ba:	80a70713          	addi	a4,a4,-2038 # 20c0 <__clone+0xdc>
    18be:	6394                	ld	a3,0(a5)
    18c0:	6310                	ld	a2,0(a4)
    18c2:	a019                	j	18c8 <strlen+0x3a>
    18c4:	07a1                	addi	a5,a5,8
    18c6:	6394                	ld	a3,0(a5)
    18c8:	00b68733          	add	a4,a3,a1
    18cc:	fff6c693          	not	a3,a3
    18d0:	8f75                	and	a4,a4,a3
    18d2:	8f71                	and	a4,a4,a2
    18d4:	db65                	beqz	a4,18c4 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	c709                	beqz	a4,18e4 <strlen+0x56>
    18dc:	0785                	addi	a5,a5,1
    18de:	0007c703          	lbu	a4,0(a5)
    18e2:	ff6d                	bnez	a4,18dc <strlen+0x4e>
        ;
    return s - a;
    18e4:	40a78533          	sub	a0,a5,a0
}
    18e8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ea:	87aa                	mv	a5,a0
    18ec:	b7c1                	j	18ac <strlen+0x1e>
        if (!*s)
    18ee:	4501                	li	a0,0
            return s - a;
    18f0:	8082                	ret

00000000000018f2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f2:	00757793          	andi	a5,a0,7
    18f6:	0ff5f593          	andi	a1,a1,255
    18fa:	cb99                	beqz	a5,1910 <memchr+0x1e>
    18fc:	c655                	beqz	a2,19a8 <memchr+0xb6>
    18fe:	00054783          	lbu	a5,0(a0)
    1902:	0ab78663          	beq	a5,a1,19ae <memchr+0xbc>
    1906:	0505                	addi	a0,a0,1
    1908:	00757793          	andi	a5,a0,7
    190c:	167d                	addi	a2,a2,-1
    190e:	f7fd                	bnez	a5,18fc <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1910:	4701                	li	a4,0
    if (n && *s != c)
    1912:	ca49                	beqz	a2,19a4 <memchr+0xb2>
    1914:	00054783          	lbu	a5,0(a0)
    1918:	08b78b63          	beq	a5,a1,19ae <memchr+0xbc>
        size_t k = ONES * c;
    191c:	00000797          	auipc	a5,0x0
    1920:	7ac78793          	addi	a5,a5,1964 # 20c8 <__clone+0xe4>
    1924:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1926:	479d                	li	a5,7
        size_t k = ONES * c;
    1928:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192c:	08c7f863          	bleu	a2,a5,19bc <memchr+0xca>
    1930:	611c                	ld	a5,0(a0)
    1932:	00000317          	auipc	t1,0x0
    1936:	78e30313          	addi	t1,t1,1934 # 20c0 <__clone+0xdc>
    193a:	00033803          	ld	a6,0(t1)
    193e:	00f8c7b3          	xor	a5,a7,a5
    1942:	fff7c713          	not	a4,a5
    1946:	8f95                	sub	a5,a5,a3
    1948:	8ff9                	and	a5,a5,a4
    194a:	0107f7b3          	and	a5,a5,a6
    194e:	e7bd                	bnez	a5,19bc <memchr+0xca>
    1950:	4e1d                	li	t3,7
    1952:	00000e97          	auipc	t4,0x0
    1956:	766e8e93          	addi	t4,t4,1894 # 20b8 <__clone+0xd4>
    195a:	a005                	j	197a <memchr+0x88>
    195c:	6514                	ld	a3,8(a0)
    195e:	000eb783          	ld	a5,0(t4)
    1962:	00033803          	ld	a6,0(t1)
    1966:	00d8c6b3          	xor	a3,a7,a3
    196a:	97b6                	add	a5,a5,a3
    196c:	fff6c693          	not	a3,a3
    1970:	8ff5                	and	a5,a5,a3
    1972:	0107f7b3          	and	a5,a5,a6
    1976:	e3a1                	bnez	a5,19b6 <memchr+0xc4>
    1978:	853a                	mv	a0,a4
    197a:	1661                	addi	a2,a2,-8
    197c:	00850713          	addi	a4,a0,8
    1980:	fcce6ee3          	bltu	t3,a2,195c <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1984:	c215                	beqz	a2,19a8 <memchr+0xb6>
    1986:	00074783          	lbu	a5,0(a4)
    198a:	00f58d63          	beq	a1,a5,19a4 <memchr+0xb2>
    198e:	00170793          	addi	a5,a4,1
    1992:	963a                	add	a2,a2,a4
    1994:	873e                	mv	a4,a5
    1996:	00f60963          	beq	a2,a5,19a8 <memchr+0xb6>
    199a:	0007c683          	lbu	a3,0(a5)
    199e:	0785                	addi	a5,a5,1
    19a0:	feb69ae3          	bne	a3,a1,1994 <memchr+0xa2>
}
    19a4:	853a                	mv	a0,a4
    19a6:	8082                	ret
    return n ? (void *)s : 0;
    19a8:	4701                	li	a4,0
}
    19aa:	853a                	mv	a0,a4
    19ac:	8082                	ret
    19ae:	872a                	mv	a4,a0
    19b0:	00074783          	lbu	a5,0(a4)
    19b4:	bfd9                	j	198a <memchr+0x98>
    19b6:	00854783          	lbu	a5,8(a0)
    19ba:	bfc1                	j	198a <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19bc:	872a                	mv	a4,a0
    19be:	bfc1                	j	198e <memchr+0x9c>

00000000000019c0 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19c0:	00757793          	andi	a5,a0,7
    19c4:	cfc5                	beqz	a5,1a7c <strnlen+0xbc>
    19c6:	c1c5                	beqz	a1,1a66 <strnlen+0xa6>
    19c8:	00054783          	lbu	a5,0(a0)
    19cc:	cfd9                	beqz	a5,1a6a <strnlen+0xaa>
    19ce:	87ae                	mv	a5,a1
    19d0:	86aa                	mv	a3,a0
    19d2:	a029                	j	19dc <strnlen+0x1c>
    19d4:	cbc9                	beqz	a5,1a66 <strnlen+0xa6>
    19d6:	0006c703          	lbu	a4,0(a3)
    19da:	cb51                	beqz	a4,1a6e <strnlen+0xae>
    19dc:	0685                	addi	a3,a3,1
    19de:	0076f713          	andi	a4,a3,7
    19e2:	17fd                	addi	a5,a5,-1
    19e4:	fb65                	bnez	a4,19d4 <strnlen+0x14>
    if (n && *s != c)
    19e6:	c3c1                	beqz	a5,1a66 <strnlen+0xa6>
    19e8:	0006c703          	lbu	a4,0(a3)
    19ec:	c349                	beqz	a4,1a6e <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ee:	471d                	li	a4,7
    19f0:	08f77a63          	bleu	a5,a4,1a84 <strnlen+0xc4>
    19f4:	00000e17          	auipc	t3,0x0
    19f8:	6c4e0e13          	addi	t3,t3,1732 # 20b8 <__clone+0xd4>
    19fc:	6290                	ld	a2,0(a3)
    19fe:	000e3703          	ld	a4,0(t3)
    1a02:	00000e97          	auipc	t4,0x0
    1a06:	6bee8e93          	addi	t4,t4,1726 # 20c0 <__clone+0xdc>
    1a0a:	000eb803          	ld	a6,0(t4)
    1a0e:	9732                	add	a4,a4,a2
    1a10:	fff64613          	not	a2,a2
    1a14:	8f71                	and	a4,a4,a2
    1a16:	01077733          	and	a4,a4,a6
    1a1a:	e72d                	bnez	a4,1a84 <strnlen+0xc4>
    1a1c:	4f1d                	li	t5,7
    1a1e:	a839                	j	1a3c <strnlen+0x7c>
    1a20:	6698                	ld	a4,8(a3)
    1a22:	000e3303          	ld	t1,0(t3)
    1a26:	000eb803          	ld	a6,0(t4)
    1a2a:	fff74893          	not	a7,a4
    1a2e:	971a                	add	a4,a4,t1
    1a30:	01177733          	and	a4,a4,a7
    1a34:	01077733          	and	a4,a4,a6
    1a38:	ef1d                	bnez	a4,1a76 <strnlen+0xb6>
    1a3a:	86b2                	mv	a3,a2
    1a3c:	17e1                	addi	a5,a5,-8
    1a3e:	00868613          	addi	a2,a3,8
    1a42:	fcff6fe3          	bltu	t5,a5,1a20 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a46:	c385                	beqz	a5,1a66 <strnlen+0xa6>
    1a48:	00064703          	lbu	a4,0(a2)
    1a4c:	cb19                	beqz	a4,1a62 <strnlen+0xa2>
    1a4e:	00160713          	addi	a4,a2,1
    1a52:	97b2                	add	a5,a5,a2
    1a54:	863a                	mv	a2,a4
    1a56:	00e78863          	beq	a5,a4,1a66 <strnlen+0xa6>
    1a5a:	0705                	addi	a4,a4,1
    1a5c:	fff74683          	lbu	a3,-1(a4)
    1a60:	faf5                	bnez	a3,1a54 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a62:	40a605b3          	sub	a1,a2,a0
}
    1a66:	852e                	mv	a0,a1
    1a68:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a6a:	87ae                	mv	a5,a1
    1a6c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a6e:	8636                	mv	a2,a3
    1a70:	00064703          	lbu	a4,0(a2)
    1a74:	bfe1                	j	1a4c <strnlen+0x8c>
    1a76:	0086c703          	lbu	a4,8(a3)
    1a7a:	bfc9                	j	1a4c <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7c:	87ae                	mv	a5,a1
    1a7e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a80:	f7a5                	bnez	a5,19e8 <strnlen+0x28>
    1a82:	b7d5                	j	1a66 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a84:	8636                	mv	a2,a3
    1a86:	b7e1                	j	1a4e <strnlen+0x8e>

0000000000001a88 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a88:	00b547b3          	xor	a5,a0,a1
    1a8c:	8b9d                	andi	a5,a5,7
    1a8e:	efa9                	bnez	a5,1ae8 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a90:	0075f793          	andi	a5,a1,7
    1a94:	c38d                	beqz	a5,1ab6 <strcpy+0x2e>
            if (!(*d = *s))
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	00f50023          	sb	a5,0(a0)
    1a9e:	e799                	bnez	a5,1aac <strcpy+0x24>
    1aa0:	a095                	j	1b04 <strcpy+0x7c>
    1aa2:	0005c783          	lbu	a5,0(a1)
    1aa6:	00f50023          	sb	a5,0(a0)
    1aaa:	cbb9                	beqz	a5,1b00 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aac:	0585                	addi	a1,a1,1
    1aae:	0075f793          	andi	a5,a1,7
    1ab2:	0505                	addi	a0,a0,1
    1ab4:	f7fd                	bnez	a5,1aa2 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ab6:	00000797          	auipc	a5,0x0
    1aba:	60278793          	addi	a5,a5,1538 # 20b8 <__clone+0xd4>
    1abe:	0007b803          	ld	a6,0(a5)
    1ac2:	00000797          	auipc	a5,0x0
    1ac6:	5fe78793          	addi	a5,a5,1534 # 20c0 <__clone+0xdc>
    1aca:	6198                	ld	a4,0(a1)
    1acc:	6390                	ld	a2,0(a5)
    1ace:	a031                	j	1ada <strcpy+0x52>
    1ad0:	0521                	addi	a0,a0,8
    1ad2:	05a1                	addi	a1,a1,8
    1ad4:	fee53c23          	sd	a4,-8(a0)
    1ad8:	6198                	ld	a4,0(a1)
    1ada:	010707b3          	add	a5,a4,a6
    1ade:	fff74693          	not	a3,a4
    1ae2:	8ff5                	and	a5,a5,a3
    1ae4:	8ff1                	and	a5,a5,a2
    1ae6:	d7ed                	beqz	a5,1ad0 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ae8:	0005c783          	lbu	a5,0(a1)
    1aec:	00f50023          	sb	a5,0(a0)
    1af0:	cb89                	beqz	a5,1b02 <strcpy+0x7a>
    1af2:	0585                	addi	a1,a1,1
    1af4:	0005c783          	lbu	a5,0(a1)
    1af8:	0505                	addi	a0,a0,1
    1afa:	00f50023          	sb	a5,0(a0)
    1afe:	fbf5                	bnez	a5,1af2 <strcpy+0x6a>
        ;
    return d;
}
    1b00:	8082                	ret
    1b02:	8082                	ret
    1b04:	8082                	ret

0000000000001b06 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b06:	00b547b3          	xor	a5,a0,a1
    1b0a:	8b9d                	andi	a5,a5,7
    1b0c:	ebc1                	bnez	a5,1b9c <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b0e:	0075f793          	andi	a5,a1,7
    1b12:	cf91                	beqz	a5,1b2e <strncpy+0x28>
    1b14:	20060e63          	beqz	a2,1d30 <strncpy+0x22a>
    1b18:	0005c783          	lbu	a5,0(a1)
    1b1c:	00f50023          	sb	a5,0(a0)
    1b20:	c3d5                	beqz	a5,1bc4 <strncpy+0xbe>
    1b22:	0585                	addi	a1,a1,1
    1b24:	0075f793          	andi	a5,a1,7
    1b28:	167d                	addi	a2,a2,-1
    1b2a:	0505                	addi	a0,a0,1
    1b2c:	f7e5                	bnez	a5,1b14 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b2e:	20060163          	beqz	a2,1d30 <strncpy+0x22a>
    1b32:	0005c683          	lbu	a3,0(a1)
    1b36:	c6d9                	beqz	a3,1bc4 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b38:	479d                	li	a5,7
    1b3a:	22c7f563          	bleu	a2,a5,1d64 <strncpy+0x25e>
    1b3e:	00000317          	auipc	t1,0x0
    1b42:	57a30313          	addi	t1,t1,1402 # 20b8 <__clone+0xd4>
    1b46:	6198                	ld	a4,0(a1)
    1b48:	00033783          	ld	a5,0(t1)
    1b4c:	00000e17          	auipc	t3,0x0
    1b50:	574e0e13          	addi	t3,t3,1396 # 20c0 <__clone+0xdc>
    1b54:	000e3803          	ld	a6,0(t3)
    1b58:	97ba                	add	a5,a5,a4
    1b5a:	fff74893          	not	a7,a4
    1b5e:	0117f7b3          	and	a5,a5,a7
    1b62:	0107f7b3          	and	a5,a5,a6
    1b66:	1e079f63          	bnez	a5,1d64 <strncpy+0x25e>
    1b6a:	4e9d                	li	t4,7
    1b6c:	a005                	j	1b8c <strncpy+0x86>
    1b6e:	6598                	ld	a4,8(a1)
    1b70:	00033783          	ld	a5,0(t1)
    1b74:	000e3803          	ld	a6,0(t3)
    1b78:	fff74893          	not	a7,a4
    1b7c:	97ba                	add	a5,a5,a4
    1b7e:	0117f7b3          	and	a5,a5,a7
    1b82:	0107f7b3          	and	a5,a5,a6
    1b86:	1a079f63          	bnez	a5,1d44 <strncpy+0x23e>
    1b8a:	85b6                	mv	a1,a3
            *wd = *ws;
    1b8c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b8e:	1661                	addi	a2,a2,-8
    1b90:	00858693          	addi	a3,a1,8
    1b94:	0521                	addi	a0,a0,8
    1b96:	fcceece3          	bltu	t4,a2,1b6e <strncpy+0x68>
    1b9a:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b9c:	18060a63          	beqz	a2,1d30 <strncpy+0x22a>
    1ba0:	0005c783          	lbu	a5,0(a1)
    1ba4:	872a                	mv	a4,a0
    1ba6:	00f50023          	sb	a5,0(a0)
    1baa:	e799                	bnez	a5,1bb8 <strncpy+0xb2>
    1bac:	a829                	j	1bc6 <strncpy+0xc0>
    1bae:	0005c783          	lbu	a5,0(a1)
    1bb2:	00f70023          	sb	a5,0(a4)
    1bb6:	cb81                	beqz	a5,1bc6 <strncpy+0xc0>
    1bb8:	167d                	addi	a2,a2,-1
    1bba:	0585                	addi	a1,a1,1
    1bbc:	0705                	addi	a4,a4,1
    1bbe:	fa65                	bnez	a2,1bae <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bc0:	853a                	mv	a0,a4
    1bc2:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bc4:	872a                	mv	a4,a0
    1bc6:	4805                	li	a6,1
    1bc8:	14061c63          	bnez	a2,1d20 <strncpy+0x21a>
    1bcc:	40e007b3          	neg	a5,a4
    1bd0:	8b9d                	andi	a5,a5,7
    1bd2:	4581                	li	a1,0
    1bd4:	12061e63          	bnez	a2,1d10 <strncpy+0x20a>
    1bd8:	00778693          	addi	a3,a5,7
    1bdc:	452d                	li	a0,11
    1bde:	12a6e763          	bltu	a3,a0,1d0c <strncpy+0x206>
    1be2:	16d5e663          	bltu	a1,a3,1d4e <strncpy+0x248>
    1be6:	14078c63          	beqz	a5,1d3e <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bea:	00070023          	sb	zero,0(a4)
    1bee:	4585                	li	a1,1
    1bf0:	00170693          	addi	a3,a4,1
    1bf4:	14b78363          	beq	a5,a1,1d3a <strncpy+0x234>
    1bf8:	000700a3          	sb	zero,1(a4)
    1bfc:	4589                	li	a1,2
    1bfe:	00270693          	addi	a3,a4,2
    1c02:	14b78963          	beq	a5,a1,1d54 <strncpy+0x24e>
    1c06:	00070123          	sb	zero,2(a4)
    1c0a:	458d                	li	a1,3
    1c0c:	00370693          	addi	a3,a4,3
    1c10:	12b78363          	beq	a5,a1,1d36 <strncpy+0x230>
    1c14:	000701a3          	sb	zero,3(a4)
    1c18:	4591                	li	a1,4
    1c1a:	00470693          	addi	a3,a4,4
    1c1e:	12b78d63          	beq	a5,a1,1d58 <strncpy+0x252>
    1c22:	00070223          	sb	zero,4(a4)
    1c26:	4595                	li	a1,5
    1c28:	00570693          	addi	a3,a4,5
    1c2c:	12b78863          	beq	a5,a1,1d5c <strncpy+0x256>
    1c30:	000702a3          	sb	zero,5(a4)
    1c34:	459d                	li	a1,7
    1c36:	00670693          	addi	a3,a4,6
    1c3a:	12b79363          	bne	a5,a1,1d60 <strncpy+0x25a>
    1c3e:	00770693          	addi	a3,a4,7
    1c42:	00070323          	sb	zero,6(a4)
    1c46:	40f80833          	sub	a6,a6,a5
    1c4a:	ff887513          	andi	a0,a6,-8
    1c4e:	97ba                	add	a5,a5,a4
    1c50:	953e                	add	a0,a0,a5
    1c52:	0007b023          	sd	zero,0(a5)
    1c56:	07a1                	addi	a5,a5,8
    1c58:	fea79de3          	bne	a5,a0,1c52 <strncpy+0x14c>
    1c5c:	ff887513          	andi	a0,a6,-8
    1c60:	9da9                	addw	a1,a1,a0
    1c62:	00a687b3          	add	a5,a3,a0
    1c66:	f4a80de3          	beq	a6,a0,1bc0 <strncpy+0xba>
    1c6a:	00078023          	sb	zero,0(a5)
    1c6e:	0015869b          	addiw	a3,a1,1
    1c72:	f4c6f7e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1c76:	000780a3          	sb	zero,1(a5)
    1c7a:	0025869b          	addiw	a3,a1,2
    1c7e:	f4c6f1e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1c82:	00078123          	sb	zero,2(a5)
    1c86:	0035869b          	addiw	a3,a1,3
    1c8a:	f2c6fbe3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1c8e:	000781a3          	sb	zero,3(a5)
    1c92:	0045869b          	addiw	a3,a1,4
    1c96:	f2c6f5e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1c9a:	00078223          	sb	zero,4(a5)
    1c9e:	0055869b          	addiw	a3,a1,5
    1ca2:	f0c6ffe3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1ca6:	000782a3          	sb	zero,5(a5)
    1caa:	0065869b          	addiw	a3,a1,6
    1cae:	f0c6f9e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cb2:	00078323          	sb	zero,6(a5)
    1cb6:	0075869b          	addiw	a3,a1,7
    1cba:	f0c6f3e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cbe:	000783a3          	sb	zero,7(a5)
    1cc2:	0085869b          	addiw	a3,a1,8
    1cc6:	eec6fde3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cca:	00078423          	sb	zero,8(a5)
    1cce:	0095869b          	addiw	a3,a1,9
    1cd2:	eec6f7e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cd6:	000784a3          	sb	zero,9(a5)
    1cda:	00a5869b          	addiw	a3,a1,10
    1cde:	eec6f1e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1ce2:	00078523          	sb	zero,10(a5)
    1ce6:	00b5869b          	addiw	a3,a1,11
    1cea:	ecc6fbe3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cee:	000785a3          	sb	zero,11(a5)
    1cf2:	00c5869b          	addiw	a3,a1,12
    1cf6:	ecc6f5e3          	bleu	a2,a3,1bc0 <strncpy+0xba>
    1cfa:	00078623          	sb	zero,12(a5)
    1cfe:	25b5                	addiw	a1,a1,13
    1d00:	ecc5f0e3          	bleu	a2,a1,1bc0 <strncpy+0xba>
    1d04:	000786a3          	sb	zero,13(a5)
}
    1d08:	853a                	mv	a0,a4
    1d0a:	8082                	ret
    1d0c:	46ad                	li	a3,11
    1d0e:	bdd1                	j	1be2 <strncpy+0xdc>
    1d10:	00778693          	addi	a3,a5,7
    1d14:	452d                	li	a0,11
    1d16:	fff60593          	addi	a1,a2,-1
    1d1a:	eca6f4e3          	bleu	a0,a3,1be2 <strncpy+0xdc>
    1d1e:	b7fd                	j	1d0c <strncpy+0x206>
    1d20:	40e007b3          	neg	a5,a4
    1d24:	8832                	mv	a6,a2
    1d26:	8b9d                	andi	a5,a5,7
    1d28:	4581                	li	a1,0
    1d2a:	ea0607e3          	beqz	a2,1bd8 <strncpy+0xd2>
    1d2e:	b7cd                	j	1d10 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d30:	872a                	mv	a4,a0
}
    1d32:	853a                	mv	a0,a4
    1d34:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d36:	458d                	li	a1,3
    1d38:	b739                	j	1c46 <strncpy+0x140>
    1d3a:	4585                	li	a1,1
    1d3c:	b729                	j	1c46 <strncpy+0x140>
    1d3e:	86ba                	mv	a3,a4
    1d40:	4581                	li	a1,0
    1d42:	b711                	j	1c46 <strncpy+0x140>
    1d44:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d48:	872a                	mv	a4,a0
    1d4a:	85b6                	mv	a1,a3
    1d4c:	bda9                	j	1ba6 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d4e:	87ba                	mv	a5,a4
    1d50:	4581                	li	a1,0
    1d52:	bf21                	j	1c6a <strncpy+0x164>
    1d54:	4589                	li	a1,2
    1d56:	bdc5                	j	1c46 <strncpy+0x140>
    1d58:	4591                	li	a1,4
    1d5a:	b5f5                	j	1c46 <strncpy+0x140>
    1d5c:	4595                	li	a1,5
    1d5e:	b5e5                	j	1c46 <strncpy+0x140>
    1d60:	4599                	li	a1,6
    1d62:	b5d5                	j	1c46 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d64:	00d50023          	sb	a3,0(a0)
    1d68:	872a                	mv	a4,a0
    1d6a:	b5b9                	j	1bb8 <strncpy+0xb2>

0000000000001d6c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d6c:	87aa                	mv	a5,a0
    1d6e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d70:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d74:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d78:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d7a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <openat>:
    register long a7 __asm__("a7") = n;
    1d84:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d88:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <close>:
    register long a7 __asm__("a7") = n;
    1d94:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <read>:
    register long a7 __asm__("a7") = n;
    1da0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1da8:	8082                	ret

0000000000001daa <write>:
    register long a7 __asm__("a7") = n;
    1daa:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dae:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1db2:	8082                	ret

0000000000001db4 <getpid>:
    register long a7 __asm__("a7") = n;
    1db4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1db8:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <getppid>:
    register long a7 __asm__("a7") = n;
    1dc0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dc4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dcc:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dd0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <fork>:
    register long a7 __asm__("a7") = n;
    1dd8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1ddc:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dde:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1de8:	85b2                	mv	a1,a2
    1dea:	863a                	mv	a2,a4
    if (stack)
    1dec:	c191                	beqz	a1,1df0 <clone+0x8>
	stack += stack_size;
    1dee:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1df0:	4781                	li	a5,0
    1df2:	4701                	li	a4,0
    1df4:	4681                	li	a3,0
    1df6:	2601                	sext.w	a2,a2
    1df8:	1ec0006f          	j	1fe4 <__clone>

0000000000001dfc <exit>:
    register long a7 __asm__("a7") = n;
    1dfc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e04:	8082                	ret

0000000000001e06 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e06:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e0a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e0c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <exec>:
    register long a7 __asm__("a7") = n;
    1e14:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <execve>:
    register long a7 __asm__("a7") = n;
    1e20:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <times>:
    register long a7 __asm__("a7") = n;
    1e2c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <get_time>:

int64 get_time()
{
    1e38:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e3a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e3e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e40:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e42:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e46:	2501                	sext.w	a0,a0
    1e48:	ed09                	bnez	a0,1e62 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e4a:	67a2                	ld	a5,8(sp)
    1e4c:	3e800713          	li	a4,1000
    1e50:	00015503          	lhu	a0,0(sp)
    1e54:	02e7d7b3          	divu	a5,a5,a4
    1e58:	02e50533          	mul	a0,a0,a4
    1e5c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e5e:	0141                	addi	sp,sp,16
    1e60:	8082                	ret
        return -1;
    1e62:	557d                	li	a0,-1
    1e64:	bfed                	j	1e5e <get_time+0x26>

0000000000001e66 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e66:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <time>:
    register long a7 __asm__("a7") = n;
    1e72:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <sleep>:

int sleep(unsigned long long time)
{
    1e7e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e80:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e82:	850a                	mv	a0,sp
    1e84:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e86:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e8a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e90:	e501                	bnez	a0,1e98 <sleep+0x1a>
    return 0;
    1e92:	4501                	li	a0,0
}
    1e94:	0141                	addi	sp,sp,16
    1e96:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e98:	4502                	lw	a0,0(sp)
}
    1e9a:	0141                	addi	sp,sp,16
    1e9c:	8082                	ret

0000000000001e9e <set_priority>:
    register long a7 __asm__("a7") = n;
    1e9e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ea2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1eaa:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1eae:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eb2:	8082                	ret

0000000000001eb4 <munmap>:
    register long a7 __asm__("a7") = n;
    1eb4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <wait>:

int wait(int *code)
{
    1ec0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ec2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ec6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ec8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eca:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ecc:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <spawn>:
    register long a7 __asm__("a7") = n;
    1ed4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ed8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <mailread>:
    register long a7 __asm__("a7") = n;
    1ee0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eec:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <fstat>:
    register long a7 __asm__("a7") = n;
    1ef8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f04:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f06:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f0a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f14:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f16:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f1a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <link>:

int link(char *old_path, char *new_path)
{
    1f24:	87aa                	mv	a5,a0
    1f26:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f28:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f2c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f30:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f32:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f36:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f38:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <unlink>:

int unlink(char *path)
{
    1f40:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f42:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f46:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f4a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <uname>:
    register long a7 __asm__("a7") = n;
    1f54:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f58:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <brk>:
    register long a7 __asm__("a7") = n;
    1f60:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f64:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <getcwd>:
    register long a7 __asm__("a7") = n;
    1f6c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f72:	8082                	ret

0000000000001f74 <chdir>:
    register long a7 __asm__("a7") = n;
    1f74:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f78:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f80:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f82:	02059613          	slli	a2,a1,0x20
    1f86:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f88:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f8c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f90:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f92:	00000073          	ecall
}
    1f96:	2501                	sext.w	a0,a0
    1f98:	8082                	ret

0000000000001f9a <getdents>:
    register long a7 __asm__("a7") = n;
    1f9a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fa2:	2501                	sext.w	a0,a0
    1fa4:	8082                	ret

0000000000001fa6 <pipe>:
    register long a7 __asm__("a7") = n;
    1fa6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1faa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fac:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fb0:	2501                	sext.w	a0,a0
    1fb2:	8082                	ret

0000000000001fb4 <dup>:
    register long a7 __asm__("a7") = n;
    1fb4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fb6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fba:	2501                	sext.w	a0,a0
    1fbc:	8082                	ret

0000000000001fbe <dup2>:
    register long a7 __asm__("a7") = n;
    1fbe:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fc0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fc6:	2501                	sext.w	a0,a0
    1fc8:	8082                	ret

0000000000001fca <mount>:
    register long a7 __asm__("a7") = n;
    1fca:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fce:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fd2:	2501                	sext.w	a0,a0
    1fd4:	8082                	ret

0000000000001fd6 <umount>:
    register long a7 __asm__("a7") = n;
    1fd6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fda:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fdc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fe0:	2501                	sext.w	a0,a0
    1fe2:	8082                	ret

0000000000001fe4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fe4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fe6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fe8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fea:	8532                	mv	a0,a2
	mv a2, a4
    1fec:	863a                	mv	a2,a4
	mv a3, a5
    1fee:	86be                	mv	a3,a5
	mv a4, a6
    1ff0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ff2:	0dc00893          	li	a7,220
	ecall
    1ff6:	00000073          	ecall

	beqz a0, 1f
    1ffa:	c111                	beqz	a0,1ffe <__clone+0x1a>
	# Parent
	ret
    1ffc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ffe:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2000:	6522                	ld	a0,8(sp)
	jalr a1
    2002:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2004:	05d00893          	li	a7,93
	ecall
    2008:	00000073          	ecall
