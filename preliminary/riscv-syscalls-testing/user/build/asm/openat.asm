
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/openat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0ce0006f          	j	10d0 <__start_main>

0000000000001006 <test_openat>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_openat(void) {
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	00050513          	mv	a0,a0
void test_openat(void) {
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1014:	2bc000ef          	jal	ra,12d0 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0c050513          	addi	a0,a0,192 # 20d8 <__func__.1186>
    1020:	2b0000ef          	jal	ra,12d0 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	ffc50513          	addi	a0,a0,-4 # 2020 <__clone+0x40>
    102c:	2a4000ef          	jal	ra,12d0 <puts>
    //int fd_dir = open(".", O_RDONLY | O_CREATE);
    int fd_dir = open("./mnt", O_DIRECTORY);
    1030:	002005b7          	lui	a1,0x200
    1034:	00001517          	auipc	a0,0x1
    1038:	ffc50513          	addi	a0,a0,-4 # 2030 <__clone+0x50>
    103c:	52d000ef          	jal	ra,1d68 <open>
    1040:	842a                	mv	s0,a0
    printf("open dir fd: %d\n", fd_dir);
    1042:	85aa                	mv	a1,a0
    1044:	00001517          	auipc	a0,0x1
    1048:	ff450513          	addi	a0,a0,-12 # 2038 <__clone+0x58>
    104c:	2a6000ef          	jal	ra,12f2 <printf>
    int fd = openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR);
    1050:	00001597          	auipc	a1,0x1
    1054:	00058593          	mv	a1,a1
    1058:	8522                	mv	a0,s0
    105a:	04200613          	li	a2,66
    105e:	523000ef          	jal	ra,1d80 <openat>
    1062:	842a                	mv	s0,a0
    printf("openat fd: %d\n", fd);
    1064:	85aa                	mv	a1,a0
    1066:	00001517          	auipc	a0,0x1
    106a:	ffa50513          	addi	a0,a0,-6 # 2060 <__clone+0x80>
    106e:	284000ef          	jal	ra,12f2 <printf>
    assert(fd > 0);
    1072:	04805063          	blez	s0,10b2 <test_openat+0xac>
    printf("openat success.\n");
    1076:	00001517          	auipc	a0,0x1
    107a:	01a50513          	addi	a0,a0,26 # 2090 <__clone+0xb0>
    107e:	274000ef          	jal	ra,12f2 <printf>
    write(fd, buf, strlen(buf));
    int size = read(fd, buf, 256);
    if (size > 0) printf("  openat success.\n");
    else printf("  openat error.\n");
    */
    close(fd);	
    1082:	8522                	mv	a0,s0
    1084:	50d000ef          	jal	ra,1d90 <close>
	
    TEST_END(__func__);
    1088:	00001517          	auipc	a0,0x1
    108c:	02050513          	addi	a0,a0,32 # 20a8 <__clone+0xc8>
    1090:	240000ef          	jal	ra,12d0 <puts>
    1094:	00001517          	auipc	a0,0x1
    1098:	04450513          	addi	a0,a0,68 # 20d8 <__func__.1186>
    109c:	234000ef          	jal	ra,12d0 <puts>
}
    10a0:	6402                	ld	s0,0(sp)
    10a2:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	f7c50513          	addi	a0,a0,-132 # 2020 <__clone+0x40>
}
    10ac:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10ae:	2220006f          	j	12d0 <puts>
    assert(fd > 0);
    10b2:	00001517          	auipc	a0,0x1
    10b6:	fbe50513          	addi	a0,a0,-66 # 2070 <__clone+0x90>
    10ba:	4dc000ef          	jal	ra,1596 <panic>
    10be:	bf65                	j	1076 <test_openat+0x70>

00000000000010c0 <main>:

int main(void) {
    10c0:	1141                	addi	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    test_openat();
    10c4:	f43ff0ef          	jal	ra,1006 <test_openat>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d2:	4108                	lw	a0,0(a0)
{
    10d4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d6:	05a1                	addi	a1,a1,8
{
    10d8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10da:	fe7ff0ef          	jal	ra,10c0 <main>
    10de:	51b000ef          	jal	ra,1df8 <exit>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	addi	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ea:	7179                	addi	sp,sp,-48
    10ec:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ee:	12054e63          	bltz	a0,122a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10f2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10f6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f8:	02b7f6bb          	remuw	a3,a5,a1
    10fc:	00001717          	auipc	a4,0x1
    1100:	fec70713          	addi	a4,a4,-20 # 20e8 <digits>
    buf[16] = 0;
    1104:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1108:	1682                	slli	a3,a3,0x20
    110a:	9281                	srli	a3,a3,0x20
    110c:	96ba                	add	a3,a3,a4
    110e:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1112:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1116:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    111a:	16b7e363          	bltu	a5,a1,1280 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    111e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1122:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1126:	1602                	slli	a2,a2,0x20
    1128:	9201                	srli	a2,a2,0x20
    112a:	963a                	add	a2,a2,a4
    112c:	00064603          	lbu	a2,0(a2)
    1130:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1134:	0007861b          	sext.w	a2,a5
    1138:	12b6e863          	bltu	a3,a1,1268 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    113c:	02b7f6bb          	remuw	a3,a5,a1
    1140:	1682                	slli	a3,a3,0x20
    1142:	9281                	srli	a3,a3,0x20
    1144:	96ba                	add	a3,a3,a4
    1146:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    114e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1152:	10b66e63          	bltu	a2,a1,126e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1156:	02b876bb          	remuw	a3,a6,a1
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96ba                	add	a3,a3,a4
    1160:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1164:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1168:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    116c:	10b86463          	bltu	a6,a1,1274 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1170:	02b676bb          	remuw	a3,a2,a1
    1174:	1682                	slli	a3,a3,0x20
    1176:	9281                	srli	a3,a3,0x20
    1178:	96ba                	add	a3,a3,a4
    117a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1182:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1186:	0eb66a63          	bltu	a2,a1,127a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    118a:	02b876bb          	remuw	a3,a6,a1
    118e:	1682                	slli	a3,a3,0x20
    1190:	9281                	srli	a3,a3,0x20
    1192:	96ba                	add	a3,a3,a4
    1194:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1198:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    119c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a0:	0cb86163          	bltu	a6,a1,1262 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11a4:	02b676bb          	remuw	a3,a2,a1
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96ba                	add	a3,a3,a4
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11b6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ba:	0cb66563          	bltu	a2,a1,1284 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11be:	02b876bb          	remuw	a3,a6,a1
    11c2:	1682                	slli	a3,a3,0x20
    11c4:	9281                	srli	a3,a3,0x20
    11c6:	96ba                	add	a3,a3,a4
    11c8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11cc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11d0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d4:	0ab86b63          	bltu	a6,a1,128a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11d8:	02b676bb          	remuw	a3,a2,a1
    11dc:	1682                	slli	a3,a3,0x20
    11de:	9281                	srli	a3,a3,0x20
    11e0:	96ba                	add	a3,a3,a4
    11e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ea:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ee:	0ab66163          	bltu	a2,a1,1290 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11f2:	1782                	slli	a5,a5,0x20
    11f4:	9381                	srli	a5,a5,0x20
    11f6:	97ba                	add	a5,a5,a4
    11f8:	0007c703          	lbu	a4,0(a5)
    11fc:	4599                	li	a1,6
    11fe:	4795                	li	a5,5
    1200:	00e10723          	sb	a4,14(sp)

    if (sign)
    1204:	00055963          	bgez	a0,1216 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1208:	1018                	addi	a4,sp,32
    120a:	973e                	add	a4,a4,a5
    120c:	02d00693          	li	a3,45
    1210:	fed70423          	sb	a3,-24(a4)
    1214:	85be                	mv	a1,a5
    write(f, s, l);
    1216:	003c                	addi	a5,sp,8
    1218:	4641                	li	a2,16
    121a:	9e0d                	subw	a2,a2,a1
    121c:	4505                	li	a0,1
    121e:	95be                	add	a1,a1,a5
    1220:	387000ef          	jal	ra,1da6 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1224:	70a2                	ld	ra,40(sp)
    1226:	6145                	addi	sp,sp,48
    1228:	8082                	ret
        x = -xx;
    122a:	40a0063b          	negw	a2,a0
    122e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1230:	02b677bb          	remuw	a5,a2,a1
    1234:	00001717          	auipc	a4,0x1
    1238:	eb470713          	addi	a4,a4,-332 # 20e8 <digits>
    buf[16] = 0;
    123c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1240:	1782                	slli	a5,a5,0x20
    1242:	9381                	srli	a5,a5,0x20
    1244:	97ba                	add	a5,a5,a4
    1246:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    124e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1252:	ecb676e3          	bleu	a1,a2,111e <printint.constprop.0+0x34>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    125e:	45b9                	li	a1,14
    1260:	bf5d                	j	1216 <printint.constprop.0+0x12c>
    1262:	47a5                	li	a5,9
    1264:	45a9                	li	a1,10
    1266:	bf79                	j	1204 <printint.constprop.0+0x11a>
    1268:	47b5                	li	a5,13
    126a:	45b9                	li	a1,14
    126c:	bf61                	j	1204 <printint.constprop.0+0x11a>
    126e:	47b1                	li	a5,12
    1270:	45b5                	li	a1,13
    1272:	bf49                	j	1204 <printint.constprop.0+0x11a>
    1274:	47ad                	li	a5,11
    1276:	45b1                	li	a1,12
    1278:	b771                	j	1204 <printint.constprop.0+0x11a>
    127a:	47a9                	li	a5,10
    127c:	45ad                	li	a1,11
    127e:	b759                	j	1204 <printint.constprop.0+0x11a>
    i = 15;
    1280:	45bd                	li	a1,15
    1282:	bf51                	j	1216 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1284:	47a1                	li	a5,8
    1286:	45a5                	li	a1,9
    1288:	bfb5                	j	1204 <printint.constprop.0+0x11a>
    128a:	479d                	li	a5,7
    128c:	45a1                	li	a1,8
    128e:	bf9d                	j	1204 <printint.constprop.0+0x11a>
    1290:	4799                	li	a5,6
    1292:	459d                	li	a1,7
    1294:	bf85                	j	1204 <printint.constprop.0+0x11a>

0000000000001296 <getchar>:
{
    1296:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1298:	00f10593          	addi	a1,sp,15
    129c:	4605                	li	a2,1
    129e:	4501                	li	a0,0
{
    12a0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a6:	2f7000ef          	jal	ra,1d9c <read>
}
    12aa:	60e2                	ld	ra,24(sp)
    12ac:	00f14503          	lbu	a0,15(sp)
    12b0:	6105                	addi	sp,sp,32
    12b2:	8082                	ret

00000000000012b4 <putchar>:
{
    12b4:	1101                	addi	sp,sp,-32
    char byte = c;
    12b6:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12ba:	00f10593          	addi	a1,sp,15
    12be:	4605                	li	a2,1
    12c0:	4505                	li	a0,1
{
    12c2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12c4:	2e3000ef          	jal	ra,1da6 <write>
}
    12c8:	60e2                	ld	ra,24(sp)
    12ca:	2501                	sext.w	a0,a0
    12cc:	6105                	addi	sp,sp,32
    12ce:	8082                	ret

00000000000012d0 <puts>:
{
    12d0:	1141                	addi	sp,sp,-16
    12d2:	e406                	sd	ra,8(sp)
    12d4:	e022                	sd	s0,0(sp)
    12d6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d8:	5b2000ef          	jal	ra,188a <strlen>
    12dc:	862a                	mv	a2,a0
    12de:	85a2                	mv	a1,s0
    12e0:	4505                	li	a0,1
    12e2:	2c5000ef          	jal	ra,1da6 <write>
}
    12e6:	60a2                	ld	ra,8(sp)
    12e8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ea:	957d                	srai	a0,a0,0x3f
    return r;
    12ec:	2501                	sext.w	a0,a0
}
    12ee:	0141                	addi	sp,sp,16
    12f0:	8082                	ret

00000000000012f2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f2:	7131                	addi	sp,sp,-192
    12f4:	e0da                	sd	s6,64(sp)
    12f6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12f8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12fa:	013c                	addi	a5,sp,136
{
    12fc:	f0ca                	sd	s2,96(sp)
    12fe:	ecce                	sd	s3,88(sp)
    1300:	e8d2                	sd	s4,80(sp)
    1302:	e4d6                	sd	s5,72(sp)
    1304:	fc5e                	sd	s7,56(sp)
    1306:	fc86                	sd	ra,120(sp)
    1308:	f8a2                	sd	s0,112(sp)
    130a:	f4a6                	sd	s1,104(sp)
    130c:	89aa                	mv	s3,a0
    130e:	e52e                	sd	a1,136(sp)
    1310:	e932                	sd	a2,144(sp)
    1312:	ed36                	sd	a3,152(sp)
    1314:	f13a                	sd	a4,160(sp)
    1316:	f942                	sd	a6,176(sp)
    1318:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    131c:	02500913          	li	s2,37
    1320:	07000a93          	li	s5,112
    buf[i++] = '0';
    1324:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1328:	00001a17          	auipc	s4,0x1
    132c:	dc0a0a13          	addi	s4,s4,-576 # 20e8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1330:	00001b97          	auipc	s7,0x1
    1334:	d88b8b93          	addi	s7,s7,-632 # 20b8 <__clone+0xd8>
        if (!*s)
    1338:	0009c783          	lbu	a5,0(s3)
    133c:	cfb9                	beqz	a5,139a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    133e:	23278d63          	beq	a5,s2,1578 <printf+0x286>
    1342:	864e                	mv	a2,s3
    1344:	a019                	j	134a <printf+0x58>
    1346:	07278563          	beq	a5,s2,13b0 <printf+0xbe>
    134a:	0605                	addi	a2,a2,1
    134c:	00064783          	lbu	a5,0(a2)
    1350:	fbfd                	bnez	a5,1346 <printf+0x54>
    1352:	84b2                	mv	s1,a2
        l = z - a;
    1354:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1358:	8622                	mv	a2,s0
    135a:	85ce                	mv	a1,s3
    135c:	4505                	li	a0,1
    135e:	249000ef          	jal	ra,1da6 <write>
        if (l)
    1362:	ec3d                	bnez	s0,13e0 <printf+0xee>
        if (s[1] == 0)
    1364:	0014c783          	lbu	a5,1(s1)
    1368:	cb8d                	beqz	a5,139a <printf+0xa8>
        switch (s[1])
    136a:	09578b63          	beq	a5,s5,1400 <printf+0x10e>
    136e:	06fafb63          	bleu	a5,s5,13e4 <printf+0xf2>
    1372:	07300713          	li	a4,115
    1376:	1ce78e63          	beq	a5,a4,1552 <printf+0x260>
    137a:	07800713          	li	a4,120
    137e:	1ae79563          	bne	a5,a4,1528 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1382:	6782                	ld	a5,0(sp)
    1384:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1386:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    138a:	4388                	lw	a0,0(a5)
    138c:	07a1                	addi	a5,a5,8
    138e:	e03e                	sd	a5,0(sp)
    1390:	d5bff0ef          	jal	ra,10ea <printint.constprop.0>
        if (!*s)
    1394:	0009c783          	lbu	a5,0(s3)
    1398:	f3dd                	bnez	a5,133e <printf+0x4c>
    }
    va_end(ap);
}
    139a:	70e6                	ld	ra,120(sp)
    139c:	7446                	ld	s0,112(sp)
    139e:	74a6                	ld	s1,104(sp)
    13a0:	7906                	ld	s2,96(sp)
    13a2:	69e6                	ld	s3,88(sp)
    13a4:	6a46                	ld	s4,80(sp)
    13a6:	6aa6                	ld	s5,72(sp)
    13a8:	6b06                	ld	s6,64(sp)
    13aa:	7be2                	ld	s7,56(sp)
    13ac:	6129                	addi	sp,sp,192
    13ae:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13b0:	00164783          	lbu	a5,1(a2)
    13b4:	84b2                	mv	s1,a2
    13b6:	01278763          	beq	a5,s2,13c4 <printf+0xd2>
    13ba:	bf69                	j	1354 <printf+0x62>
    13bc:	0014c783          	lbu	a5,1(s1)
    13c0:	f9279ae3          	bne	a5,s2,1354 <printf+0x62>
    13c4:	0489                	addi	s1,s1,2
    13c6:	0004c783          	lbu	a5,0(s1)
    13ca:	0605                	addi	a2,a2,1
    13cc:	ff2788e3          	beq	a5,s2,13bc <printf+0xca>
        l = z - a;
    13d0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13d4:	8622                	mv	a2,s0
    13d6:	85ce                	mv	a1,s3
    13d8:	4505                	li	a0,1
    13da:	1cd000ef          	jal	ra,1da6 <write>
        if (l)
    13de:	d059                	beqz	s0,1364 <printf+0x72>
    13e0:	89a6                	mv	s3,s1
    13e2:	bf99                	j	1338 <printf+0x46>
    13e4:	06400713          	li	a4,100
    13e8:	14e79063          	bne	a5,a4,1528 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13ec:	6782                	ld	a5,0(sp)
    13ee:	45a9                	li	a1,10
        s += 2;
    13f0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13f4:	4388                	lw	a0,0(a5)
    13f6:	07a1                	addi	a5,a5,8
    13f8:	e03e                	sd	a5,0(sp)
    13fa:	cf1ff0ef          	jal	ra,10ea <printint.constprop.0>
        s += 2;
    13fe:	bf59                	j	1394 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1400:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1402:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1406:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1408:	631c                	ld	a5,0(a4)
    140a:	0721                	addi	a4,a4,8
    140c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    140e:	00479293          	slli	t0,a5,0x4
    1412:	00879f93          	slli	t6,a5,0x8
    1416:	00c79f13          	slli	t5,a5,0xc
    141a:	01079e93          	slli	t4,a5,0x10
    141e:	01479e13          	slli	t3,a5,0x14
    1422:	01879313          	slli	t1,a5,0x18
    1426:	01c79893          	slli	a7,a5,0x1c
    142a:	02479813          	slli	a6,a5,0x24
    142e:	02879513          	slli	a0,a5,0x28
    1432:	02c79593          	slli	a1,a5,0x2c
    1436:	03079693          	slli	a3,a5,0x30
    143a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    143e:	03c7d413          	srli	s0,a5,0x3c
    1442:	01c7d39b          	srliw	t2,a5,0x1c
    1446:	03c2d293          	srli	t0,t0,0x3c
    144a:	03cfdf93          	srli	t6,t6,0x3c
    144e:	03cf5f13          	srli	t5,t5,0x3c
    1452:	03cede93          	srli	t4,t4,0x3c
    1456:	03ce5e13          	srli	t3,t3,0x3c
    145a:	03c35313          	srli	t1,t1,0x3c
    145e:	03c8d893          	srli	a7,a7,0x3c
    1462:	03c85813          	srli	a6,a6,0x3c
    1466:	9171                	srli	a0,a0,0x3c
    1468:	91f1                	srli	a1,a1,0x3c
    146a:	92f1                	srli	a3,a3,0x3c
    146c:	9371                	srli	a4,a4,0x3c
    146e:	96d2                	add	a3,a3,s4
    1470:	9752                	add	a4,a4,s4
    1472:	9452                	add	s0,s0,s4
    1474:	92d2                	add	t0,t0,s4
    1476:	9fd2                	add	t6,t6,s4
    1478:	9f52                	add	t5,t5,s4
    147a:	9ed2                	add	t4,t4,s4
    147c:	9e52                	add	t3,t3,s4
    147e:	9352                	add	t1,t1,s4
    1480:	98d2                	add	a7,a7,s4
    1482:	93d2                	add	t2,t2,s4
    1484:	9852                	add	a6,a6,s4
    1486:	9552                	add	a0,a0,s4
    1488:	95d2                	add	a1,a1,s4
    148a:	0006c983          	lbu	s3,0(a3)
    148e:	0002c283          	lbu	t0,0(t0)
    1492:	00074683          	lbu	a3,0(a4)
    1496:	000fcf83          	lbu	t6,0(t6)
    149a:	000f4f03          	lbu	t5,0(t5)
    149e:	000ece83          	lbu	t4,0(t4)
    14a2:	000e4e03          	lbu	t3,0(t3)
    14a6:	00034303          	lbu	t1,0(t1)
    14aa:	0008c883          	lbu	a7,0(a7)
    14ae:	0003c383          	lbu	t2,0(t2)
    14b2:	00084803          	lbu	a6,0(a6)
    14b6:	00054503          	lbu	a0,0(a0)
    14ba:	0005c583          	lbu	a1,0(a1) # 2050 <__clone+0x70>
    14be:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c6:	9371                	srli	a4,a4,0x3c
    14c8:	8bbd                	andi	a5,a5,15
    14ca:	9752                	add	a4,a4,s4
    14cc:	97d2                	add	a5,a5,s4
    14ce:	005105a3          	sb	t0,11(sp)
    14d2:	01f10623          	sb	t6,12(sp)
    14d6:	01e106a3          	sb	t5,13(sp)
    14da:	01d10723          	sb	t4,14(sp)
    14de:	01c107a3          	sb	t3,15(sp)
    14e2:	00610823          	sb	t1,16(sp)
    14e6:	011108a3          	sb	a7,17(sp)
    14ea:	00710923          	sb	t2,18(sp)
    14ee:	010109a3          	sb	a6,19(sp)
    14f2:	00a10a23          	sb	a0,20(sp)
    14f6:	00b10aa3          	sb	a1,21(sp)
    14fa:	01310b23          	sb	s3,22(sp)
    14fe:	00d10ba3          	sb	a3,23(sp)
    1502:	00810523          	sb	s0,10(sp)
    1506:	00074703          	lbu	a4,0(a4)
    150a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    150e:	002c                	addi	a1,sp,8
    1510:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1512:	00e10c23          	sb	a4,24(sp)
    1516:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151a:	00010d23          	sb	zero,26(sp)
        s += 2;
    151e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1522:	085000ef          	jal	ra,1da6 <write>
        s += 2;
    1526:	b5bd                	j	1394 <printf+0xa2>
    char byte = c;
    1528:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    152c:	4605                	li	a2,1
    152e:	002c                	addi	a1,sp,8
    1530:	4505                	li	a0,1
    char byte = c;
    1532:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1536:	071000ef          	jal	ra,1da6 <write>
    char byte = c;
    153a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    153e:	4605                	li	a2,1
    1540:	002c                	addi	a1,sp,8
    1542:	4505                	li	a0,1
    char byte = c;
    1544:	00f10423          	sb	a5,8(sp)
        s += 2;
    1548:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    154c:	05b000ef          	jal	ra,1da6 <write>
        s += 2;
    1550:	b591                	j	1394 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1552:	6782                	ld	a5,0(sp)
    1554:	6380                	ld	s0,0(a5)
    1556:	07a1                	addi	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	cc05                	beqz	s0,1592 <printf+0x2a0>
            l = strnlen(a, 200);
    155c:	0c800593          	li	a1,200
    1560:	8522                	mv	a0,s0
    1562:	45a000ef          	jal	ra,19bc <strnlen>
    write(f, s, l);
    1566:	0005061b          	sext.w	a2,a0
    156a:	85a2                	mv	a1,s0
    156c:	4505                	li	a0,1
    156e:	039000ef          	jal	ra,1da6 <write>
        s += 2;
    1572:	00248993          	addi	s3,s1,2
    1576:	bd39                	j	1394 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1578:	0019c783          	lbu	a5,1(s3)
    157c:	84ce                	mv	s1,s3
    157e:	864e                	mv	a2,s3
    1580:	e52782e3          	beq	a5,s2,13c4 <printf+0xd2>
    write(f, s, l);
    1584:	4601                	li	a2,0
    1586:	85ce                	mv	a1,s3
    1588:	4505                	li	a0,1
    158a:	01d000ef          	jal	ra,1da6 <write>
    158e:	84ce                	mv	s1,s3
    1590:	bbd1                	j	1364 <printf+0x72>
                a = "(null)";
    1592:	845e                	mv	s0,s7
    1594:	b7e1                	j	155c <printf+0x26a>

0000000000001596 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1596:	1141                	addi	sp,sp,-16
    1598:	e406                	sd	ra,8(sp)
    puts(m);
    159a:	d37ff0ef          	jal	ra,12d0 <puts>
    exit(-100);
}
    159e:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a0:	f9c00513          	li	a0,-100
}
    15a4:	0141                	addi	sp,sp,16
    exit(-100);
    15a6:	0530006f          	j	1df8 <exit>

00000000000015aa <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15aa:	02000793          	li	a5,32
    15ae:	00f50663          	beq	a0,a5,15ba <isspace+0x10>
    15b2:	355d                	addiw	a0,a0,-9
    15b4:	00553513          	sltiu	a0,a0,5
    15b8:	8082                	ret
    15ba:	4505                	li	a0,1
}
    15bc:	8082                	ret

00000000000015be <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15be:	fd05051b          	addiw	a0,a0,-48
}
    15c2:	00a53513          	sltiu	a0,a0,10
    15c6:	8082                	ret

00000000000015c8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c8:	02000613          	li	a2,32
    15cc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ce:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	0007079b          	sext.w	a5,a4
    15d6:	ff77869b          	addiw	a3,a5,-9
    15da:	04c70b63          	beq	a4,a2,1630 <atoi+0x68>
    15de:	04d5f963          	bleu	a3,a1,1630 <atoi+0x68>
        s++;
    switch (*s)
    15e2:	02b00693          	li	a3,43
    15e6:	04d70a63          	beq	a4,a3,163a <atoi+0x72>
    15ea:	02d00693          	li	a3,45
    15ee:	06d70463          	beq	a4,a3,1656 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f2:	fd07859b          	addiw	a1,a5,-48
    15f6:	4625                	li	a2,9
    15f8:	873e                	mv	a4,a5
    15fa:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15fc:	4e01                	li	t3,0
    while (isdigit(*s))
    15fe:	04b66a63          	bltu	a2,a1,1652 <atoi+0x8a>
    int n = 0, neg = 0;
    1602:	4501                	li	a0,0
    while (isdigit(*s))
    1604:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1606:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1608:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    160c:	0025179b          	slliw	a5,a0,0x2
    1610:	9d3d                	addw	a0,a0,a5
    1612:	fd07031b          	addiw	t1,a4,-48
    1616:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    161a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    161e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1622:	0006071b          	sext.w	a4,a2
    1626:	feb870e3          	bleu	a1,a6,1606 <atoi+0x3e>
    return neg ? n : -n;
    162a:	000e0563          	beqz	t3,1634 <atoi+0x6c>
}
    162e:	8082                	ret
        s++;
    1630:	0505                	addi	a0,a0,1
    1632:	bf71                	j	15ce <atoi+0x6>
    1634:	4113053b          	subw	a0,t1,a7
    1638:	8082                	ret
    while (isdigit(*s))
    163a:	00154783          	lbu	a5,1(a0)
    163e:	4625                	li	a2,9
        s++;
    1640:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1644:	fd07859b          	addiw	a1,a5,-48
    1648:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    164c:	4e01                	li	t3,0
    while (isdigit(*s))
    164e:	fab67ae3          	bleu	a1,a2,1602 <atoi+0x3a>
    1652:	4501                	li	a0,0
}
    1654:	8082                	ret
    while (isdigit(*s))
    1656:	00154783          	lbu	a5,1(a0)
    165a:	4625                	li	a2,9
        s++;
    165c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1660:	fd07859b          	addiw	a1,a5,-48
    1664:	0007871b          	sext.w	a4,a5
    1668:	feb665e3          	bltu	a2,a1,1652 <atoi+0x8a>
        neg = 1;
    166c:	4e05                	li	t3,1
    166e:	bf51                	j	1602 <atoi+0x3a>

0000000000001670 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1670:	16060d63          	beqz	a2,17ea <memset+0x17a>
    1674:	40a007b3          	neg	a5,a0
    1678:	8b9d                	andi	a5,a5,7
    167a:	00778713          	addi	a4,a5,7
    167e:	482d                	li	a6,11
    1680:	0ff5f593          	andi	a1,a1,255
    1684:	fff60693          	addi	a3,a2,-1
    1688:	17076263          	bltu	a4,a6,17ec <memset+0x17c>
    168c:	16e6ea63          	bltu	a3,a4,1800 <memset+0x190>
    1690:	16078563          	beqz	a5,17fa <memset+0x18a>
    1694:	00b50023          	sb	a1,0(a0)
    1698:	4705                	li	a4,1
    169a:	00150e93          	addi	t4,a0,1
    169e:	14e78c63          	beq	a5,a4,17f6 <memset+0x186>
    16a2:	00b500a3          	sb	a1,1(a0)
    16a6:	4709                	li	a4,2
    16a8:	00250e93          	addi	t4,a0,2
    16ac:	14e78d63          	beq	a5,a4,1806 <memset+0x196>
    16b0:	00b50123          	sb	a1,2(a0)
    16b4:	470d                	li	a4,3
    16b6:	00350e93          	addi	t4,a0,3
    16ba:	12e78b63          	beq	a5,a4,17f0 <memset+0x180>
    16be:	00b501a3          	sb	a1,3(a0)
    16c2:	4711                	li	a4,4
    16c4:	00450e93          	addi	t4,a0,4
    16c8:	14e78163          	beq	a5,a4,180a <memset+0x19a>
    16cc:	00b50223          	sb	a1,4(a0)
    16d0:	4715                	li	a4,5
    16d2:	00550e93          	addi	t4,a0,5
    16d6:	12e78c63          	beq	a5,a4,180e <memset+0x19e>
    16da:	00b502a3          	sb	a1,5(a0)
    16de:	471d                	li	a4,7
    16e0:	00650e93          	addi	t4,a0,6
    16e4:	12e79763          	bne	a5,a4,1812 <memset+0x1a2>
    16e8:	00750e93          	addi	t4,a0,7
    16ec:	00b50323          	sb	a1,6(a0)
    16f0:	4f1d                	li	t5,7
    16f2:	00859713          	slli	a4,a1,0x8
    16f6:	8f4d                	or	a4,a4,a1
    16f8:	01059e13          	slli	t3,a1,0x10
    16fc:	01c76e33          	or	t3,a4,t3
    1700:	01859313          	slli	t1,a1,0x18
    1704:	006e6333          	or	t1,t3,t1
    1708:	02059893          	slli	a7,a1,0x20
    170c:	011368b3          	or	a7,t1,a7
    1710:	02859813          	slli	a6,a1,0x28
    1714:	40f60333          	sub	t1,a2,a5
    1718:	0108e833          	or	a6,a7,a6
    171c:	03059693          	slli	a3,a1,0x30
    1720:	00d866b3          	or	a3,a6,a3
    1724:	03859713          	slli	a4,a1,0x38
    1728:	97aa                	add	a5,a5,a0
    172a:	ff837813          	andi	a6,t1,-8
    172e:	8f55                	or	a4,a4,a3
    1730:	00f806b3          	add	a3,a6,a5
    1734:	e398                	sd	a4,0(a5)
    1736:	07a1                	addi	a5,a5,8
    1738:	fed79ee3          	bne	a5,a3,1734 <memset+0xc4>
    173c:	ff837693          	andi	a3,t1,-8
    1740:	00de87b3          	add	a5,t4,a3
    1744:	01e6873b          	addw	a4,a3,t5
    1748:	0ad30663          	beq	t1,a3,17f4 <memset+0x184>
    174c:	00b78023          	sb	a1,0(a5)
    1750:	0017069b          	addiw	a3,a4,1
    1754:	08c6fb63          	bleu	a2,a3,17ea <memset+0x17a>
    1758:	00b780a3          	sb	a1,1(a5)
    175c:	0027069b          	addiw	a3,a4,2
    1760:	08c6f563          	bleu	a2,a3,17ea <memset+0x17a>
    1764:	00b78123          	sb	a1,2(a5)
    1768:	0037069b          	addiw	a3,a4,3
    176c:	06c6ff63          	bleu	a2,a3,17ea <memset+0x17a>
    1770:	00b781a3          	sb	a1,3(a5)
    1774:	0047069b          	addiw	a3,a4,4
    1778:	06c6f963          	bleu	a2,a3,17ea <memset+0x17a>
    177c:	00b78223          	sb	a1,4(a5)
    1780:	0057069b          	addiw	a3,a4,5
    1784:	06c6f363          	bleu	a2,a3,17ea <memset+0x17a>
    1788:	00b782a3          	sb	a1,5(a5)
    178c:	0067069b          	addiw	a3,a4,6
    1790:	04c6fd63          	bleu	a2,a3,17ea <memset+0x17a>
    1794:	00b78323          	sb	a1,6(a5)
    1798:	0077069b          	addiw	a3,a4,7
    179c:	04c6f763          	bleu	a2,a3,17ea <memset+0x17a>
    17a0:	00b783a3          	sb	a1,7(a5)
    17a4:	0087069b          	addiw	a3,a4,8
    17a8:	04c6f163          	bleu	a2,a3,17ea <memset+0x17a>
    17ac:	00b78423          	sb	a1,8(a5)
    17b0:	0097069b          	addiw	a3,a4,9
    17b4:	02c6fb63          	bleu	a2,a3,17ea <memset+0x17a>
    17b8:	00b784a3          	sb	a1,9(a5)
    17bc:	00a7069b          	addiw	a3,a4,10
    17c0:	02c6f563          	bleu	a2,a3,17ea <memset+0x17a>
    17c4:	00b78523          	sb	a1,10(a5)
    17c8:	00b7069b          	addiw	a3,a4,11
    17cc:	00c6ff63          	bleu	a2,a3,17ea <memset+0x17a>
    17d0:	00b785a3          	sb	a1,11(a5)
    17d4:	00c7069b          	addiw	a3,a4,12
    17d8:	00c6f963          	bleu	a2,a3,17ea <memset+0x17a>
    17dc:	00b78623          	sb	a1,12(a5)
    17e0:	2735                	addiw	a4,a4,13
    17e2:	00c77463          	bleu	a2,a4,17ea <memset+0x17a>
    17e6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ea:	8082                	ret
    17ec:	472d                	li	a4,11
    17ee:	bd79                	j	168c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f0:	4f0d                	li	t5,3
    17f2:	b701                	j	16f2 <memset+0x82>
    17f4:	8082                	ret
    17f6:	4f05                	li	t5,1
    17f8:	bded                	j	16f2 <memset+0x82>
    17fa:	8eaa                	mv	t4,a0
    17fc:	4f01                	li	t5,0
    17fe:	bdd5                	j	16f2 <memset+0x82>
    1800:	87aa                	mv	a5,a0
    1802:	4701                	li	a4,0
    1804:	b7a1                	j	174c <memset+0xdc>
    1806:	4f09                	li	t5,2
    1808:	b5ed                	j	16f2 <memset+0x82>
    180a:	4f11                	li	t5,4
    180c:	b5dd                	j	16f2 <memset+0x82>
    180e:	4f15                	li	t5,5
    1810:	b5cd                	j	16f2 <memset+0x82>
    1812:	4f19                	li	t5,6
    1814:	bdf9                	j	16f2 <memset+0x82>

0000000000001816 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1816:	00054703          	lbu	a4,0(a0)
    181a:	0005c783          	lbu	a5,0(a1)
    181e:	00e79b63          	bne	a5,a4,1834 <strcmp+0x1e>
    1822:	cf89                	beqz	a5,183c <strcmp+0x26>
    1824:	0505                	addi	a0,a0,1
    1826:	0585                	addi	a1,a1,1
    1828:	0005c783          	lbu	a5,0(a1)
    182c:	00054703          	lbu	a4,0(a0)
    1830:	fef709e3          	beq	a4,a5,1822 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1834:	0007051b          	sext.w	a0,a4
}
    1838:	9d1d                	subw	a0,a0,a5
    183a:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    183c:	4501                	li	a0,0
}
    183e:	9d1d                	subw	a0,a0,a5
    1840:	8082                	ret

0000000000001842 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1842:	c231                	beqz	a2,1886 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1844:	00054783          	lbu	a5,0(a0)
    1848:	0005c683          	lbu	a3,0(a1)
    184c:	c795                	beqz	a5,1878 <strncmp+0x36>
    184e:	ca85                	beqz	a3,187e <strncmp+0x3c>
    if (!n--)
    1850:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1852:	c615                	beqz	a2,187e <strncmp+0x3c>
    1854:	00150713          	addi	a4,a0,1
    1858:	9532                	add	a0,a0,a2
    185a:	00d78963          	beq	a5,a3,186c <strncmp+0x2a>
    185e:	a005                	j	187e <strncmp+0x3c>
    1860:	ce99                	beqz	a3,187e <strncmp+0x3c>
    1862:	00e50e63          	beq	a0,a4,187e <strncmp+0x3c>
    1866:	0705                	addi	a4,a4,1
    1868:	00d79b63          	bne	a5,a3,187e <strncmp+0x3c>
    186c:	00074783          	lbu	a5,0(a4)
    1870:	0585                	addi	a1,a1,1
    1872:	0005c683          	lbu	a3,0(a1)
    1876:	f7ed                	bnez	a5,1860 <strncmp+0x1e>
    1878:	4501                	li	a0,0
        ;
    return *l - *r;
    187a:	9d15                	subw	a0,a0,a3
    187c:	8082                	ret
    187e:	0007851b          	sext.w	a0,a5
    1882:	9d15                	subw	a0,a0,a3
    1884:	8082                	ret
        return 0;
    1886:	4501                	li	a0,0
}
    1888:	8082                	ret

000000000000188a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188a:	00757793          	andi	a5,a0,7
    188e:	cfa1                	beqz	a5,18e6 <strlen+0x5c>
        if (!*s)
    1890:	00054783          	lbu	a5,0(a0)
    1894:	cbb9                	beqz	a5,18ea <strlen+0x60>
    1896:	87aa                	mv	a5,a0
    1898:	a021                	j	18a0 <strlen+0x16>
    189a:	0007c703          	lbu	a4,0(a5)
    189e:	c329                	beqz	a4,18e0 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18a0:	0785                	addi	a5,a5,1
    18a2:	0077f713          	andi	a4,a5,7
    18a6:	fb75                	bnez	a4,189a <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a8:	00001717          	auipc	a4,0x1
    18ac:	81870713          	addi	a4,a4,-2024 # 20c0 <__clone+0xe0>
    18b0:	630c                	ld	a1,0(a4)
    18b2:	00001717          	auipc	a4,0x1
    18b6:	81670713          	addi	a4,a4,-2026 # 20c8 <__clone+0xe8>
    18ba:	6394                	ld	a3,0(a5)
    18bc:	6310                	ld	a2,0(a4)
    18be:	a019                	j	18c4 <strlen+0x3a>
    18c0:	07a1                	addi	a5,a5,8
    18c2:	6394                	ld	a3,0(a5)
    18c4:	00b68733          	add	a4,a3,a1
    18c8:	fff6c693          	not	a3,a3
    18cc:	8f75                	and	a4,a4,a3
    18ce:	8f71                	and	a4,a4,a2
    18d0:	db65                	beqz	a4,18c0 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18d2:	0007c703          	lbu	a4,0(a5)
    18d6:	c709                	beqz	a4,18e0 <strlen+0x56>
    18d8:	0785                	addi	a5,a5,1
    18da:	0007c703          	lbu	a4,0(a5)
    18de:	ff6d                	bnez	a4,18d8 <strlen+0x4e>
        ;
    return s - a;
    18e0:	40a78533          	sub	a0,a5,a0
}
    18e4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e6:	87aa                	mv	a5,a0
    18e8:	b7c1                	j	18a8 <strlen+0x1e>
        if (!*s)
    18ea:	4501                	li	a0,0
            return s - a;
    18ec:	8082                	ret

00000000000018ee <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ee:	00757793          	andi	a5,a0,7
    18f2:	0ff5f593          	andi	a1,a1,255
    18f6:	cb99                	beqz	a5,190c <memchr+0x1e>
    18f8:	c655                	beqz	a2,19a4 <memchr+0xb6>
    18fa:	00054783          	lbu	a5,0(a0)
    18fe:	0ab78663          	beq	a5,a1,19aa <memchr+0xbc>
    1902:	0505                	addi	a0,a0,1
    1904:	00757793          	andi	a5,a0,7
    1908:	167d                	addi	a2,a2,-1
    190a:	f7fd                	bnez	a5,18f8 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190c:	4701                	li	a4,0
    if (n && *s != c)
    190e:	ca49                	beqz	a2,19a0 <memchr+0xb2>
    1910:	00054783          	lbu	a5,0(a0)
    1914:	08b78b63          	beq	a5,a1,19aa <memchr+0xbc>
        size_t k = ONES * c;
    1918:	00000797          	auipc	a5,0x0
    191c:	7b878793          	addi	a5,a5,1976 # 20d0 <__clone+0xf0>
    1920:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1922:	479d                	li	a5,7
        size_t k = ONES * c;
    1924:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1928:	08c7f863          	bleu	a2,a5,19b8 <memchr+0xca>
    192c:	611c                	ld	a5,0(a0)
    192e:	00000317          	auipc	t1,0x0
    1932:	79a30313          	addi	t1,t1,1946 # 20c8 <__clone+0xe8>
    1936:	00033803          	ld	a6,0(t1)
    193a:	00f8c7b3          	xor	a5,a7,a5
    193e:	fff7c713          	not	a4,a5
    1942:	8f95                	sub	a5,a5,a3
    1944:	8ff9                	and	a5,a5,a4
    1946:	0107f7b3          	and	a5,a5,a6
    194a:	e7bd                	bnez	a5,19b8 <memchr+0xca>
    194c:	4e1d                	li	t3,7
    194e:	00000e97          	auipc	t4,0x0
    1952:	772e8e93          	addi	t4,t4,1906 # 20c0 <__clone+0xe0>
    1956:	a005                	j	1976 <memchr+0x88>
    1958:	6514                	ld	a3,8(a0)
    195a:	000eb783          	ld	a5,0(t4)
    195e:	00033803          	ld	a6,0(t1)
    1962:	00d8c6b3          	xor	a3,a7,a3
    1966:	97b6                	add	a5,a5,a3
    1968:	fff6c693          	not	a3,a3
    196c:	8ff5                	and	a5,a5,a3
    196e:	0107f7b3          	and	a5,a5,a6
    1972:	e3a1                	bnez	a5,19b2 <memchr+0xc4>
    1974:	853a                	mv	a0,a4
    1976:	1661                	addi	a2,a2,-8
    1978:	00850713          	addi	a4,a0,8
    197c:	fcce6ee3          	bltu	t3,a2,1958 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1980:	c215                	beqz	a2,19a4 <memchr+0xb6>
    1982:	00074783          	lbu	a5,0(a4)
    1986:	00f58d63          	beq	a1,a5,19a0 <memchr+0xb2>
    198a:	00170793          	addi	a5,a4,1
    198e:	963a                	add	a2,a2,a4
    1990:	873e                	mv	a4,a5
    1992:	00f60963          	beq	a2,a5,19a4 <memchr+0xb6>
    1996:	0007c683          	lbu	a3,0(a5)
    199a:	0785                	addi	a5,a5,1
    199c:	feb69ae3          	bne	a3,a1,1990 <memchr+0xa2>
}
    19a0:	853a                	mv	a0,a4
    19a2:	8082                	ret
    return n ? (void *)s : 0;
    19a4:	4701                	li	a4,0
}
    19a6:	853a                	mv	a0,a4
    19a8:	8082                	ret
    19aa:	872a                	mv	a4,a0
    19ac:	00074783          	lbu	a5,0(a4)
    19b0:	bfd9                	j	1986 <memchr+0x98>
    19b2:	00854783          	lbu	a5,8(a0)
    19b6:	bfc1                	j	1986 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19b8:	872a                	mv	a4,a0
    19ba:	bfc1                	j	198a <memchr+0x9c>

00000000000019bc <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19bc:	00757793          	andi	a5,a0,7
    19c0:	cfc5                	beqz	a5,1a78 <strnlen+0xbc>
    19c2:	c1c5                	beqz	a1,1a62 <strnlen+0xa6>
    19c4:	00054783          	lbu	a5,0(a0)
    19c8:	cfd9                	beqz	a5,1a66 <strnlen+0xaa>
    19ca:	87ae                	mv	a5,a1
    19cc:	86aa                	mv	a3,a0
    19ce:	a029                	j	19d8 <strnlen+0x1c>
    19d0:	cbc9                	beqz	a5,1a62 <strnlen+0xa6>
    19d2:	0006c703          	lbu	a4,0(a3)
    19d6:	cb51                	beqz	a4,1a6a <strnlen+0xae>
    19d8:	0685                	addi	a3,a3,1
    19da:	0076f713          	andi	a4,a3,7
    19de:	17fd                	addi	a5,a5,-1
    19e0:	fb65                	bnez	a4,19d0 <strnlen+0x14>
    if (n && *s != c)
    19e2:	c3c1                	beqz	a5,1a62 <strnlen+0xa6>
    19e4:	0006c703          	lbu	a4,0(a3)
    19e8:	c349                	beqz	a4,1a6a <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ea:	471d                	li	a4,7
    19ec:	08f77a63          	bleu	a5,a4,1a80 <strnlen+0xc4>
    19f0:	00000e17          	auipc	t3,0x0
    19f4:	6d0e0e13          	addi	t3,t3,1744 # 20c0 <__clone+0xe0>
    19f8:	6290                	ld	a2,0(a3)
    19fa:	000e3703          	ld	a4,0(t3)
    19fe:	00000e97          	auipc	t4,0x0
    1a02:	6cae8e93          	addi	t4,t4,1738 # 20c8 <__clone+0xe8>
    1a06:	000eb803          	ld	a6,0(t4)
    1a0a:	9732                	add	a4,a4,a2
    1a0c:	fff64613          	not	a2,a2
    1a10:	8f71                	and	a4,a4,a2
    1a12:	01077733          	and	a4,a4,a6
    1a16:	e72d                	bnez	a4,1a80 <strnlen+0xc4>
    1a18:	4f1d                	li	t5,7
    1a1a:	a839                	j	1a38 <strnlen+0x7c>
    1a1c:	6698                	ld	a4,8(a3)
    1a1e:	000e3303          	ld	t1,0(t3)
    1a22:	000eb803          	ld	a6,0(t4)
    1a26:	fff74893          	not	a7,a4
    1a2a:	971a                	add	a4,a4,t1
    1a2c:	01177733          	and	a4,a4,a7
    1a30:	01077733          	and	a4,a4,a6
    1a34:	ef1d                	bnez	a4,1a72 <strnlen+0xb6>
    1a36:	86b2                	mv	a3,a2
    1a38:	17e1                	addi	a5,a5,-8
    1a3a:	00868613          	addi	a2,a3,8
    1a3e:	fcff6fe3          	bltu	t5,a5,1a1c <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a42:	c385                	beqz	a5,1a62 <strnlen+0xa6>
    1a44:	00064703          	lbu	a4,0(a2)
    1a48:	cb19                	beqz	a4,1a5e <strnlen+0xa2>
    1a4a:	00160713          	addi	a4,a2,1
    1a4e:	97b2                	add	a5,a5,a2
    1a50:	863a                	mv	a2,a4
    1a52:	00e78863          	beq	a5,a4,1a62 <strnlen+0xa6>
    1a56:	0705                	addi	a4,a4,1
    1a58:	fff74683          	lbu	a3,-1(a4)
    1a5c:	faf5                	bnez	a3,1a50 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a5e:	40a605b3          	sub	a1,a2,a0
}
    1a62:	852e                	mv	a0,a1
    1a64:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a66:	87ae                	mv	a5,a1
    1a68:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a6a:	8636                	mv	a2,a3
    1a6c:	00064703          	lbu	a4,0(a2)
    1a70:	bfe1                	j	1a48 <strnlen+0x8c>
    1a72:	0086c703          	lbu	a4,8(a3)
    1a76:	bfc9                	j	1a48 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a78:	87ae                	mv	a5,a1
    1a7a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a7c:	f7a5                	bnez	a5,19e4 <strnlen+0x28>
    1a7e:	b7d5                	j	1a62 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a80:	8636                	mv	a2,a3
    1a82:	b7e1                	j	1a4a <strnlen+0x8e>

0000000000001a84 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a84:	00b547b3          	xor	a5,a0,a1
    1a88:	8b9d                	andi	a5,a5,7
    1a8a:	efa9                	bnez	a5,1ae4 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a8c:	0075f793          	andi	a5,a1,7
    1a90:	c38d                	beqz	a5,1ab2 <strcpy+0x2e>
            if (!(*d = *s))
    1a92:	0005c783          	lbu	a5,0(a1)
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	e799                	bnez	a5,1aa8 <strcpy+0x24>
    1a9c:	a095                	j	1b00 <strcpy+0x7c>
    1a9e:	0005c783          	lbu	a5,0(a1)
    1aa2:	00f50023          	sb	a5,0(a0)
    1aa6:	cbb9                	beqz	a5,1afc <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aa8:	0585                	addi	a1,a1,1
    1aaa:	0075f793          	andi	a5,a1,7
    1aae:	0505                	addi	a0,a0,1
    1ab0:	f7fd                	bnez	a5,1a9e <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ab2:	00000797          	auipc	a5,0x0
    1ab6:	60e78793          	addi	a5,a5,1550 # 20c0 <__clone+0xe0>
    1aba:	0007b803          	ld	a6,0(a5)
    1abe:	00000797          	auipc	a5,0x0
    1ac2:	60a78793          	addi	a5,a5,1546 # 20c8 <__clone+0xe8>
    1ac6:	6198                	ld	a4,0(a1)
    1ac8:	6390                	ld	a2,0(a5)
    1aca:	a031                	j	1ad6 <strcpy+0x52>
    1acc:	0521                	addi	a0,a0,8
    1ace:	05a1                	addi	a1,a1,8
    1ad0:	fee53c23          	sd	a4,-8(a0)
    1ad4:	6198                	ld	a4,0(a1)
    1ad6:	010707b3          	add	a5,a4,a6
    1ada:	fff74693          	not	a3,a4
    1ade:	8ff5                	and	a5,a5,a3
    1ae0:	8ff1                	and	a5,a5,a2
    1ae2:	d7ed                	beqz	a5,1acc <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	cb89                	beqz	a5,1afe <strcpy+0x7a>
    1aee:	0585                	addi	a1,a1,1
    1af0:	0005c783          	lbu	a5,0(a1)
    1af4:	0505                	addi	a0,a0,1
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	fbf5                	bnez	a5,1aee <strcpy+0x6a>
        ;
    return d;
}
    1afc:	8082                	ret
    1afe:	8082                	ret
    1b00:	8082                	ret

0000000000001b02 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b02:	00b547b3          	xor	a5,a0,a1
    1b06:	8b9d                	andi	a5,a5,7
    1b08:	ebc1                	bnez	a5,1b98 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b0a:	0075f793          	andi	a5,a1,7
    1b0e:	cf91                	beqz	a5,1b2a <strncpy+0x28>
    1b10:	20060e63          	beqz	a2,1d2c <strncpy+0x22a>
    1b14:	0005c783          	lbu	a5,0(a1)
    1b18:	00f50023          	sb	a5,0(a0)
    1b1c:	c3d5                	beqz	a5,1bc0 <strncpy+0xbe>
    1b1e:	0585                	addi	a1,a1,1
    1b20:	0075f793          	andi	a5,a1,7
    1b24:	167d                	addi	a2,a2,-1
    1b26:	0505                	addi	a0,a0,1
    1b28:	f7e5                	bnez	a5,1b10 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b2a:	20060163          	beqz	a2,1d2c <strncpy+0x22a>
    1b2e:	0005c683          	lbu	a3,0(a1)
    1b32:	c6d9                	beqz	a3,1bc0 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b34:	479d                	li	a5,7
    1b36:	22c7f563          	bleu	a2,a5,1d60 <strncpy+0x25e>
    1b3a:	00000317          	auipc	t1,0x0
    1b3e:	58630313          	addi	t1,t1,1414 # 20c0 <__clone+0xe0>
    1b42:	6198                	ld	a4,0(a1)
    1b44:	00033783          	ld	a5,0(t1)
    1b48:	00000e17          	auipc	t3,0x0
    1b4c:	580e0e13          	addi	t3,t3,1408 # 20c8 <__clone+0xe8>
    1b50:	000e3803          	ld	a6,0(t3)
    1b54:	97ba                	add	a5,a5,a4
    1b56:	fff74893          	not	a7,a4
    1b5a:	0117f7b3          	and	a5,a5,a7
    1b5e:	0107f7b3          	and	a5,a5,a6
    1b62:	1e079f63          	bnez	a5,1d60 <strncpy+0x25e>
    1b66:	4e9d                	li	t4,7
    1b68:	a005                	j	1b88 <strncpy+0x86>
    1b6a:	6598                	ld	a4,8(a1)
    1b6c:	00033783          	ld	a5,0(t1)
    1b70:	000e3803          	ld	a6,0(t3)
    1b74:	fff74893          	not	a7,a4
    1b78:	97ba                	add	a5,a5,a4
    1b7a:	0117f7b3          	and	a5,a5,a7
    1b7e:	0107f7b3          	and	a5,a5,a6
    1b82:	1a079f63          	bnez	a5,1d40 <strncpy+0x23e>
    1b86:	85b6                	mv	a1,a3
            *wd = *ws;
    1b88:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b8a:	1661                	addi	a2,a2,-8
    1b8c:	00858693          	addi	a3,a1,8
    1b90:	0521                	addi	a0,a0,8
    1b92:	fcceece3          	bltu	t4,a2,1b6a <strncpy+0x68>
    1b96:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b98:	18060a63          	beqz	a2,1d2c <strncpy+0x22a>
    1b9c:	0005c783          	lbu	a5,0(a1)
    1ba0:	872a                	mv	a4,a0
    1ba2:	00f50023          	sb	a5,0(a0)
    1ba6:	e799                	bnez	a5,1bb4 <strncpy+0xb2>
    1ba8:	a829                	j	1bc2 <strncpy+0xc0>
    1baa:	0005c783          	lbu	a5,0(a1)
    1bae:	00f70023          	sb	a5,0(a4)
    1bb2:	cb81                	beqz	a5,1bc2 <strncpy+0xc0>
    1bb4:	167d                	addi	a2,a2,-1
    1bb6:	0585                	addi	a1,a1,1
    1bb8:	0705                	addi	a4,a4,1
    1bba:	fa65                	bnez	a2,1baa <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bbc:	853a                	mv	a0,a4
    1bbe:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bc0:	872a                	mv	a4,a0
    1bc2:	4805                	li	a6,1
    1bc4:	14061c63          	bnez	a2,1d1c <strncpy+0x21a>
    1bc8:	40e007b3          	neg	a5,a4
    1bcc:	8b9d                	andi	a5,a5,7
    1bce:	4581                	li	a1,0
    1bd0:	12061e63          	bnez	a2,1d0c <strncpy+0x20a>
    1bd4:	00778693          	addi	a3,a5,7
    1bd8:	452d                	li	a0,11
    1bda:	12a6e763          	bltu	a3,a0,1d08 <strncpy+0x206>
    1bde:	16d5e663          	bltu	a1,a3,1d4a <strncpy+0x248>
    1be2:	14078c63          	beqz	a5,1d3a <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be6:	00070023          	sb	zero,0(a4)
    1bea:	4585                	li	a1,1
    1bec:	00170693          	addi	a3,a4,1
    1bf0:	14b78363          	beq	a5,a1,1d36 <strncpy+0x234>
    1bf4:	000700a3          	sb	zero,1(a4)
    1bf8:	4589                	li	a1,2
    1bfa:	00270693          	addi	a3,a4,2
    1bfe:	14b78963          	beq	a5,a1,1d50 <strncpy+0x24e>
    1c02:	00070123          	sb	zero,2(a4)
    1c06:	458d                	li	a1,3
    1c08:	00370693          	addi	a3,a4,3
    1c0c:	12b78363          	beq	a5,a1,1d32 <strncpy+0x230>
    1c10:	000701a3          	sb	zero,3(a4)
    1c14:	4591                	li	a1,4
    1c16:	00470693          	addi	a3,a4,4
    1c1a:	12b78d63          	beq	a5,a1,1d54 <strncpy+0x252>
    1c1e:	00070223          	sb	zero,4(a4)
    1c22:	4595                	li	a1,5
    1c24:	00570693          	addi	a3,a4,5
    1c28:	12b78863          	beq	a5,a1,1d58 <strncpy+0x256>
    1c2c:	000702a3          	sb	zero,5(a4)
    1c30:	459d                	li	a1,7
    1c32:	00670693          	addi	a3,a4,6
    1c36:	12b79363          	bne	a5,a1,1d5c <strncpy+0x25a>
    1c3a:	00770693          	addi	a3,a4,7
    1c3e:	00070323          	sb	zero,6(a4)
    1c42:	40f80833          	sub	a6,a6,a5
    1c46:	ff887513          	andi	a0,a6,-8
    1c4a:	97ba                	add	a5,a5,a4
    1c4c:	953e                	add	a0,a0,a5
    1c4e:	0007b023          	sd	zero,0(a5)
    1c52:	07a1                	addi	a5,a5,8
    1c54:	fea79de3          	bne	a5,a0,1c4e <strncpy+0x14c>
    1c58:	ff887513          	andi	a0,a6,-8
    1c5c:	9da9                	addw	a1,a1,a0
    1c5e:	00a687b3          	add	a5,a3,a0
    1c62:	f4a80de3          	beq	a6,a0,1bbc <strncpy+0xba>
    1c66:	00078023          	sb	zero,0(a5)
    1c6a:	0015869b          	addiw	a3,a1,1
    1c6e:	f4c6f7e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1c72:	000780a3          	sb	zero,1(a5)
    1c76:	0025869b          	addiw	a3,a1,2
    1c7a:	f4c6f1e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1c7e:	00078123          	sb	zero,2(a5)
    1c82:	0035869b          	addiw	a3,a1,3
    1c86:	f2c6fbe3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1c8a:	000781a3          	sb	zero,3(a5)
    1c8e:	0045869b          	addiw	a3,a1,4
    1c92:	f2c6f5e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1c96:	00078223          	sb	zero,4(a5)
    1c9a:	0055869b          	addiw	a3,a1,5
    1c9e:	f0c6ffe3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1ca2:	000782a3          	sb	zero,5(a5)
    1ca6:	0065869b          	addiw	a3,a1,6
    1caa:	f0c6f9e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cae:	00078323          	sb	zero,6(a5)
    1cb2:	0075869b          	addiw	a3,a1,7
    1cb6:	f0c6f3e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cba:	000783a3          	sb	zero,7(a5)
    1cbe:	0085869b          	addiw	a3,a1,8
    1cc2:	eec6fde3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cc6:	00078423          	sb	zero,8(a5)
    1cca:	0095869b          	addiw	a3,a1,9
    1cce:	eec6f7e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cd2:	000784a3          	sb	zero,9(a5)
    1cd6:	00a5869b          	addiw	a3,a1,10
    1cda:	eec6f1e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cde:	00078523          	sb	zero,10(a5)
    1ce2:	00b5869b          	addiw	a3,a1,11
    1ce6:	ecc6fbe3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cea:	000785a3          	sb	zero,11(a5)
    1cee:	00c5869b          	addiw	a3,a1,12
    1cf2:	ecc6f5e3          	bleu	a2,a3,1bbc <strncpy+0xba>
    1cf6:	00078623          	sb	zero,12(a5)
    1cfa:	25b5                	addiw	a1,a1,13
    1cfc:	ecc5f0e3          	bleu	a2,a1,1bbc <strncpy+0xba>
    1d00:	000786a3          	sb	zero,13(a5)
}
    1d04:	853a                	mv	a0,a4
    1d06:	8082                	ret
    1d08:	46ad                	li	a3,11
    1d0a:	bdd1                	j	1bde <strncpy+0xdc>
    1d0c:	00778693          	addi	a3,a5,7
    1d10:	452d                	li	a0,11
    1d12:	fff60593          	addi	a1,a2,-1
    1d16:	eca6f4e3          	bleu	a0,a3,1bde <strncpy+0xdc>
    1d1a:	b7fd                	j	1d08 <strncpy+0x206>
    1d1c:	40e007b3          	neg	a5,a4
    1d20:	8832                	mv	a6,a2
    1d22:	8b9d                	andi	a5,a5,7
    1d24:	4581                	li	a1,0
    1d26:	ea0607e3          	beqz	a2,1bd4 <strncpy+0xd2>
    1d2a:	b7cd                	j	1d0c <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d2c:	872a                	mv	a4,a0
}
    1d2e:	853a                	mv	a0,a4
    1d30:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d32:	458d                	li	a1,3
    1d34:	b739                	j	1c42 <strncpy+0x140>
    1d36:	4585                	li	a1,1
    1d38:	b729                	j	1c42 <strncpy+0x140>
    1d3a:	86ba                	mv	a3,a4
    1d3c:	4581                	li	a1,0
    1d3e:	b711                	j	1c42 <strncpy+0x140>
    1d40:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d44:	872a                	mv	a4,a0
    1d46:	85b6                	mv	a1,a3
    1d48:	bda9                	j	1ba2 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d4a:	87ba                	mv	a5,a4
    1d4c:	4581                	li	a1,0
    1d4e:	bf21                	j	1c66 <strncpy+0x164>
    1d50:	4589                	li	a1,2
    1d52:	bdc5                	j	1c42 <strncpy+0x140>
    1d54:	4591                	li	a1,4
    1d56:	b5f5                	j	1c42 <strncpy+0x140>
    1d58:	4595                	li	a1,5
    1d5a:	b5e5                	j	1c42 <strncpy+0x140>
    1d5c:	4599                	li	a1,6
    1d5e:	b5d5                	j	1c42 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d60:	00d50023          	sb	a3,0(a0)
    1d64:	872a                	mv	a4,a0
    1d66:	b5b9                	j	1bb4 <strncpy+0xb2>

0000000000001d68 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d68:	87aa                	mv	a5,a0
    1d6a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d6c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d70:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d74:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d76:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d78:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <openat>:
    register long a7 __asm__("a7") = n;
    1d80:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d84:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d88:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <close>:
    register long a7 __asm__("a7") = n;
    1d90:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d94:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <read>:
    register long a7 __asm__("a7") = n;
    1d9c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1da4:	8082                	ret

0000000000001da6 <write>:
    register long a7 __asm__("a7") = n;
    1da6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1daa:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dae:	8082                	ret

0000000000001db0 <getpid>:
    register long a7 __asm__("a7") = n;
    1db0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1db4:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <getppid>:
    register long a7 __asm__("a7") = n;
    1dbc:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dc0:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dc8:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dcc:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <fork>:
    register long a7 __asm__("a7") = n;
    1dd4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dd8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dda:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1de4:	85b2                	mv	a1,a2
    1de6:	863a                	mv	a2,a4
    if (stack)
    1de8:	c191                	beqz	a1,1dec <clone+0x8>
	stack += stack_size;
    1dea:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dec:	4781                	li	a5,0
    1dee:	4701                	li	a4,0
    1df0:	4681                	li	a3,0
    1df2:	2601                	sext.w	a2,a2
    1df4:	1ec0006f          	j	1fe0 <__clone>

0000000000001df8 <exit>:
    register long a7 __asm__("a7") = n;
    1df8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e00:	8082                	ret

0000000000001e02 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e02:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e06:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e08:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <exec>:
    register long a7 __asm__("a7") = n;
    1e10:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e14:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <execve>:
    register long a7 __asm__("a7") = n;
    1e1c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <times>:
    register long a7 __asm__("a7") = n;
    1e28:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <get_time>:

int64 get_time()
{
    1e34:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e36:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e3a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e42:	2501                	sext.w	a0,a0
    1e44:	ed09                	bnez	a0,1e5e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e46:	67a2                	ld	a5,8(sp)
    1e48:	3e800713          	li	a4,1000
    1e4c:	00015503          	lhu	a0,0(sp)
    1e50:	02e7d7b3          	divu	a5,a5,a4
    1e54:	02e50533          	mul	a0,a0,a4
    1e58:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e5a:	0141                	addi	sp,sp,16
    1e5c:	8082                	ret
        return -1;
    1e5e:	557d                	li	a0,-1
    1e60:	bfed                	j	1e5a <get_time+0x26>

0000000000001e62 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e62:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e66:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <time>:
    register long a7 __asm__("a7") = n;
    1e6e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <sleep>:

int sleep(unsigned long long time)
{
    1e7a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e7c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e7e:	850a                	mv	a0,sp
    1e80:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e82:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e86:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e88:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e8c:	e501                	bnez	a0,1e94 <sleep+0x1a>
    return 0;
    1e8e:	4501                	li	a0,0
}
    1e90:	0141                	addi	sp,sp,16
    1e92:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e94:	4502                	lw	a0,0(sp)
}
    1e96:	0141                	addi	sp,sp,16
    1e98:	8082                	ret

0000000000001e9a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e9a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e9e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ea6:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1eaa:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eae:	8082                	ret

0000000000001eb0 <munmap>:
    register long a7 __asm__("a7") = n;
    1eb0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <wait>:

int wait(int *code)
{
    1ebc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ebe:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ec2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ec4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ec6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ec8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <spawn>:
    register long a7 __asm__("a7") = n;
    1ed0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ed4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <mailread>:
    register long a7 __asm__("a7") = n;
    1edc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ee8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eec:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <fstat>:
    register long a7 __asm__("a7") = n;
    1ef4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f00:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f02:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f06:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f08:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f10:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f12:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f16:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f18:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <link>:

int link(char *old_path, char *new_path)
{
    1f20:	87aa                	mv	a5,a0
    1f22:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f24:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f2e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f32:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f34:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <unlink>:

int unlink(char *path)
{
    1f3c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f3e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f42:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f46:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f48:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <uname>:
    register long a7 __asm__("a7") = n;
    1f50:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f54:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <brk>:
    register long a7 __asm__("a7") = n;
    1f5c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f60:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f68:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f6e:	8082                	ret

0000000000001f70 <chdir>:
    register long a7 __asm__("a7") = n;
    1f70:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f74:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f7c:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f7e:	02059613          	slli	a2,a1,0x20
    1f82:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f84:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f8c:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8e:	00000073          	ecall
}
    1f92:	2501                	sext.w	a0,a0
    1f94:	8082                	ret

0000000000001f96 <getdents>:
    register long a7 __asm__("a7") = n;
    1f96:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <pipe>:
    register long a7 __asm__("a7") = n;
    1fa2:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fa6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa8:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <dup>:
    register long a7 __asm__("a7") = n;
    1fb0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fb2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <dup2>:
    register long a7 __asm__("a7") = n;
    1fba:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fbc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fbe:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fc2:	2501                	sext.w	a0,a0
    1fc4:	8082                	ret

0000000000001fc6 <mount>:
    register long a7 __asm__("a7") = n;
    1fc6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fca:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fce:	2501                	sext.w	a0,a0
    1fd0:	8082                	ret

0000000000001fd2 <umount>:
    register long a7 __asm__("a7") = n;
    1fd2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fd6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fd8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fdc:	2501                	sext.w	a0,a0
    1fde:	8082                	ret

0000000000001fe0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fe0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fe2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fe4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fe6:	8532                	mv	a0,a2
	mv a2, a4
    1fe8:	863a                	mv	a2,a4
	mv a3, a5
    1fea:	86be                	mv	a3,a5
	mv a4, a6
    1fec:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fee:	0dc00893          	li	a7,220
	ecall
    1ff2:	00000073          	ecall

	beqz a0, 1f
    1ff6:	c111                	beqz	a0,1ffa <__clone+0x1a>
	# Parent
	ret
    1ff8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ffa:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ffc:	6522                	ld	a0,8(sp)
	jalr a1
    1ffe:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2000:	05d00893          	li	a7,93
	ecall
    2004:	00000073          	ecall
