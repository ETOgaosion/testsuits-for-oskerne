
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	1200006f          	j	1122 <__start_main>

0000000000001006 <test_mount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_mount() {
    1006:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	05850513          	addi	a0,a0,88 # 2060 <__clone+0x2e>
void test_mount() {
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1014:	30e000ef          	jal	ra,1322 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	1a850513          	addi	a0,a0,424 # 21c0 <__func__.1214>
    1020:	302000ef          	jal	ra,1322 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	05450513          	addi	a0,a0,84 # 2078 <__clone+0x46>
    102c:	2f6000ef          	jal	ra,1322 <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    1030:	00001617          	auipc	a2,0x1
    1034:	11060613          	addi	a2,a2,272 # 2140 <mntpoint>
    1038:	00001597          	auipc	a1,0x1
    103c:	14858593          	addi	a1,a1,328 # 2180 <device>
    1040:	00001517          	auipc	a0,0x1
    1044:	04850513          	addi	a0,a0,72 # 2088 <__clone+0x56>
    1048:	2fc000ef          	jal	ra,1344 <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104c:	00001597          	auipc	a1,0x1
    1050:	0f458593          	addi	a1,a1,244 # 2140 <mntpoint>
    1054:	4701                	li	a4,0
    1056:	4681                	li	a3,0
    1058:	00001617          	auipc	a2,0x1
    105c:	04860613          	addi	a2,a2,72 # 20a0 <__clone+0x6e>
    1060:	00001517          	auipc	a0,0x1
    1064:	12050513          	addi	a0,a0,288 # 2180 <device>
    1068:	7b1000ef          	jal	ra,2018 <mount>
    106c:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106e:	85aa                	mv	a1,a0
    1070:	00001517          	auipc	a0,0x1
    1074:	03850513          	addi	a0,a0,56 # 20a8 <__clone+0x76>
    1078:	2cc000ef          	jal	ra,1344 <printf>
	assert(ret == 0);
    107c:	e829                	bnez	s0,10ce <test_mount+0xc8>

	if (ret == 0) {
		printf("mount successfully\n");
    107e:	00001517          	auipc	a0,0x1
    1082:	07250513          	addi	a0,a0,114 # 20f0 <__clone+0xbe>
    1086:	2be000ef          	jal	ra,1344 <printf>
		ret = umount(mntpoint);
    108a:	00001517          	auipc	a0,0x1
    108e:	0b650513          	addi	a0,a0,182 # 2140 <mntpoint>
    1092:	793000ef          	jal	ra,2024 <umount>
		printf("umount return: %d\n", ret);
    1096:	85aa                	mv	a1,a0
    1098:	00001517          	auipc	a0,0x1
    109c:	07050513          	addi	a0,a0,112 # 2108 <__clone+0xd6>
    10a0:	2a4000ef          	jal	ra,1344 <printf>
	}

	TEST_END(__func__);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	03c50513          	addi	a0,a0,60 # 20e0 <__clone+0xae>
    10ac:	276000ef          	jal	ra,1322 <puts>
    10b0:	00001517          	auipc	a0,0x1
    10b4:	11050513          	addi	a0,a0,272 # 21c0 <__func__.1214>
    10b8:	26a000ef          	jal	ra,1322 <puts>
}
    10bc:	6402                	ld	s0,0(sp)
    10be:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    10c0:	00001517          	auipc	a0,0x1
    10c4:	fb850513          	addi	a0,a0,-72 # 2078 <__clone+0x46>
}
    10c8:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    10ca:	2580006f          	j	1322 <puts>
	assert(ret == 0);
    10ce:	00001517          	auipc	a0,0x1
    10d2:	ff250513          	addi	a0,a0,-14 # 20c0 <__clone+0x8e>
    10d6:	512000ef          	jal	ra,15e8 <panic>
	if (ret == 0) {
    10da:	b7e9                	j	10a4 <test_mount+0x9e>

00000000000010dc <main>:

int main(int argc,char *argv[]) {
    10dc:	1101                	addi	sp,sp,-32
    10de:	ec06                	sd	ra,24(sp)
    10e0:	e822                	sd	s0,16(sp)
    10e2:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    10e4:	4785                	li	a5,1
    10e6:	00a7ca63          	blt	a5,a0,10fa <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_mount();
    10ea:	f1dff0ef          	jal	ra,1006 <test_mount>
	return 0;
}
    10ee:	60e2                	ld	ra,24(sp)
    10f0:	6442                	ld	s0,16(sp)
    10f2:	64a2                	ld	s1,8(sp)
    10f4:	4501                	li	a0,0
    10f6:	6105                	addi	sp,sp,32
    10f8:	8082                	ret
		strcpy(device, argv[1]);
    10fa:	84ae                	mv	s1,a1
    10fc:	658c                	ld	a1,8(a1)
    10fe:	842a                	mv	s0,a0
    1100:	00001517          	auipc	a0,0x1
    1104:	08050513          	addi	a0,a0,128 # 2180 <device>
    1108:	1cf000ef          	jal	ra,1ad6 <strcpy>
	if(argc >= 3){
    110c:	4789                	li	a5,2
    110e:	fcf40ee3          	beq	s0,a5,10ea <main+0xe>
		strcpy(mntpoint, argv[2]);
    1112:	688c                	ld	a1,16(s1)
    1114:	00001517          	auipc	a0,0x1
    1118:	02c50513          	addi	a0,a0,44 # 2140 <mntpoint>
    111c:	1bb000ef          	jal	ra,1ad6 <strcpy>
    1120:	b7e9                	j	10ea <main+0xe>

0000000000001122 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1122:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1124:	4108                	lw	a0,0(a0)
{
    1126:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1128:	05a1                	addi	a1,a1,8
{
    112a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    112c:	fb1ff0ef          	jal	ra,10dc <main>
    1130:	51b000ef          	jal	ra,1e4a <exit>
	return 0;
}
    1134:	60a2                	ld	ra,8(sp)
    1136:	4501                	li	a0,0
    1138:	0141                	addi	sp,sp,16
    113a:	8082                	ret

000000000000113c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    113c:	7179                	addi	sp,sp,-48
    113e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1140:	12054e63          	bltz	a0,127c <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1144:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1148:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    114a:	02b7f6bb          	remuw	a3,a5,a1
    114e:	00001717          	auipc	a4,0x1
    1152:	08270713          	addi	a4,a4,130 # 21d0 <digits>
    buf[16] = 0;
    1156:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96ba                	add	a3,a3,a4
    1160:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1164:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1168:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    116c:	16b7e363          	bltu	a5,a1,12d2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1170:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1174:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1178:	1602                	slli	a2,a2,0x20
    117a:	9201                	srli	a2,a2,0x20
    117c:	963a                	add	a2,a2,a4
    117e:	00064603          	lbu	a2,0(a2)
    1182:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1186:	0007861b          	sext.w	a2,a5
    118a:	12b6e863          	bltu	a3,a1,12ba <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    118e:	02b7f6bb          	remuw	a3,a5,a1
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96ba                	add	a3,a3,a4
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    11a0:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    11a4:	10b66e63          	bltu	a2,a1,12c0 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    11a8:	02b876bb          	remuw	a3,a6,a1
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96ba                	add	a3,a3,a4
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ba:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11be:	10b86463          	bltu	a6,a1,12c6 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    11c2:	02b676bb          	remuw	a3,a2,a1
    11c6:	1682                	slli	a3,a3,0x20
    11c8:	9281                	srli	a3,a3,0x20
    11ca:	96ba                	add	a3,a3,a4
    11cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d0:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11d4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11d8:	0eb66a63          	bltu	a2,a1,12cc <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11dc:	02b876bb          	remuw	a3,a6,a1
    11e0:	1682                	slli	a3,a3,0x20
    11e2:	9281                	srli	a3,a3,0x20
    11e4:	96ba                	add	a3,a3,a4
    11e6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ea:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ee:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11f2:	0cb86163          	bltu	a6,a1,12b4 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11f6:	02b676bb          	remuw	a3,a2,a1
    11fa:	1682                	slli	a3,a3,0x20
    11fc:	9281                	srli	a3,a3,0x20
    11fe:	96ba                	add	a3,a3,a4
    1200:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1204:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1208:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    120c:	0cb66563          	bltu	a2,a1,12d6 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1210:	02b876bb          	remuw	a3,a6,a1
    1214:	1682                	slli	a3,a3,0x20
    1216:	9281                	srli	a3,a3,0x20
    1218:	96ba                	add	a3,a3,a4
    121a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    121e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1222:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1226:	0ab86b63          	bltu	a6,a1,12dc <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    122a:	02b676bb          	remuw	a3,a2,a1
    122e:	1682                	slli	a3,a3,0x20
    1230:	9281                	srli	a3,a3,0x20
    1232:	96ba                	add	a3,a3,a4
    1234:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1238:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    123c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1240:	0ab66163          	bltu	a2,a1,12e2 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1244:	1782                	slli	a5,a5,0x20
    1246:	9381                	srli	a5,a5,0x20
    1248:	97ba                	add	a5,a5,a4
    124a:	0007c703          	lbu	a4,0(a5)
    124e:	4599                	li	a1,6
    1250:	4795                	li	a5,5
    1252:	00e10723          	sb	a4,14(sp)

    if (sign)
    1256:	00055963          	bgez	a0,1268 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    125a:	1018                	addi	a4,sp,32
    125c:	973e                	add	a4,a4,a5
    125e:	02d00693          	li	a3,45
    1262:	fed70423          	sb	a3,-24(a4)
    1266:	85be                	mv	a1,a5
    write(f, s, l);
    1268:	003c                	addi	a5,sp,8
    126a:	4641                	li	a2,16
    126c:	9e0d                	subw	a2,a2,a1
    126e:	4505                	li	a0,1
    1270:	95be                	add	a1,a1,a5
    1272:	387000ef          	jal	ra,1df8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1276:	70a2                	ld	ra,40(sp)
    1278:	6145                	addi	sp,sp,48
    127a:	8082                	ret
        x = -xx;
    127c:	40a0063b          	negw	a2,a0
    1280:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1282:	02b677bb          	remuw	a5,a2,a1
    1286:	00001717          	auipc	a4,0x1
    128a:	f4a70713          	addi	a4,a4,-182 # 21d0 <digits>
    buf[16] = 0;
    128e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1292:	1782                	slli	a5,a5,0x20
    1294:	9381                	srli	a5,a5,0x20
    1296:	97ba                	add	a5,a5,a4
    1298:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    129c:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    12a0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12a4:	ecb676e3          	bleu	a1,a2,1170 <printint.constprop.0+0x34>
        buf[i--] = '-';
    12a8:	02d00793          	li	a5,45
    12ac:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12b0:	45b9                	li	a1,14
    12b2:	bf5d                	j	1268 <printint.constprop.0+0x12c>
    12b4:	47a5                	li	a5,9
    12b6:	45a9                	li	a1,10
    12b8:	bf79                	j	1256 <printint.constprop.0+0x11a>
    12ba:	47b5                	li	a5,13
    12bc:	45b9                	li	a1,14
    12be:	bf61                	j	1256 <printint.constprop.0+0x11a>
    12c0:	47b1                	li	a5,12
    12c2:	45b5                	li	a1,13
    12c4:	bf49                	j	1256 <printint.constprop.0+0x11a>
    12c6:	47ad                	li	a5,11
    12c8:	45b1                	li	a1,12
    12ca:	b771                	j	1256 <printint.constprop.0+0x11a>
    12cc:	47a9                	li	a5,10
    12ce:	45ad                	li	a1,11
    12d0:	b759                	j	1256 <printint.constprop.0+0x11a>
    i = 15;
    12d2:	45bd                	li	a1,15
    12d4:	bf51                	j	1268 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12d6:	47a1                	li	a5,8
    12d8:	45a5                	li	a1,9
    12da:	bfb5                	j	1256 <printint.constprop.0+0x11a>
    12dc:	479d                	li	a5,7
    12de:	45a1                	li	a1,8
    12e0:	bf9d                	j	1256 <printint.constprop.0+0x11a>
    12e2:	4799                	li	a5,6
    12e4:	459d                	li	a1,7
    12e6:	bf85                	j	1256 <printint.constprop.0+0x11a>

00000000000012e8 <getchar>:
{
    12e8:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12ea:	00f10593          	addi	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4501                	li	a0,0
{
    12f2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f8:	2f7000ef          	jal	ra,1dee <read>
}
    12fc:	60e2                	ld	ra,24(sp)
    12fe:	00f14503          	lbu	a0,15(sp)
    1302:	6105                	addi	sp,sp,32
    1304:	8082                	ret

0000000000001306 <putchar>:
{
    1306:	1101                	addi	sp,sp,-32
    char byte = c;
    1308:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    130c:	00f10593          	addi	a1,sp,15
    1310:	4605                	li	a2,1
    1312:	4505                	li	a0,1
{
    1314:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1316:	2e3000ef          	jal	ra,1df8 <write>
}
    131a:	60e2                	ld	ra,24(sp)
    131c:	2501                	sext.w	a0,a0
    131e:	6105                	addi	sp,sp,32
    1320:	8082                	ret

0000000000001322 <puts>:
{
    1322:	1141                	addi	sp,sp,-16
    1324:	e406                	sd	ra,8(sp)
    1326:	e022                	sd	s0,0(sp)
    1328:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    132a:	5b2000ef          	jal	ra,18dc <strlen>
    132e:	862a                	mv	a2,a0
    1330:	85a2                	mv	a1,s0
    1332:	4505                	li	a0,1
    1334:	2c5000ef          	jal	ra,1df8 <write>
}
    1338:	60a2                	ld	ra,8(sp)
    133a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    133c:	957d                	srai	a0,a0,0x3f
    return r;
    133e:	2501                	sext.w	a0,a0
}
    1340:	0141                	addi	sp,sp,16
    1342:	8082                	ret

0000000000001344 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1344:	7131                	addi	sp,sp,-192
    1346:	e0da                	sd	s6,64(sp)
    1348:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    134a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    134c:	013c                	addi	a5,sp,136
{
    134e:	f0ca                	sd	s2,96(sp)
    1350:	ecce                	sd	s3,88(sp)
    1352:	e8d2                	sd	s4,80(sp)
    1354:	e4d6                	sd	s5,72(sp)
    1356:	fc5e                	sd	s7,56(sp)
    1358:	fc86                	sd	ra,120(sp)
    135a:	f8a2                	sd	s0,112(sp)
    135c:	f4a6                	sd	s1,104(sp)
    135e:	89aa                	mv	s3,a0
    1360:	e52e                	sd	a1,136(sp)
    1362:	e932                	sd	a2,144(sp)
    1364:	ed36                	sd	a3,152(sp)
    1366:	f13a                	sd	a4,160(sp)
    1368:	f942                	sd	a6,176(sp)
    136a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    136c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    136e:	02500913          	li	s2,37
    1372:	07000a93          	li	s5,112
    buf[i++] = '0';
    1376:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137a:	00001a17          	auipc	s4,0x1
    137e:	e56a0a13          	addi	s4,s4,-426 # 21d0 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1382:	00001b97          	auipc	s7,0x1
    1386:	d9eb8b93          	addi	s7,s7,-610 # 2120 <__clone+0xee>
        if (!*s)
    138a:	0009c783          	lbu	a5,0(s3)
    138e:	cfb9                	beqz	a5,13ec <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1390:	23278d63          	beq	a5,s2,15ca <printf+0x286>
    1394:	864e                	mv	a2,s3
    1396:	a019                	j	139c <printf+0x58>
    1398:	07278563          	beq	a5,s2,1402 <printf+0xbe>
    139c:	0605                	addi	a2,a2,1
    139e:	00064783          	lbu	a5,0(a2)
    13a2:	fbfd                	bnez	a5,1398 <printf+0x54>
    13a4:	84b2                	mv	s1,a2
        l = z - a;
    13a6:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13aa:	8622                	mv	a2,s0
    13ac:	85ce                	mv	a1,s3
    13ae:	4505                	li	a0,1
    13b0:	249000ef          	jal	ra,1df8 <write>
        if (l)
    13b4:	ec3d                	bnez	s0,1432 <printf+0xee>
        if (s[1] == 0)
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	cb8d                	beqz	a5,13ec <printf+0xa8>
        switch (s[1])
    13bc:	09578b63          	beq	a5,s5,1452 <printf+0x10e>
    13c0:	06fafb63          	bleu	a5,s5,1436 <printf+0xf2>
    13c4:	07300713          	li	a4,115
    13c8:	1ce78e63          	beq	a5,a4,15a4 <printf+0x260>
    13cc:	07800713          	li	a4,120
    13d0:	1ae79563          	bne	a5,a4,157a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13d4:	6782                	ld	a5,0(sp)
    13d6:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13d8:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13dc:	4388                	lw	a0,0(a5)
    13de:	07a1                	addi	a5,a5,8
    13e0:	e03e                	sd	a5,0(sp)
    13e2:	d5bff0ef          	jal	ra,113c <printint.constprop.0>
        if (!*s)
    13e6:	0009c783          	lbu	a5,0(s3)
    13ea:	f3dd                	bnez	a5,1390 <printf+0x4c>
    }
    va_end(ap);
}
    13ec:	70e6                	ld	ra,120(sp)
    13ee:	7446                	ld	s0,112(sp)
    13f0:	74a6                	ld	s1,104(sp)
    13f2:	7906                	ld	s2,96(sp)
    13f4:	69e6                	ld	s3,88(sp)
    13f6:	6a46                	ld	s4,80(sp)
    13f8:	6aa6                	ld	s5,72(sp)
    13fa:	6b06                	ld	s6,64(sp)
    13fc:	7be2                	ld	s7,56(sp)
    13fe:	6129                	addi	sp,sp,192
    1400:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1402:	00164783          	lbu	a5,1(a2)
    1406:	84b2                	mv	s1,a2
    1408:	01278763          	beq	a5,s2,1416 <printf+0xd2>
    140c:	bf69                	j	13a6 <printf+0x62>
    140e:	0014c783          	lbu	a5,1(s1)
    1412:	f9279ae3          	bne	a5,s2,13a6 <printf+0x62>
    1416:	0489                	addi	s1,s1,2
    1418:	0004c783          	lbu	a5,0(s1)
    141c:	0605                	addi	a2,a2,1
    141e:	ff2788e3          	beq	a5,s2,140e <printf+0xca>
        l = z - a;
    1422:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1426:	8622                	mv	a2,s0
    1428:	85ce                	mv	a1,s3
    142a:	4505                	li	a0,1
    142c:	1cd000ef          	jal	ra,1df8 <write>
        if (l)
    1430:	d059                	beqz	s0,13b6 <printf+0x72>
    1432:	89a6                	mv	s3,s1
    1434:	bf99                	j	138a <printf+0x46>
    1436:	06400713          	li	a4,100
    143a:	14e79063          	bne	a5,a4,157a <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    143e:	6782                	ld	a5,0(sp)
    1440:	45a9                	li	a1,10
        s += 2;
    1442:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1446:	4388                	lw	a0,0(a5)
    1448:	07a1                	addi	a5,a5,8
    144a:	e03e                	sd	a5,0(sp)
    144c:	cf1ff0ef          	jal	ra,113c <printint.constprop.0>
        s += 2;
    1450:	bf59                	j	13e6 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1452:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1454:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1458:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    145a:	631c                	ld	a5,0(a4)
    145c:	0721                	addi	a4,a4,8
    145e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1460:	00479293          	slli	t0,a5,0x4
    1464:	00879f93          	slli	t6,a5,0x8
    1468:	00c79f13          	slli	t5,a5,0xc
    146c:	01079e93          	slli	t4,a5,0x10
    1470:	01479e13          	slli	t3,a5,0x14
    1474:	01879313          	slli	t1,a5,0x18
    1478:	01c79893          	slli	a7,a5,0x1c
    147c:	02479813          	slli	a6,a5,0x24
    1480:	02879513          	slli	a0,a5,0x28
    1484:	02c79593          	slli	a1,a5,0x2c
    1488:	03079693          	slli	a3,a5,0x30
    148c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1490:	03c7d413          	srli	s0,a5,0x3c
    1494:	01c7d39b          	srliw	t2,a5,0x1c
    1498:	03c2d293          	srli	t0,t0,0x3c
    149c:	03cfdf93          	srli	t6,t6,0x3c
    14a0:	03cf5f13          	srli	t5,t5,0x3c
    14a4:	03cede93          	srli	t4,t4,0x3c
    14a8:	03ce5e13          	srli	t3,t3,0x3c
    14ac:	03c35313          	srli	t1,t1,0x3c
    14b0:	03c8d893          	srli	a7,a7,0x3c
    14b4:	03c85813          	srli	a6,a6,0x3c
    14b8:	9171                	srli	a0,a0,0x3c
    14ba:	91f1                	srli	a1,a1,0x3c
    14bc:	92f1                	srli	a3,a3,0x3c
    14be:	9371                	srli	a4,a4,0x3c
    14c0:	96d2                	add	a3,a3,s4
    14c2:	9752                	add	a4,a4,s4
    14c4:	9452                	add	s0,s0,s4
    14c6:	92d2                	add	t0,t0,s4
    14c8:	9fd2                	add	t6,t6,s4
    14ca:	9f52                	add	t5,t5,s4
    14cc:	9ed2                	add	t4,t4,s4
    14ce:	9e52                	add	t3,t3,s4
    14d0:	9352                	add	t1,t1,s4
    14d2:	98d2                	add	a7,a7,s4
    14d4:	93d2                	add	t2,t2,s4
    14d6:	9852                	add	a6,a6,s4
    14d8:	9552                	add	a0,a0,s4
    14da:	95d2                	add	a1,a1,s4
    14dc:	0006c983          	lbu	s3,0(a3)
    14e0:	0002c283          	lbu	t0,0(t0)
    14e4:	00074683          	lbu	a3,0(a4)
    14e8:	000fcf83          	lbu	t6,0(t6)
    14ec:	000f4f03          	lbu	t5,0(t5)
    14f0:	000ece83          	lbu	t4,0(t4)
    14f4:	000e4e03          	lbu	t3,0(t3)
    14f8:	00034303          	lbu	t1,0(t1)
    14fc:	0008c883          	lbu	a7,0(a7)
    1500:	0003c383          	lbu	t2,0(t2)
    1504:	00084803          	lbu	a6,0(a6)
    1508:	00054503          	lbu	a0,0(a0)
    150c:	0005c583          	lbu	a1,0(a1)
    1510:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1514:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1518:	9371                	srli	a4,a4,0x3c
    151a:	8bbd                	andi	a5,a5,15
    151c:	9752                	add	a4,a4,s4
    151e:	97d2                	add	a5,a5,s4
    1520:	005105a3          	sb	t0,11(sp)
    1524:	01f10623          	sb	t6,12(sp)
    1528:	01e106a3          	sb	t5,13(sp)
    152c:	01d10723          	sb	t4,14(sp)
    1530:	01c107a3          	sb	t3,15(sp)
    1534:	00610823          	sb	t1,16(sp)
    1538:	011108a3          	sb	a7,17(sp)
    153c:	00710923          	sb	t2,18(sp)
    1540:	010109a3          	sb	a6,19(sp)
    1544:	00a10a23          	sb	a0,20(sp)
    1548:	00b10aa3          	sb	a1,21(sp)
    154c:	01310b23          	sb	s3,22(sp)
    1550:	00d10ba3          	sb	a3,23(sp)
    1554:	00810523          	sb	s0,10(sp)
    1558:	00074703          	lbu	a4,0(a4)
    155c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1560:	002c                	addi	a1,sp,8
    1562:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1564:	00e10c23          	sb	a4,24(sp)
    1568:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    156c:	00010d23          	sb	zero,26(sp)
        s += 2;
    1570:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1574:	085000ef          	jal	ra,1df8 <write>
        s += 2;
    1578:	b5bd                	j	13e6 <printf+0xa2>
    char byte = c;
    157a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	addi	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1588:	071000ef          	jal	ra,1df8 <write>
    char byte = c;
    158c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1590:	4605                	li	a2,1
    1592:	002c                	addi	a1,sp,8
    1594:	4505                	li	a0,1
    char byte = c;
    1596:	00f10423          	sb	a5,8(sp)
        s += 2;
    159a:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    159e:	05b000ef          	jal	ra,1df8 <write>
        s += 2;
    15a2:	b591                	j	13e6 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    15a4:	6782                	ld	a5,0(sp)
    15a6:	6380                	ld	s0,0(a5)
    15a8:	07a1                	addi	a5,a5,8
    15aa:	e03e                	sd	a5,0(sp)
    15ac:	cc05                	beqz	s0,15e4 <printf+0x2a0>
            l = strnlen(a, 200);
    15ae:	0c800593          	li	a1,200
    15b2:	8522                	mv	a0,s0
    15b4:	45a000ef          	jal	ra,1a0e <strnlen>
    write(f, s, l);
    15b8:	0005061b          	sext.w	a2,a0
    15bc:	85a2                	mv	a1,s0
    15be:	4505                	li	a0,1
    15c0:	039000ef          	jal	ra,1df8 <write>
        s += 2;
    15c4:	00248993          	addi	s3,s1,2
    15c8:	bd39                	j	13e6 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15ca:	0019c783          	lbu	a5,1(s3)
    15ce:	84ce                	mv	s1,s3
    15d0:	864e                	mv	a2,s3
    15d2:	e52782e3          	beq	a5,s2,1416 <printf+0xd2>
    write(f, s, l);
    15d6:	4601                	li	a2,0
    15d8:	85ce                	mv	a1,s3
    15da:	4505                	li	a0,1
    15dc:	01d000ef          	jal	ra,1df8 <write>
    15e0:	84ce                	mv	s1,s3
    15e2:	bbd1                	j	13b6 <printf+0x72>
                a = "(null)";
    15e4:	845e                	mv	s0,s7
    15e6:	b7e1                	j	15ae <printf+0x26a>

00000000000015e8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e8:	1141                	addi	sp,sp,-16
    15ea:	e406                	sd	ra,8(sp)
    puts(m);
    15ec:	d37ff0ef          	jal	ra,1322 <puts>
    exit(-100);
}
    15f0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f2:	f9c00513          	li	a0,-100
}
    15f6:	0141                	addi	sp,sp,16
    exit(-100);
    15f8:	0530006f          	j	1e4a <exit>

00000000000015fc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fc:	02000793          	li	a5,32
    1600:	00f50663          	beq	a0,a5,160c <isspace+0x10>
    1604:	355d                	addiw	a0,a0,-9
    1606:	00553513          	sltiu	a0,a0,5
    160a:	8082                	ret
    160c:	4505                	li	a0,1
}
    160e:	8082                	ret

0000000000001610 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1610:	fd05051b          	addiw	a0,a0,-48
}
    1614:	00a53513          	sltiu	a0,a0,10
    1618:	8082                	ret

000000000000161a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    161a:	02000613          	li	a2,32
    161e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1620:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1624:	0007079b          	sext.w	a5,a4
    1628:	ff77869b          	addiw	a3,a5,-9
    162c:	04c70b63          	beq	a4,a2,1682 <atoi+0x68>
    1630:	04d5f963          	bleu	a3,a1,1682 <atoi+0x68>
        s++;
    switch (*s)
    1634:	02b00693          	li	a3,43
    1638:	04d70a63          	beq	a4,a3,168c <atoi+0x72>
    163c:	02d00693          	li	a3,45
    1640:	06d70463          	beq	a4,a3,16a8 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1644:	fd07859b          	addiw	a1,a5,-48
    1648:	4625                	li	a2,9
    164a:	873e                	mv	a4,a5
    164c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    164e:	4e01                	li	t3,0
    while (isdigit(*s))
    1650:	04b66a63          	bltu	a2,a1,16a4 <atoi+0x8a>
    int n = 0, neg = 0;
    1654:	4501                	li	a0,0
    while (isdigit(*s))
    1656:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1658:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    165a:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    165e:	0025179b          	slliw	a5,a0,0x2
    1662:	9d3d                	addw	a0,a0,a5
    1664:	fd07031b          	addiw	t1,a4,-48
    1668:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    166c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1670:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1674:	0006071b          	sext.w	a4,a2
    1678:	feb870e3          	bleu	a1,a6,1658 <atoi+0x3e>
    return neg ? n : -n;
    167c:	000e0563          	beqz	t3,1686 <atoi+0x6c>
}
    1680:	8082                	ret
        s++;
    1682:	0505                	addi	a0,a0,1
    1684:	bf71                	j	1620 <atoi+0x6>
    1686:	4113053b          	subw	a0,t1,a7
    168a:	8082                	ret
    while (isdigit(*s))
    168c:	00154783          	lbu	a5,1(a0)
    1690:	4625                	li	a2,9
        s++;
    1692:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1696:	fd07859b          	addiw	a1,a5,-48
    169a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    169e:	4e01                	li	t3,0
    while (isdigit(*s))
    16a0:	fab67ae3          	bleu	a1,a2,1654 <atoi+0x3a>
    16a4:	4501                	li	a0,0
}
    16a6:	8082                	ret
    while (isdigit(*s))
    16a8:	00154783          	lbu	a5,1(a0)
    16ac:	4625                	li	a2,9
        s++;
    16ae:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16b2:	fd07859b          	addiw	a1,a5,-48
    16b6:	0007871b          	sext.w	a4,a5
    16ba:	feb665e3          	bltu	a2,a1,16a4 <atoi+0x8a>
        neg = 1;
    16be:	4e05                	li	t3,1
    16c0:	bf51                	j	1654 <atoi+0x3a>

00000000000016c2 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16c2:	16060d63          	beqz	a2,183c <memset+0x17a>
    16c6:	40a007b3          	neg	a5,a0
    16ca:	8b9d                	andi	a5,a5,7
    16cc:	00778713          	addi	a4,a5,7
    16d0:	482d                	li	a6,11
    16d2:	0ff5f593          	andi	a1,a1,255
    16d6:	fff60693          	addi	a3,a2,-1
    16da:	17076263          	bltu	a4,a6,183e <memset+0x17c>
    16de:	16e6ea63          	bltu	a3,a4,1852 <memset+0x190>
    16e2:	16078563          	beqz	a5,184c <memset+0x18a>
    16e6:	00b50023          	sb	a1,0(a0)
    16ea:	4705                	li	a4,1
    16ec:	00150e93          	addi	t4,a0,1
    16f0:	14e78c63          	beq	a5,a4,1848 <memset+0x186>
    16f4:	00b500a3          	sb	a1,1(a0)
    16f8:	4709                	li	a4,2
    16fa:	00250e93          	addi	t4,a0,2
    16fe:	14e78d63          	beq	a5,a4,1858 <memset+0x196>
    1702:	00b50123          	sb	a1,2(a0)
    1706:	470d                	li	a4,3
    1708:	00350e93          	addi	t4,a0,3
    170c:	12e78b63          	beq	a5,a4,1842 <memset+0x180>
    1710:	00b501a3          	sb	a1,3(a0)
    1714:	4711                	li	a4,4
    1716:	00450e93          	addi	t4,a0,4
    171a:	14e78163          	beq	a5,a4,185c <memset+0x19a>
    171e:	00b50223          	sb	a1,4(a0)
    1722:	4715                	li	a4,5
    1724:	00550e93          	addi	t4,a0,5
    1728:	12e78c63          	beq	a5,a4,1860 <memset+0x19e>
    172c:	00b502a3          	sb	a1,5(a0)
    1730:	471d                	li	a4,7
    1732:	00650e93          	addi	t4,a0,6
    1736:	12e79763          	bne	a5,a4,1864 <memset+0x1a2>
    173a:	00750e93          	addi	t4,a0,7
    173e:	00b50323          	sb	a1,6(a0)
    1742:	4f1d                	li	t5,7
    1744:	00859713          	slli	a4,a1,0x8
    1748:	8f4d                	or	a4,a4,a1
    174a:	01059e13          	slli	t3,a1,0x10
    174e:	01c76e33          	or	t3,a4,t3
    1752:	01859313          	slli	t1,a1,0x18
    1756:	006e6333          	or	t1,t3,t1
    175a:	02059893          	slli	a7,a1,0x20
    175e:	011368b3          	or	a7,t1,a7
    1762:	02859813          	slli	a6,a1,0x28
    1766:	40f60333          	sub	t1,a2,a5
    176a:	0108e833          	or	a6,a7,a6
    176e:	03059693          	slli	a3,a1,0x30
    1772:	00d866b3          	or	a3,a6,a3
    1776:	03859713          	slli	a4,a1,0x38
    177a:	97aa                	add	a5,a5,a0
    177c:	ff837813          	andi	a6,t1,-8
    1780:	8f55                	or	a4,a4,a3
    1782:	00f806b3          	add	a3,a6,a5
    1786:	e398                	sd	a4,0(a5)
    1788:	07a1                	addi	a5,a5,8
    178a:	fed79ee3          	bne	a5,a3,1786 <memset+0xc4>
    178e:	ff837693          	andi	a3,t1,-8
    1792:	00de87b3          	add	a5,t4,a3
    1796:	01e6873b          	addw	a4,a3,t5
    179a:	0ad30663          	beq	t1,a3,1846 <memset+0x184>
    179e:	00b78023          	sb	a1,0(a5)
    17a2:	0017069b          	addiw	a3,a4,1
    17a6:	08c6fb63          	bleu	a2,a3,183c <memset+0x17a>
    17aa:	00b780a3          	sb	a1,1(a5)
    17ae:	0027069b          	addiw	a3,a4,2
    17b2:	08c6f563          	bleu	a2,a3,183c <memset+0x17a>
    17b6:	00b78123          	sb	a1,2(a5)
    17ba:	0037069b          	addiw	a3,a4,3
    17be:	06c6ff63          	bleu	a2,a3,183c <memset+0x17a>
    17c2:	00b781a3          	sb	a1,3(a5)
    17c6:	0047069b          	addiw	a3,a4,4
    17ca:	06c6f963          	bleu	a2,a3,183c <memset+0x17a>
    17ce:	00b78223          	sb	a1,4(a5)
    17d2:	0057069b          	addiw	a3,a4,5
    17d6:	06c6f363          	bleu	a2,a3,183c <memset+0x17a>
    17da:	00b782a3          	sb	a1,5(a5)
    17de:	0067069b          	addiw	a3,a4,6
    17e2:	04c6fd63          	bleu	a2,a3,183c <memset+0x17a>
    17e6:	00b78323          	sb	a1,6(a5)
    17ea:	0077069b          	addiw	a3,a4,7
    17ee:	04c6f763          	bleu	a2,a3,183c <memset+0x17a>
    17f2:	00b783a3          	sb	a1,7(a5)
    17f6:	0087069b          	addiw	a3,a4,8
    17fa:	04c6f163          	bleu	a2,a3,183c <memset+0x17a>
    17fe:	00b78423          	sb	a1,8(a5)
    1802:	0097069b          	addiw	a3,a4,9
    1806:	02c6fb63          	bleu	a2,a3,183c <memset+0x17a>
    180a:	00b784a3          	sb	a1,9(a5)
    180e:	00a7069b          	addiw	a3,a4,10
    1812:	02c6f563          	bleu	a2,a3,183c <memset+0x17a>
    1816:	00b78523          	sb	a1,10(a5)
    181a:	00b7069b          	addiw	a3,a4,11
    181e:	00c6ff63          	bleu	a2,a3,183c <memset+0x17a>
    1822:	00b785a3          	sb	a1,11(a5)
    1826:	00c7069b          	addiw	a3,a4,12
    182a:	00c6f963          	bleu	a2,a3,183c <memset+0x17a>
    182e:	00b78623          	sb	a1,12(a5)
    1832:	2735                	addiw	a4,a4,13
    1834:	00c77463          	bleu	a2,a4,183c <memset+0x17a>
    1838:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    183c:	8082                	ret
    183e:	472d                	li	a4,11
    1840:	bd79                	j	16de <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1842:	4f0d                	li	t5,3
    1844:	b701                	j	1744 <memset+0x82>
    1846:	8082                	ret
    1848:	4f05                	li	t5,1
    184a:	bded                	j	1744 <memset+0x82>
    184c:	8eaa                	mv	t4,a0
    184e:	4f01                	li	t5,0
    1850:	bdd5                	j	1744 <memset+0x82>
    1852:	87aa                	mv	a5,a0
    1854:	4701                	li	a4,0
    1856:	b7a1                	j	179e <memset+0xdc>
    1858:	4f09                	li	t5,2
    185a:	b5ed                	j	1744 <memset+0x82>
    185c:	4f11                	li	t5,4
    185e:	b5dd                	j	1744 <memset+0x82>
    1860:	4f15                	li	t5,5
    1862:	b5cd                	j	1744 <memset+0x82>
    1864:	4f19                	li	t5,6
    1866:	bdf9                	j	1744 <memset+0x82>

0000000000001868 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1868:	00054703          	lbu	a4,0(a0)
    186c:	0005c783          	lbu	a5,0(a1)
    1870:	00e79b63          	bne	a5,a4,1886 <strcmp+0x1e>
    1874:	cf89                	beqz	a5,188e <strcmp+0x26>
    1876:	0505                	addi	a0,a0,1
    1878:	0585                	addi	a1,a1,1
    187a:	0005c783          	lbu	a5,0(a1)
    187e:	00054703          	lbu	a4,0(a0)
    1882:	fef709e3          	beq	a4,a5,1874 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1886:	0007051b          	sext.w	a0,a4
}
    188a:	9d1d                	subw	a0,a0,a5
    188c:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    188e:	4501                	li	a0,0
}
    1890:	9d1d                	subw	a0,a0,a5
    1892:	8082                	ret

0000000000001894 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1894:	c231                	beqz	a2,18d8 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1896:	00054783          	lbu	a5,0(a0)
    189a:	0005c683          	lbu	a3,0(a1)
    189e:	c795                	beqz	a5,18ca <strncmp+0x36>
    18a0:	ca85                	beqz	a3,18d0 <strncmp+0x3c>
    if (!n--)
    18a2:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a4:	c615                	beqz	a2,18d0 <strncmp+0x3c>
    18a6:	00150713          	addi	a4,a0,1
    18aa:	9532                	add	a0,a0,a2
    18ac:	00d78963          	beq	a5,a3,18be <strncmp+0x2a>
    18b0:	a005                	j	18d0 <strncmp+0x3c>
    18b2:	ce99                	beqz	a3,18d0 <strncmp+0x3c>
    18b4:	00e50e63          	beq	a0,a4,18d0 <strncmp+0x3c>
    18b8:	0705                	addi	a4,a4,1
    18ba:	00d79b63          	bne	a5,a3,18d0 <strncmp+0x3c>
    18be:	00074783          	lbu	a5,0(a4)
    18c2:	0585                	addi	a1,a1,1
    18c4:	0005c683          	lbu	a3,0(a1)
    18c8:	f7ed                	bnez	a5,18b2 <strncmp+0x1e>
    18ca:	4501                	li	a0,0
        ;
    return *l - *r;
    18cc:	9d15                	subw	a0,a0,a3
    18ce:	8082                	ret
    18d0:	0007851b          	sext.w	a0,a5
    18d4:	9d15                	subw	a0,a0,a3
    18d6:	8082                	ret
        return 0;
    18d8:	4501                	li	a0,0
}
    18da:	8082                	ret

00000000000018dc <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18dc:	00757793          	andi	a5,a0,7
    18e0:	cfa1                	beqz	a5,1938 <strlen+0x5c>
        if (!*s)
    18e2:	00054783          	lbu	a5,0(a0)
    18e6:	cbb9                	beqz	a5,193c <strlen+0x60>
    18e8:	87aa                	mv	a5,a0
    18ea:	a021                	j	18f2 <strlen+0x16>
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	c329                	beqz	a4,1932 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18f2:	0785                	addi	a5,a5,1
    18f4:	0077f713          	andi	a4,a5,7
    18f8:	fb75                	bnez	a4,18ec <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18fa:	00001717          	auipc	a4,0x1
    18fe:	82e70713          	addi	a4,a4,-2002 # 2128 <__clone+0xf6>
    1902:	630c                	ld	a1,0(a4)
    1904:	00001717          	auipc	a4,0x1
    1908:	82c70713          	addi	a4,a4,-2004 # 2130 <__clone+0xfe>
    190c:	6394                	ld	a3,0(a5)
    190e:	6310                	ld	a2,0(a4)
    1910:	a019                	j	1916 <strlen+0x3a>
    1912:	07a1                	addi	a5,a5,8
    1914:	6394                	ld	a3,0(a5)
    1916:	00b68733          	add	a4,a3,a1
    191a:	fff6c693          	not	a3,a3
    191e:	8f75                	and	a4,a4,a3
    1920:	8f71                	and	a4,a4,a2
    1922:	db65                	beqz	a4,1912 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1924:	0007c703          	lbu	a4,0(a5)
    1928:	c709                	beqz	a4,1932 <strlen+0x56>
    192a:	0785                	addi	a5,a5,1
    192c:	0007c703          	lbu	a4,0(a5)
    1930:	ff6d                	bnez	a4,192a <strlen+0x4e>
        ;
    return s - a;
    1932:	40a78533          	sub	a0,a5,a0
}
    1936:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1938:	87aa                	mv	a5,a0
    193a:	b7c1                	j	18fa <strlen+0x1e>
        if (!*s)
    193c:	4501                	li	a0,0
            return s - a;
    193e:	8082                	ret

0000000000001940 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1940:	00757793          	andi	a5,a0,7
    1944:	0ff5f593          	andi	a1,a1,255
    1948:	cb99                	beqz	a5,195e <memchr+0x1e>
    194a:	c655                	beqz	a2,19f6 <memchr+0xb6>
    194c:	00054783          	lbu	a5,0(a0)
    1950:	0ab78663          	beq	a5,a1,19fc <memchr+0xbc>
    1954:	0505                	addi	a0,a0,1
    1956:	00757793          	andi	a5,a0,7
    195a:	167d                	addi	a2,a2,-1
    195c:	f7fd                	bnez	a5,194a <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    195e:	4701                	li	a4,0
    if (n && *s != c)
    1960:	ca49                	beqz	a2,19f2 <memchr+0xb2>
    1962:	00054783          	lbu	a5,0(a0)
    1966:	08b78b63          	beq	a5,a1,19fc <memchr+0xbc>
        size_t k = ONES * c;
    196a:	00000797          	auipc	a5,0x0
    196e:	7ce78793          	addi	a5,a5,1998 # 2138 <__clone+0x106>
    1972:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1974:	479d                	li	a5,7
        size_t k = ONES * c;
    1976:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    197a:	08c7f863          	bleu	a2,a5,1a0a <memchr+0xca>
    197e:	611c                	ld	a5,0(a0)
    1980:	00000317          	auipc	t1,0x0
    1984:	7b030313          	addi	t1,t1,1968 # 2130 <__clone+0xfe>
    1988:	00033803          	ld	a6,0(t1)
    198c:	00f8c7b3          	xor	a5,a7,a5
    1990:	fff7c713          	not	a4,a5
    1994:	8f95                	sub	a5,a5,a3
    1996:	8ff9                	and	a5,a5,a4
    1998:	0107f7b3          	and	a5,a5,a6
    199c:	e7bd                	bnez	a5,1a0a <memchr+0xca>
    199e:	4e1d                	li	t3,7
    19a0:	00000e97          	auipc	t4,0x0
    19a4:	788e8e93          	addi	t4,t4,1928 # 2128 <__clone+0xf6>
    19a8:	a005                	j	19c8 <memchr+0x88>
    19aa:	6514                	ld	a3,8(a0)
    19ac:	000eb783          	ld	a5,0(t4)
    19b0:	00033803          	ld	a6,0(t1)
    19b4:	00d8c6b3          	xor	a3,a7,a3
    19b8:	97b6                	add	a5,a5,a3
    19ba:	fff6c693          	not	a3,a3
    19be:	8ff5                	and	a5,a5,a3
    19c0:	0107f7b3          	and	a5,a5,a6
    19c4:	e3a1                	bnez	a5,1a04 <memchr+0xc4>
    19c6:	853a                	mv	a0,a4
    19c8:	1661                	addi	a2,a2,-8
    19ca:	00850713          	addi	a4,a0,8
    19ce:	fcce6ee3          	bltu	t3,a2,19aa <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19d2:	c215                	beqz	a2,19f6 <memchr+0xb6>
    19d4:	00074783          	lbu	a5,0(a4)
    19d8:	00f58d63          	beq	a1,a5,19f2 <memchr+0xb2>
    19dc:	00170793          	addi	a5,a4,1
    19e0:	963a                	add	a2,a2,a4
    19e2:	873e                	mv	a4,a5
    19e4:	00f60963          	beq	a2,a5,19f6 <memchr+0xb6>
    19e8:	0007c683          	lbu	a3,0(a5)
    19ec:	0785                	addi	a5,a5,1
    19ee:	feb69ae3          	bne	a3,a1,19e2 <memchr+0xa2>
}
    19f2:	853a                	mv	a0,a4
    19f4:	8082                	ret
    return n ? (void *)s : 0;
    19f6:	4701                	li	a4,0
}
    19f8:	853a                	mv	a0,a4
    19fa:	8082                	ret
    19fc:	872a                	mv	a4,a0
    19fe:	00074783          	lbu	a5,0(a4)
    1a02:	bfd9                	j	19d8 <memchr+0x98>
    1a04:	00854783          	lbu	a5,8(a0)
    1a08:	bfc1                	j	19d8 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a0a:	872a                	mv	a4,a0
    1a0c:	bfc1                	j	19dc <memchr+0x9c>

0000000000001a0e <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a0e:	00757793          	andi	a5,a0,7
    1a12:	cfc5                	beqz	a5,1aca <strnlen+0xbc>
    1a14:	c1c5                	beqz	a1,1ab4 <strnlen+0xa6>
    1a16:	00054783          	lbu	a5,0(a0)
    1a1a:	cfd9                	beqz	a5,1ab8 <strnlen+0xaa>
    1a1c:	87ae                	mv	a5,a1
    1a1e:	86aa                	mv	a3,a0
    1a20:	a029                	j	1a2a <strnlen+0x1c>
    1a22:	cbc9                	beqz	a5,1ab4 <strnlen+0xa6>
    1a24:	0006c703          	lbu	a4,0(a3)
    1a28:	cb51                	beqz	a4,1abc <strnlen+0xae>
    1a2a:	0685                	addi	a3,a3,1
    1a2c:	0076f713          	andi	a4,a3,7
    1a30:	17fd                	addi	a5,a5,-1
    1a32:	fb65                	bnez	a4,1a22 <strnlen+0x14>
    if (n && *s != c)
    1a34:	c3c1                	beqz	a5,1ab4 <strnlen+0xa6>
    1a36:	0006c703          	lbu	a4,0(a3)
    1a3a:	c349                	beqz	a4,1abc <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a3c:	471d                	li	a4,7
    1a3e:	08f77a63          	bleu	a5,a4,1ad2 <strnlen+0xc4>
    1a42:	00000e17          	auipc	t3,0x0
    1a46:	6e6e0e13          	addi	t3,t3,1766 # 2128 <__clone+0xf6>
    1a4a:	6290                	ld	a2,0(a3)
    1a4c:	000e3703          	ld	a4,0(t3)
    1a50:	00000e97          	auipc	t4,0x0
    1a54:	6e0e8e93          	addi	t4,t4,1760 # 2130 <__clone+0xfe>
    1a58:	000eb803          	ld	a6,0(t4)
    1a5c:	9732                	add	a4,a4,a2
    1a5e:	fff64613          	not	a2,a2
    1a62:	8f71                	and	a4,a4,a2
    1a64:	01077733          	and	a4,a4,a6
    1a68:	e72d                	bnez	a4,1ad2 <strnlen+0xc4>
    1a6a:	4f1d                	li	t5,7
    1a6c:	a839                	j	1a8a <strnlen+0x7c>
    1a6e:	6698                	ld	a4,8(a3)
    1a70:	000e3303          	ld	t1,0(t3)
    1a74:	000eb803          	ld	a6,0(t4)
    1a78:	fff74893          	not	a7,a4
    1a7c:	971a                	add	a4,a4,t1
    1a7e:	01177733          	and	a4,a4,a7
    1a82:	01077733          	and	a4,a4,a6
    1a86:	ef1d                	bnez	a4,1ac4 <strnlen+0xb6>
    1a88:	86b2                	mv	a3,a2
    1a8a:	17e1                	addi	a5,a5,-8
    1a8c:	00868613          	addi	a2,a3,8
    1a90:	fcff6fe3          	bltu	t5,a5,1a6e <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a94:	c385                	beqz	a5,1ab4 <strnlen+0xa6>
    1a96:	00064703          	lbu	a4,0(a2)
    1a9a:	cb19                	beqz	a4,1ab0 <strnlen+0xa2>
    1a9c:	00160713          	addi	a4,a2,1
    1aa0:	97b2                	add	a5,a5,a2
    1aa2:	863a                	mv	a2,a4
    1aa4:	00e78863          	beq	a5,a4,1ab4 <strnlen+0xa6>
    1aa8:	0705                	addi	a4,a4,1
    1aaa:	fff74683          	lbu	a3,-1(a4)
    1aae:	faf5                	bnez	a3,1aa2 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1ab0:	40a605b3          	sub	a1,a2,a0
}
    1ab4:	852e                	mv	a0,a1
    1ab6:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ab8:	87ae                	mv	a5,a1
    1aba:	86aa                	mv	a3,a0
    if (n && *s != c)
    1abc:	8636                	mv	a2,a3
    1abe:	00064703          	lbu	a4,0(a2)
    1ac2:	bfe1                	j	1a9a <strnlen+0x8c>
    1ac4:	0086c703          	lbu	a4,8(a3)
    1ac8:	bfc9                	j	1a9a <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1aca:	87ae                	mv	a5,a1
    1acc:	86aa                	mv	a3,a0
    if (n && *s != c)
    1ace:	f7a5                	bnez	a5,1a36 <strnlen+0x28>
    1ad0:	b7d5                	j	1ab4 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ad2:	8636                	mv	a2,a3
    1ad4:	b7e1                	j	1a9c <strnlen+0x8e>

0000000000001ad6 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ad6:	00b547b3          	xor	a5,a0,a1
    1ada:	8b9d                	andi	a5,a5,7
    1adc:	efa9                	bnez	a5,1b36 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ade:	0075f793          	andi	a5,a1,7
    1ae2:	c38d                	beqz	a5,1b04 <strcpy+0x2e>
            if (!(*d = *s))
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	e799                	bnez	a5,1afa <strcpy+0x24>
    1aee:	a095                	j	1b52 <strcpy+0x7c>
    1af0:	0005c783          	lbu	a5,0(a1)
    1af4:	00f50023          	sb	a5,0(a0)
    1af8:	cbb9                	beqz	a5,1b4e <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1afa:	0585                	addi	a1,a1,1
    1afc:	0075f793          	andi	a5,a1,7
    1b00:	0505                	addi	a0,a0,1
    1b02:	f7fd                	bnez	a5,1af0 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b04:	00000797          	auipc	a5,0x0
    1b08:	62478793          	addi	a5,a5,1572 # 2128 <__clone+0xf6>
    1b0c:	0007b803          	ld	a6,0(a5)
    1b10:	00000797          	auipc	a5,0x0
    1b14:	62078793          	addi	a5,a5,1568 # 2130 <__clone+0xfe>
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	6390                	ld	a2,0(a5)
    1b1c:	a031                	j	1b28 <strcpy+0x52>
    1b1e:	0521                	addi	a0,a0,8
    1b20:	05a1                	addi	a1,a1,8
    1b22:	fee53c23          	sd	a4,-8(a0)
    1b26:	6198                	ld	a4,0(a1)
    1b28:	010707b3          	add	a5,a4,a6
    1b2c:	fff74693          	not	a3,a4
    1b30:	8ff5                	and	a5,a5,a3
    1b32:	8ff1                	and	a5,a5,a2
    1b34:	d7ed                	beqz	a5,1b1e <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b36:	0005c783          	lbu	a5,0(a1)
    1b3a:	00f50023          	sb	a5,0(a0)
    1b3e:	cb89                	beqz	a5,1b50 <strcpy+0x7a>
    1b40:	0585                	addi	a1,a1,1
    1b42:	0005c783          	lbu	a5,0(a1)
    1b46:	0505                	addi	a0,a0,1
    1b48:	00f50023          	sb	a5,0(a0)
    1b4c:	fbf5                	bnez	a5,1b40 <strcpy+0x6a>
        ;
    return d;
}
    1b4e:	8082                	ret
    1b50:	8082                	ret
    1b52:	8082                	ret

0000000000001b54 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b54:	00b547b3          	xor	a5,a0,a1
    1b58:	8b9d                	andi	a5,a5,7
    1b5a:	ebc1                	bnez	a5,1bea <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b5c:	0075f793          	andi	a5,a1,7
    1b60:	cf91                	beqz	a5,1b7c <strncpy+0x28>
    1b62:	20060e63          	beqz	a2,1d7e <strncpy+0x22a>
    1b66:	0005c783          	lbu	a5,0(a1)
    1b6a:	00f50023          	sb	a5,0(a0)
    1b6e:	c3d5                	beqz	a5,1c12 <strncpy+0xbe>
    1b70:	0585                	addi	a1,a1,1
    1b72:	0075f793          	andi	a5,a1,7
    1b76:	167d                	addi	a2,a2,-1
    1b78:	0505                	addi	a0,a0,1
    1b7a:	f7e5                	bnez	a5,1b62 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b7c:	20060163          	beqz	a2,1d7e <strncpy+0x22a>
    1b80:	0005c683          	lbu	a3,0(a1)
    1b84:	c6d9                	beqz	a3,1c12 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b86:	479d                	li	a5,7
    1b88:	22c7f563          	bleu	a2,a5,1db2 <strncpy+0x25e>
    1b8c:	00000317          	auipc	t1,0x0
    1b90:	59c30313          	addi	t1,t1,1436 # 2128 <__clone+0xf6>
    1b94:	6198                	ld	a4,0(a1)
    1b96:	00033783          	ld	a5,0(t1)
    1b9a:	00000e17          	auipc	t3,0x0
    1b9e:	596e0e13          	addi	t3,t3,1430 # 2130 <__clone+0xfe>
    1ba2:	000e3803          	ld	a6,0(t3)
    1ba6:	97ba                	add	a5,a5,a4
    1ba8:	fff74893          	not	a7,a4
    1bac:	0117f7b3          	and	a5,a5,a7
    1bb0:	0107f7b3          	and	a5,a5,a6
    1bb4:	1e079f63          	bnez	a5,1db2 <strncpy+0x25e>
    1bb8:	4e9d                	li	t4,7
    1bba:	a005                	j	1bda <strncpy+0x86>
    1bbc:	6598                	ld	a4,8(a1)
    1bbe:	00033783          	ld	a5,0(t1)
    1bc2:	000e3803          	ld	a6,0(t3)
    1bc6:	fff74893          	not	a7,a4
    1bca:	97ba                	add	a5,a5,a4
    1bcc:	0117f7b3          	and	a5,a5,a7
    1bd0:	0107f7b3          	and	a5,a5,a6
    1bd4:	1a079f63          	bnez	a5,1d92 <strncpy+0x23e>
    1bd8:	85b6                	mv	a1,a3
            *wd = *ws;
    1bda:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bdc:	1661                	addi	a2,a2,-8
    1bde:	00858693          	addi	a3,a1,8
    1be2:	0521                	addi	a0,a0,8
    1be4:	fcceece3          	bltu	t4,a2,1bbc <strncpy+0x68>
    1be8:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bea:	18060a63          	beqz	a2,1d7e <strncpy+0x22a>
    1bee:	0005c783          	lbu	a5,0(a1)
    1bf2:	872a                	mv	a4,a0
    1bf4:	00f50023          	sb	a5,0(a0)
    1bf8:	e799                	bnez	a5,1c06 <strncpy+0xb2>
    1bfa:	a829                	j	1c14 <strncpy+0xc0>
    1bfc:	0005c783          	lbu	a5,0(a1)
    1c00:	00f70023          	sb	a5,0(a4)
    1c04:	cb81                	beqz	a5,1c14 <strncpy+0xc0>
    1c06:	167d                	addi	a2,a2,-1
    1c08:	0585                	addi	a1,a1,1
    1c0a:	0705                	addi	a4,a4,1
    1c0c:	fa65                	bnez	a2,1bfc <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1c0e:	853a                	mv	a0,a4
    1c10:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1c12:	872a                	mv	a4,a0
    1c14:	4805                	li	a6,1
    1c16:	14061c63          	bnez	a2,1d6e <strncpy+0x21a>
    1c1a:	40e007b3          	neg	a5,a4
    1c1e:	8b9d                	andi	a5,a5,7
    1c20:	4581                	li	a1,0
    1c22:	12061e63          	bnez	a2,1d5e <strncpy+0x20a>
    1c26:	00778693          	addi	a3,a5,7
    1c2a:	452d                	li	a0,11
    1c2c:	12a6e763          	bltu	a3,a0,1d5a <strncpy+0x206>
    1c30:	16d5e663          	bltu	a1,a3,1d9c <strncpy+0x248>
    1c34:	14078c63          	beqz	a5,1d8c <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c38:	00070023          	sb	zero,0(a4)
    1c3c:	4585                	li	a1,1
    1c3e:	00170693          	addi	a3,a4,1
    1c42:	14b78363          	beq	a5,a1,1d88 <strncpy+0x234>
    1c46:	000700a3          	sb	zero,1(a4)
    1c4a:	4589                	li	a1,2
    1c4c:	00270693          	addi	a3,a4,2
    1c50:	14b78963          	beq	a5,a1,1da2 <strncpy+0x24e>
    1c54:	00070123          	sb	zero,2(a4)
    1c58:	458d                	li	a1,3
    1c5a:	00370693          	addi	a3,a4,3
    1c5e:	12b78363          	beq	a5,a1,1d84 <strncpy+0x230>
    1c62:	000701a3          	sb	zero,3(a4)
    1c66:	4591                	li	a1,4
    1c68:	00470693          	addi	a3,a4,4
    1c6c:	12b78d63          	beq	a5,a1,1da6 <strncpy+0x252>
    1c70:	00070223          	sb	zero,4(a4)
    1c74:	4595                	li	a1,5
    1c76:	00570693          	addi	a3,a4,5
    1c7a:	12b78863          	beq	a5,a1,1daa <strncpy+0x256>
    1c7e:	000702a3          	sb	zero,5(a4)
    1c82:	459d                	li	a1,7
    1c84:	00670693          	addi	a3,a4,6
    1c88:	12b79363          	bne	a5,a1,1dae <strncpy+0x25a>
    1c8c:	00770693          	addi	a3,a4,7
    1c90:	00070323          	sb	zero,6(a4)
    1c94:	40f80833          	sub	a6,a6,a5
    1c98:	ff887513          	andi	a0,a6,-8
    1c9c:	97ba                	add	a5,a5,a4
    1c9e:	953e                	add	a0,a0,a5
    1ca0:	0007b023          	sd	zero,0(a5)
    1ca4:	07a1                	addi	a5,a5,8
    1ca6:	fea79de3          	bne	a5,a0,1ca0 <strncpy+0x14c>
    1caa:	ff887513          	andi	a0,a6,-8
    1cae:	9da9                	addw	a1,a1,a0
    1cb0:	00a687b3          	add	a5,a3,a0
    1cb4:	f4a80de3          	beq	a6,a0,1c0e <strncpy+0xba>
    1cb8:	00078023          	sb	zero,0(a5)
    1cbc:	0015869b          	addiw	a3,a1,1
    1cc0:	f4c6f7e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1cc4:	000780a3          	sb	zero,1(a5)
    1cc8:	0025869b          	addiw	a3,a1,2
    1ccc:	f4c6f1e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1cd0:	00078123          	sb	zero,2(a5)
    1cd4:	0035869b          	addiw	a3,a1,3
    1cd8:	f2c6fbe3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1cdc:	000781a3          	sb	zero,3(a5)
    1ce0:	0045869b          	addiw	a3,a1,4
    1ce4:	f2c6f5e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1ce8:	00078223          	sb	zero,4(a5)
    1cec:	0055869b          	addiw	a3,a1,5
    1cf0:	f0c6ffe3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1cf4:	000782a3          	sb	zero,5(a5)
    1cf8:	0065869b          	addiw	a3,a1,6
    1cfc:	f0c6f9e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d00:	00078323          	sb	zero,6(a5)
    1d04:	0075869b          	addiw	a3,a1,7
    1d08:	f0c6f3e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d0c:	000783a3          	sb	zero,7(a5)
    1d10:	0085869b          	addiw	a3,a1,8
    1d14:	eec6fde3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d18:	00078423          	sb	zero,8(a5)
    1d1c:	0095869b          	addiw	a3,a1,9
    1d20:	eec6f7e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d24:	000784a3          	sb	zero,9(a5)
    1d28:	00a5869b          	addiw	a3,a1,10
    1d2c:	eec6f1e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d30:	00078523          	sb	zero,10(a5)
    1d34:	00b5869b          	addiw	a3,a1,11
    1d38:	ecc6fbe3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d3c:	000785a3          	sb	zero,11(a5)
    1d40:	00c5869b          	addiw	a3,a1,12
    1d44:	ecc6f5e3          	bleu	a2,a3,1c0e <strncpy+0xba>
    1d48:	00078623          	sb	zero,12(a5)
    1d4c:	25b5                	addiw	a1,a1,13
    1d4e:	ecc5f0e3          	bleu	a2,a1,1c0e <strncpy+0xba>
    1d52:	000786a3          	sb	zero,13(a5)
}
    1d56:	853a                	mv	a0,a4
    1d58:	8082                	ret
    1d5a:	46ad                	li	a3,11
    1d5c:	bdd1                	j	1c30 <strncpy+0xdc>
    1d5e:	00778693          	addi	a3,a5,7
    1d62:	452d                	li	a0,11
    1d64:	fff60593          	addi	a1,a2,-1
    1d68:	eca6f4e3          	bleu	a0,a3,1c30 <strncpy+0xdc>
    1d6c:	b7fd                	j	1d5a <strncpy+0x206>
    1d6e:	40e007b3          	neg	a5,a4
    1d72:	8832                	mv	a6,a2
    1d74:	8b9d                	andi	a5,a5,7
    1d76:	4581                	li	a1,0
    1d78:	ea0607e3          	beqz	a2,1c26 <strncpy+0xd2>
    1d7c:	b7cd                	j	1d5e <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d7e:	872a                	mv	a4,a0
}
    1d80:	853a                	mv	a0,a4
    1d82:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d84:	458d                	li	a1,3
    1d86:	b739                	j	1c94 <strncpy+0x140>
    1d88:	4585                	li	a1,1
    1d8a:	b729                	j	1c94 <strncpy+0x140>
    1d8c:	86ba                	mv	a3,a4
    1d8e:	4581                	li	a1,0
    1d90:	b711                	j	1c94 <strncpy+0x140>
    1d92:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d96:	872a                	mv	a4,a0
    1d98:	85b6                	mv	a1,a3
    1d9a:	bda9                	j	1bf4 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d9c:	87ba                	mv	a5,a4
    1d9e:	4581                	li	a1,0
    1da0:	bf21                	j	1cb8 <strncpy+0x164>
    1da2:	4589                	li	a1,2
    1da4:	bdc5                	j	1c94 <strncpy+0x140>
    1da6:	4591                	li	a1,4
    1da8:	b5f5                	j	1c94 <strncpy+0x140>
    1daa:	4595                	li	a1,5
    1dac:	b5e5                	j	1c94 <strncpy+0x140>
    1dae:	4599                	li	a1,6
    1db0:	b5d5                	j	1c94 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1db2:	00d50023          	sb	a3,0(a0)
    1db6:	872a                	mv	a4,a0
    1db8:	b5b9                	j	1c06 <strncpy+0xb2>

0000000000001dba <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1dba:	87aa                	mv	a5,a0
    1dbc:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1dbe:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1dc2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dc6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1dc8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dca:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <openat>:
    register long a7 __asm__("a7") = n;
    1dd2:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1dd6:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dda:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <close>:
    register long a7 __asm__("a7") = n;
    1de2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <read>:
    register long a7 __asm__("a7") = n;
    1dee:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1df6:	8082                	ret

0000000000001df8 <write>:
    register long a7 __asm__("a7") = n;
    1df8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e00:	8082                	ret

0000000000001e02 <getpid>:
    register long a7 __asm__("a7") = n;
    1e02:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e06:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <getppid>:
    register long a7 __asm__("a7") = n;
    1e0e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1e12:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e1a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e1e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <fork>:
    register long a7 __asm__("a7") = n;
    1e26:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1e2a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e36:	85b2                	mv	a1,a2
    1e38:	863a                	mv	a2,a4
    if (stack)
    1e3a:	c191                	beqz	a1,1e3e <clone+0x8>
	stack += stack_size;
    1e3c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e3e:	4781                	li	a5,0
    1e40:	4701                	li	a4,0
    1e42:	4681                	li	a3,0
    1e44:	2601                	sext.w	a2,a2
    1e46:	1ec0006f          	j	2032 <__clone>

0000000000001e4a <exit>:
    register long a7 __asm__("a7") = n;
    1e4a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e52:	8082                	ret

0000000000001e54 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e54:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e58:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e5a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <exec>:
    register long a7 __asm__("a7") = n;
    1e62:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <execve>:
    register long a7 __asm__("a7") = n;
    1e6e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e72:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <times>:
    register long a7 __asm__("a7") = n;
    1e7a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <get_time>:

int64 get_time()
{
    1e86:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e88:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e8c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e94:	2501                	sext.w	a0,a0
    1e96:	ed09                	bnez	a0,1eb0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e98:	67a2                	ld	a5,8(sp)
    1e9a:	3e800713          	li	a4,1000
    1e9e:	00015503          	lhu	a0,0(sp)
    1ea2:	02e7d7b3          	divu	a5,a5,a4
    1ea6:	02e50533          	mul	a0,a0,a4
    1eaa:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eac:	0141                	addi	sp,sp,16
    1eae:	8082                	ret
        return -1;
    1eb0:	557d                	li	a0,-1
    1eb2:	bfed                	j	1eac <get_time+0x26>

0000000000001eb4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1eb4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <time>:
    register long a7 __asm__("a7") = n;
    1ec0:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <sleep>:

int sleep(unsigned long long time)
{
    1ecc:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ece:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ed0:	850a                	mv	a0,sp
    1ed2:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ed4:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ed8:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ede:	e501                	bnez	a0,1ee6 <sleep+0x1a>
    return 0;
    1ee0:	4501                	li	a0,0
}
    1ee2:	0141                	addi	sp,sp,16
    1ee4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ee6:	4502                	lw	a0,0(sp)
}
    1ee8:	0141                	addi	sp,sp,16
    1eea:	8082                	ret

0000000000001eec <set_priority>:
    register long a7 __asm__("a7") = n;
    1eec:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ef0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ef8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1efc:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1f00:	8082                	ret

0000000000001f02 <munmap>:
    register long a7 __asm__("a7") = n;
    1f02:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f06:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <wait>:

int wait(int *code)
{
    1f0e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f10:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f14:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1f16:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1f18:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1f1a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <spawn>:
    register long a7 __asm__("a7") = n;
    1f22:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f26:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <mailread>:
    register long a7 __asm__("a7") = n;
    1f2e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f32:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f3a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <fstat>:
    register long a7 __asm__("a7") = n;
    1f46:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f52:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f54:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f58:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f5a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f62:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f64:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f68:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f6e:	2501                	sext.w	a0,a0
    1f70:	8082                	ret

0000000000001f72 <link>:

int link(char *old_path, char *new_path)
{
    1f72:	87aa                	mv	a5,a0
    1f74:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f76:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f7a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f7e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f80:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f84:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f86:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <unlink>:

int unlink(char *path)
{
    1f8e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f90:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f94:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f98:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <uname>:
    register long a7 __asm__("a7") = n;
    1fa2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1fa6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <brk>:
    register long a7 __asm__("a7") = n;
    1fae:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1fb2:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <getcwd>:
    register long a7 __asm__("a7") = n;
    1fba:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fbc:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1fc0:	8082                	ret

0000000000001fc2 <chdir>:
    register long a7 __asm__("a7") = n;
    1fc2:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1fc6:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fce:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1fd0:	02059613          	slli	a2,a1,0x20
    1fd4:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fd6:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fda:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fde:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fe0:	00000073          	ecall
}
    1fe4:	2501                	sext.w	a0,a0
    1fe6:	8082                	ret

0000000000001fe8 <getdents>:
    register long a7 __asm__("a7") = n;
    1fe8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fec:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ff0:	2501                	sext.w	a0,a0
    1ff2:	8082                	ret

0000000000001ff4 <pipe>:
    register long a7 __asm__("a7") = n;
    1ff4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ff8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ffa:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ffe:	2501                	sext.w	a0,a0
    2000:	8082                	ret

0000000000002002 <dup>:
    register long a7 __asm__("a7") = n;
    2002:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    2004:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    2008:	2501                	sext.w	a0,a0
    200a:	8082                	ret

000000000000200c <dup2>:
    register long a7 __asm__("a7") = n;
    200c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    200e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2010:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2014:	2501                	sext.w	a0,a0
    2016:	8082                	ret

0000000000002018 <mount>:
    register long a7 __asm__("a7") = n;
    2018:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    201c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    2020:	2501                	sext.w	a0,a0
    2022:	8082                	ret

0000000000002024 <umount>:
    register long a7 __asm__("a7") = n;
    2024:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2028:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    202a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    202e:	2501                	sext.w	a0,a0
    2030:	8082                	ret

0000000000002032 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2032:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2034:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2036:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2038:	8532                	mv	a0,a2
	mv a2, a4
    203a:	863a                	mv	a2,a4
	mv a3, a5
    203c:	86be                	mv	a3,a5
	mv a4, a6
    203e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2040:	0dc00893          	li	a7,220
	ecall
    2044:	00000073          	ecall

	beqz a0, 1f
    2048:	c111                	beqz	a0,204c <__clone+0x1a>
	# Parent
	ret
    204a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    204c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    204e:	6522                	ld	a0,8(sp)
	jalr a1
    2050:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2052:	05d00893          	li	a7,93
	ecall
    2056:	00000073          	ecall
