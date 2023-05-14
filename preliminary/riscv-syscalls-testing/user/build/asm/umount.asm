
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/umount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	11c0006f          	j	111e <__start_main>

0000000000001006 <test_umount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_umount() {
    1006:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	05050513          	addi	a0,a0,80 # 2058 <__clone+0x2a>
void test_umount() {
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1014:	30a000ef          	jal	ra,131e <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	19050513          	addi	a0,a0,400 # 21a8 <__func__.1214>
    1020:	2fe000ef          	jal	ra,131e <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	04c50513          	addi	a0,a0,76 # 2070 <__clone+0x42>
    102c:	2f2000ef          	jal	ra,131e <puts>

	printf("Mounting dev:%s to %s\n", device, mntpoint);
    1030:	00001617          	auipc	a2,0x1
    1034:	0f860613          	addi	a2,a2,248 # 2128 <mntpoint>
    1038:	00001597          	auipc	a1,0x1
    103c:	13058593          	addi	a1,a1,304 # 2168 <device>
    1040:	00001517          	auipc	a0,0x1
    1044:	04050513          	addi	a0,a0,64 # 2080 <__clone+0x52>
    1048:	2f8000ef          	jal	ra,1340 <printf>
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
    104c:	00001597          	auipc	a1,0x1
    1050:	0dc58593          	addi	a1,a1,220 # 2128 <mntpoint>
    1054:	4701                	li	a4,0
    1056:	4681                	li	a3,0
    1058:	00001617          	auipc	a2,0x1
    105c:	04060613          	addi	a2,a2,64 # 2098 <__clone+0x6a>
    1060:	00001517          	auipc	a0,0x1
    1064:	10850513          	addi	a0,a0,264 # 2168 <device>
    1068:	7ad000ef          	jal	ra,2014 <mount>
    106c:	842a                	mv	s0,a0
	printf("mount return: %d\n", ret);
    106e:	85aa                	mv	a1,a0
    1070:	00001517          	auipc	a0,0x1
    1074:	03050513          	addi	a0,a0,48 # 20a0 <__clone+0x72>
    1078:	2c8000ef          	jal	ra,1340 <printf>

	if (ret == 0) {
    107c:	c415                	beqz	s0,10a8 <test_umount+0xa2>
		ret = umount(mntpoint);
		assert(ret == 0);
		printf("umount success.\nreturn: %d\n", ret);
	}

	TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	07a50513          	addi	a0,a0,122 # 20f8 <__clone+0xca>
    1086:	298000ef          	jal	ra,131e <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	11e50513          	addi	a0,a0,286 # 21a8 <__func__.1214>
    1092:	28c000ef          	jal	ra,131e <puts>
}
    1096:	6442                	ld	s0,16(sp)
    1098:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	fd650513          	addi	a0,a0,-42 # 2070 <__clone+0x42>
}
    10a2:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    10a4:	27a0006f          	j	131e <puts>
		ret = umount(mntpoint);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	08050513          	addi	a0,a0,128 # 2128 <mntpoint>
    10b0:	771000ef          	jal	ra,2020 <umount>
    10b4:	85aa                	mv	a1,a0
		assert(ret == 0);
    10b6:	e901                	bnez	a0,10c6 <test_umount+0xc0>
		printf("umount success.\nreturn: %d\n", ret);
    10b8:	00001517          	auipc	a0,0x1
    10bc:	02050513          	addi	a0,a0,32 # 20d8 <__clone+0xaa>
    10c0:	280000ef          	jal	ra,1340 <printf>
    10c4:	bf6d                	j	107e <test_umount+0x78>
    10c6:	e42a                	sd	a0,8(sp)
		assert(ret == 0);
    10c8:	00001517          	auipc	a0,0x1
    10cc:	ff050513          	addi	a0,a0,-16 # 20b8 <__clone+0x8a>
    10d0:	514000ef          	jal	ra,15e4 <panic>
    10d4:	65a2                	ld	a1,8(sp)
    10d6:	b7cd                	j	10b8 <test_umount+0xb2>

00000000000010d8 <main>:

int main(int argc,char *argv[]) {
    10d8:	1101                	addi	sp,sp,-32
    10da:	ec06                	sd	ra,24(sp)
    10dc:	e822                	sd	s0,16(sp)
    10de:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    10e0:	4785                	li	a5,1
    10e2:	00a7ca63          	blt	a5,a0,10f6 <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_umount();
    10e6:	f21ff0ef          	jal	ra,1006 <test_umount>
	return 0;
}
    10ea:	60e2                	ld	ra,24(sp)
    10ec:	6442                	ld	s0,16(sp)
    10ee:	64a2                	ld	s1,8(sp)
    10f0:	4501                	li	a0,0
    10f2:	6105                	addi	sp,sp,32
    10f4:	8082                	ret
		strcpy(device, argv[1]);
    10f6:	84ae                	mv	s1,a1
    10f8:	658c                	ld	a1,8(a1)
    10fa:	842a                	mv	s0,a0
    10fc:	00001517          	auipc	a0,0x1
    1100:	06c50513          	addi	a0,a0,108 # 2168 <device>
    1104:	1cf000ef          	jal	ra,1ad2 <strcpy>
	if(argc >= 3){
    1108:	4789                	li	a5,2
    110a:	fcf40ee3          	beq	s0,a5,10e6 <main+0xe>
		strcpy(mntpoint, argv[2]);
    110e:	688c                	ld	a1,16(s1)
    1110:	00001517          	auipc	a0,0x1
    1114:	01850513          	addi	a0,a0,24 # 2128 <mntpoint>
    1118:	1bb000ef          	jal	ra,1ad2 <strcpy>
    111c:	b7e9                	j	10e6 <main+0xe>

000000000000111e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    111e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1120:	4108                	lw	a0,0(a0)
{
    1122:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1124:	05a1                	addi	a1,a1,8
{
    1126:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1128:	fb1ff0ef          	jal	ra,10d8 <main>
    112c:	51b000ef          	jal	ra,1e46 <exit>
	return 0;
}
    1130:	60a2                	ld	ra,8(sp)
    1132:	4501                	li	a0,0
    1134:	0141                	addi	sp,sp,16
    1136:	8082                	ret

0000000000001138 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1138:	7179                	addi	sp,sp,-48
    113a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    113c:	12054e63          	bltz	a0,1278 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1140:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1144:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1146:	02b7f6bb          	remuw	a3,a5,a1
    114a:	00001717          	auipc	a4,0x1
    114e:	06e70713          	addi	a4,a4,110 # 21b8 <digits>
    buf[16] = 0;
    1152:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1156:	1682                	slli	a3,a3,0x20
    1158:	9281                	srli	a3,a3,0x20
    115a:	96ba                	add	a3,a3,a4
    115c:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1160:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1164:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1168:	16b7e363          	bltu	a5,a1,12ce <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    116c:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1170:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1174:	1602                	slli	a2,a2,0x20
    1176:	9201                	srli	a2,a2,0x20
    1178:	963a                	add	a2,a2,a4
    117a:	00064603          	lbu	a2,0(a2)
    117e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1182:	0007861b          	sext.w	a2,a5
    1186:	12b6e863          	bltu	a3,a1,12b6 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    118a:	02b7f6bb          	remuw	a3,a5,a1
    118e:	1682                	slli	a3,a3,0x20
    1190:	9281                	srli	a3,a3,0x20
    1192:	96ba                	add	a3,a3,a4
    1194:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1198:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    119c:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    11a0:	10b66e63          	bltu	a2,a1,12bc <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    11a4:	02b876bb          	remuw	a3,a6,a1
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96ba                	add	a3,a3,a4
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11b6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11ba:	10b86463          	bltu	a6,a1,12c2 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    11be:	02b676bb          	remuw	a3,a2,a1
    11c2:	1682                	slli	a3,a3,0x20
    11c4:	9281                	srli	a3,a3,0x20
    11c6:	96ba                	add	a3,a3,a4
    11c8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11cc:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11d0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11d4:	0eb66a63          	bltu	a2,a1,12c8 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11d8:	02b876bb          	remuw	a3,a6,a1
    11dc:	1682                	slli	a3,a3,0x20
    11de:	9281                	srli	a3,a3,0x20
    11e0:	96ba                	add	a3,a3,a4
    11e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ea:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11ee:	0cb86163          	bltu	a6,a1,12b0 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11f2:	02b676bb          	remuw	a3,a2,a1
    11f6:	1682                	slli	a3,a3,0x20
    11f8:	9281                	srli	a3,a3,0x20
    11fa:	96ba                	add	a3,a3,a4
    11fc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1200:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1204:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1208:	0cb66563          	bltu	a2,a1,12d2 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    120c:	02b876bb          	remuw	a3,a6,a1
    1210:	1682                	slli	a3,a3,0x20
    1212:	9281                	srli	a3,a3,0x20
    1214:	96ba                	add	a3,a3,a4
    1216:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    121a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    121e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1222:	0ab86b63          	bltu	a6,a1,12d8 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1226:	02b676bb          	remuw	a3,a2,a1
    122a:	1682                	slli	a3,a3,0x20
    122c:	9281                	srli	a3,a3,0x20
    122e:	96ba                	add	a3,a3,a4
    1230:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1234:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1238:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    123c:	0ab66163          	bltu	a2,a1,12de <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1240:	1782                	slli	a5,a5,0x20
    1242:	9381                	srli	a5,a5,0x20
    1244:	97ba                	add	a5,a5,a4
    1246:	0007c703          	lbu	a4,0(a5)
    124a:	4599                	li	a1,6
    124c:	4795                	li	a5,5
    124e:	00e10723          	sb	a4,14(sp)

    if (sign)
    1252:	00055963          	bgez	a0,1264 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1256:	1018                	addi	a4,sp,32
    1258:	973e                	add	a4,a4,a5
    125a:	02d00693          	li	a3,45
    125e:	fed70423          	sb	a3,-24(a4)
    1262:	85be                	mv	a1,a5
    write(f, s, l);
    1264:	003c                	addi	a5,sp,8
    1266:	4641                	li	a2,16
    1268:	9e0d                	subw	a2,a2,a1
    126a:	4505                	li	a0,1
    126c:	95be                	add	a1,a1,a5
    126e:	387000ef          	jal	ra,1df4 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1272:	70a2                	ld	ra,40(sp)
    1274:	6145                	addi	sp,sp,48
    1276:	8082                	ret
        x = -xx;
    1278:	40a0063b          	negw	a2,a0
    127c:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    127e:	02b677bb          	remuw	a5,a2,a1
    1282:	00001717          	auipc	a4,0x1
    1286:	f3670713          	addi	a4,a4,-202 # 21b8 <digits>
    buf[16] = 0;
    128a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    128e:	1782                	slli	a5,a5,0x20
    1290:	9381                	srli	a5,a5,0x20
    1292:	97ba                	add	a5,a5,a4
    1294:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1298:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    129c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12a0:	ecb676e3          	bleu	a1,a2,116c <printint.constprop.0+0x34>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12ac:	45b9                	li	a1,14
    12ae:	bf5d                	j	1264 <printint.constprop.0+0x12c>
    12b0:	47a5                	li	a5,9
    12b2:	45a9                	li	a1,10
    12b4:	bf79                	j	1252 <printint.constprop.0+0x11a>
    12b6:	47b5                	li	a5,13
    12b8:	45b9                	li	a1,14
    12ba:	bf61                	j	1252 <printint.constprop.0+0x11a>
    12bc:	47b1                	li	a5,12
    12be:	45b5                	li	a1,13
    12c0:	bf49                	j	1252 <printint.constprop.0+0x11a>
    12c2:	47ad                	li	a5,11
    12c4:	45b1                	li	a1,12
    12c6:	b771                	j	1252 <printint.constprop.0+0x11a>
    12c8:	47a9                	li	a5,10
    12ca:	45ad                	li	a1,11
    12cc:	b759                	j	1252 <printint.constprop.0+0x11a>
    i = 15;
    12ce:	45bd                	li	a1,15
    12d0:	bf51                	j	1264 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12d2:	47a1                	li	a5,8
    12d4:	45a5                	li	a1,9
    12d6:	bfb5                	j	1252 <printint.constprop.0+0x11a>
    12d8:	479d                	li	a5,7
    12da:	45a1                	li	a1,8
    12dc:	bf9d                	j	1252 <printint.constprop.0+0x11a>
    12de:	4799                	li	a5,6
    12e0:	459d                	li	a1,7
    12e2:	bf85                	j	1252 <printint.constprop.0+0x11a>

00000000000012e4 <getchar>:
{
    12e4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12e6:	00f10593          	addi	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4501                	li	a0,0
{
    12ee:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f4:	2f7000ef          	jal	ra,1dea <read>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	00f14503          	lbu	a0,15(sp)
    12fe:	6105                	addi	sp,sp,32
    1300:	8082                	ret

0000000000001302 <putchar>:
{
    1302:	1101                	addi	sp,sp,-32
    char byte = c;
    1304:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1308:	00f10593          	addi	a1,sp,15
    130c:	4605                	li	a2,1
    130e:	4505                	li	a0,1
{
    1310:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1312:	2e3000ef          	jal	ra,1df4 <write>
}
    1316:	60e2                	ld	ra,24(sp)
    1318:	2501                	sext.w	a0,a0
    131a:	6105                	addi	sp,sp,32
    131c:	8082                	ret

000000000000131e <puts>:
{
    131e:	1141                	addi	sp,sp,-16
    1320:	e406                	sd	ra,8(sp)
    1322:	e022                	sd	s0,0(sp)
    1324:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1326:	5b2000ef          	jal	ra,18d8 <strlen>
    132a:	862a                	mv	a2,a0
    132c:	85a2                	mv	a1,s0
    132e:	4505                	li	a0,1
    1330:	2c5000ef          	jal	ra,1df4 <write>
}
    1334:	60a2                	ld	ra,8(sp)
    1336:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1338:	957d                	srai	a0,a0,0x3f
    return r;
    133a:	2501                	sext.w	a0,a0
}
    133c:	0141                	addi	sp,sp,16
    133e:	8082                	ret

0000000000001340 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1340:	7131                	addi	sp,sp,-192
    1342:	e0da                	sd	s6,64(sp)
    1344:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1346:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1348:	013c                	addi	a5,sp,136
{
    134a:	f0ca                	sd	s2,96(sp)
    134c:	ecce                	sd	s3,88(sp)
    134e:	e8d2                	sd	s4,80(sp)
    1350:	e4d6                	sd	s5,72(sp)
    1352:	fc5e                	sd	s7,56(sp)
    1354:	fc86                	sd	ra,120(sp)
    1356:	f8a2                	sd	s0,112(sp)
    1358:	f4a6                	sd	s1,104(sp)
    135a:	89aa                	mv	s3,a0
    135c:	e52e                	sd	a1,136(sp)
    135e:	e932                	sd	a2,144(sp)
    1360:	ed36                	sd	a3,152(sp)
    1362:	f13a                	sd	a4,160(sp)
    1364:	f942                	sd	a6,176(sp)
    1366:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1368:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    136a:	02500913          	li	s2,37
    136e:	07000a93          	li	s5,112
    buf[i++] = '0';
    1372:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1376:	00001a17          	auipc	s4,0x1
    137a:	e42a0a13          	addi	s4,s4,-446 # 21b8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    137e:	00001b97          	auipc	s7,0x1
    1382:	d8ab8b93          	addi	s7,s7,-630 # 2108 <__clone+0xda>
        if (!*s)
    1386:	0009c783          	lbu	a5,0(s3)
    138a:	cfb9                	beqz	a5,13e8 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    138c:	23278d63          	beq	a5,s2,15c6 <printf+0x286>
    1390:	864e                	mv	a2,s3
    1392:	a019                	j	1398 <printf+0x58>
    1394:	07278563          	beq	a5,s2,13fe <printf+0xbe>
    1398:	0605                	addi	a2,a2,1
    139a:	00064783          	lbu	a5,0(a2)
    139e:	fbfd                	bnez	a5,1394 <printf+0x54>
    13a0:	84b2                	mv	s1,a2
        l = z - a;
    13a2:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13a6:	8622                	mv	a2,s0
    13a8:	85ce                	mv	a1,s3
    13aa:	4505                	li	a0,1
    13ac:	249000ef          	jal	ra,1df4 <write>
        if (l)
    13b0:	ec3d                	bnez	s0,142e <printf+0xee>
        if (s[1] == 0)
    13b2:	0014c783          	lbu	a5,1(s1)
    13b6:	cb8d                	beqz	a5,13e8 <printf+0xa8>
        switch (s[1])
    13b8:	09578b63          	beq	a5,s5,144e <printf+0x10e>
    13bc:	06fafb63          	bleu	a5,s5,1432 <printf+0xf2>
    13c0:	07300713          	li	a4,115
    13c4:	1ce78e63          	beq	a5,a4,15a0 <printf+0x260>
    13c8:	07800713          	li	a4,120
    13cc:	1ae79563          	bne	a5,a4,1576 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13d0:	6782                	ld	a5,0(sp)
    13d2:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13d4:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13d8:	4388                	lw	a0,0(a5)
    13da:	07a1                	addi	a5,a5,8
    13dc:	e03e                	sd	a5,0(sp)
    13de:	d5bff0ef          	jal	ra,1138 <printint.constprop.0>
        if (!*s)
    13e2:	0009c783          	lbu	a5,0(s3)
    13e6:	f3dd                	bnez	a5,138c <printf+0x4c>
    }
    va_end(ap);
}
    13e8:	70e6                	ld	ra,120(sp)
    13ea:	7446                	ld	s0,112(sp)
    13ec:	74a6                	ld	s1,104(sp)
    13ee:	7906                	ld	s2,96(sp)
    13f0:	69e6                	ld	s3,88(sp)
    13f2:	6a46                	ld	s4,80(sp)
    13f4:	6aa6                	ld	s5,72(sp)
    13f6:	6b06                	ld	s6,64(sp)
    13f8:	7be2                	ld	s7,56(sp)
    13fa:	6129                	addi	sp,sp,192
    13fc:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13fe:	00164783          	lbu	a5,1(a2)
    1402:	84b2                	mv	s1,a2
    1404:	01278763          	beq	a5,s2,1412 <printf+0xd2>
    1408:	bf69                	j	13a2 <printf+0x62>
    140a:	0014c783          	lbu	a5,1(s1)
    140e:	f9279ae3          	bne	a5,s2,13a2 <printf+0x62>
    1412:	0489                	addi	s1,s1,2
    1414:	0004c783          	lbu	a5,0(s1)
    1418:	0605                	addi	a2,a2,1
    141a:	ff2788e3          	beq	a5,s2,140a <printf+0xca>
        l = z - a;
    141e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1422:	8622                	mv	a2,s0
    1424:	85ce                	mv	a1,s3
    1426:	4505                	li	a0,1
    1428:	1cd000ef          	jal	ra,1df4 <write>
        if (l)
    142c:	d059                	beqz	s0,13b2 <printf+0x72>
    142e:	89a6                	mv	s3,s1
    1430:	bf99                	j	1386 <printf+0x46>
    1432:	06400713          	li	a4,100
    1436:	14e79063          	bne	a5,a4,1576 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    143a:	6782                	ld	a5,0(sp)
    143c:	45a9                	li	a1,10
        s += 2;
    143e:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1442:	4388                	lw	a0,0(a5)
    1444:	07a1                	addi	a5,a5,8
    1446:	e03e                	sd	a5,0(sp)
    1448:	cf1ff0ef          	jal	ra,1138 <printint.constprop.0>
        s += 2;
    144c:	bf59                	j	13e2 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    144e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1450:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1454:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1456:	631c                	ld	a5,0(a4)
    1458:	0721                	addi	a4,a4,8
    145a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145c:	00479293          	slli	t0,a5,0x4
    1460:	00879f93          	slli	t6,a5,0x8
    1464:	00c79f13          	slli	t5,a5,0xc
    1468:	01079e93          	slli	t4,a5,0x10
    146c:	01479e13          	slli	t3,a5,0x14
    1470:	01879313          	slli	t1,a5,0x18
    1474:	01c79893          	slli	a7,a5,0x1c
    1478:	02479813          	slli	a6,a5,0x24
    147c:	02879513          	slli	a0,a5,0x28
    1480:	02c79593          	slli	a1,a5,0x2c
    1484:	03079693          	slli	a3,a5,0x30
    1488:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148c:	03c7d413          	srli	s0,a5,0x3c
    1490:	01c7d39b          	srliw	t2,a5,0x1c
    1494:	03c2d293          	srli	t0,t0,0x3c
    1498:	03cfdf93          	srli	t6,t6,0x3c
    149c:	03cf5f13          	srli	t5,t5,0x3c
    14a0:	03cede93          	srli	t4,t4,0x3c
    14a4:	03ce5e13          	srli	t3,t3,0x3c
    14a8:	03c35313          	srli	t1,t1,0x3c
    14ac:	03c8d893          	srli	a7,a7,0x3c
    14b0:	03c85813          	srli	a6,a6,0x3c
    14b4:	9171                	srli	a0,a0,0x3c
    14b6:	91f1                	srli	a1,a1,0x3c
    14b8:	92f1                	srli	a3,a3,0x3c
    14ba:	9371                	srli	a4,a4,0x3c
    14bc:	96d2                	add	a3,a3,s4
    14be:	9752                	add	a4,a4,s4
    14c0:	9452                	add	s0,s0,s4
    14c2:	92d2                	add	t0,t0,s4
    14c4:	9fd2                	add	t6,t6,s4
    14c6:	9f52                	add	t5,t5,s4
    14c8:	9ed2                	add	t4,t4,s4
    14ca:	9e52                	add	t3,t3,s4
    14cc:	9352                	add	t1,t1,s4
    14ce:	98d2                	add	a7,a7,s4
    14d0:	93d2                	add	t2,t2,s4
    14d2:	9852                	add	a6,a6,s4
    14d4:	9552                	add	a0,a0,s4
    14d6:	95d2                	add	a1,a1,s4
    14d8:	0006c983          	lbu	s3,0(a3)
    14dc:	0002c283          	lbu	t0,0(t0)
    14e0:	00074683          	lbu	a3,0(a4)
    14e4:	000fcf83          	lbu	t6,0(t6)
    14e8:	000f4f03          	lbu	t5,0(t5)
    14ec:	000ece83          	lbu	t4,0(t4)
    14f0:	000e4e03          	lbu	t3,0(t3)
    14f4:	00034303          	lbu	t1,0(t1)
    14f8:	0008c883          	lbu	a7,0(a7)
    14fc:	0003c383          	lbu	t2,0(t2)
    1500:	00084803          	lbu	a6,0(a6)
    1504:	00054503          	lbu	a0,0(a0)
    1508:	0005c583          	lbu	a1,0(a1)
    150c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1510:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1514:	9371                	srli	a4,a4,0x3c
    1516:	8bbd                	andi	a5,a5,15
    1518:	9752                	add	a4,a4,s4
    151a:	97d2                	add	a5,a5,s4
    151c:	005105a3          	sb	t0,11(sp)
    1520:	01f10623          	sb	t6,12(sp)
    1524:	01e106a3          	sb	t5,13(sp)
    1528:	01d10723          	sb	t4,14(sp)
    152c:	01c107a3          	sb	t3,15(sp)
    1530:	00610823          	sb	t1,16(sp)
    1534:	011108a3          	sb	a7,17(sp)
    1538:	00710923          	sb	t2,18(sp)
    153c:	010109a3          	sb	a6,19(sp)
    1540:	00a10a23          	sb	a0,20(sp)
    1544:	00b10aa3          	sb	a1,21(sp)
    1548:	01310b23          	sb	s3,22(sp)
    154c:	00d10ba3          	sb	a3,23(sp)
    1550:	00810523          	sb	s0,10(sp)
    1554:	00074703          	lbu	a4,0(a4)
    1558:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    155c:	002c                	addi	a1,sp,8
    155e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1560:	00e10c23          	sb	a4,24(sp)
    1564:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1568:	00010d23          	sb	zero,26(sp)
        s += 2;
    156c:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1570:	085000ef          	jal	ra,1df4 <write>
        s += 2;
    1574:	b5bd                	j	13e2 <printf+0xa2>
    char byte = c;
    1576:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    157a:	4605                	li	a2,1
    157c:	002c                	addi	a1,sp,8
    157e:	4505                	li	a0,1
    char byte = c;
    1580:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1584:	071000ef          	jal	ra,1df4 <write>
    char byte = c;
    1588:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158c:	4605                	li	a2,1
    158e:	002c                	addi	a1,sp,8
    1590:	4505                	li	a0,1
    char byte = c;
    1592:	00f10423          	sb	a5,8(sp)
        s += 2;
    1596:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    159a:	05b000ef          	jal	ra,1df4 <write>
        s += 2;
    159e:	b591                	j	13e2 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    15a0:	6782                	ld	a5,0(sp)
    15a2:	6380                	ld	s0,0(a5)
    15a4:	07a1                	addi	a5,a5,8
    15a6:	e03e                	sd	a5,0(sp)
    15a8:	cc05                	beqz	s0,15e0 <printf+0x2a0>
            l = strnlen(a, 200);
    15aa:	0c800593          	li	a1,200
    15ae:	8522                	mv	a0,s0
    15b0:	45a000ef          	jal	ra,1a0a <strnlen>
    write(f, s, l);
    15b4:	0005061b          	sext.w	a2,a0
    15b8:	85a2                	mv	a1,s0
    15ba:	4505                	li	a0,1
    15bc:	039000ef          	jal	ra,1df4 <write>
        s += 2;
    15c0:	00248993          	addi	s3,s1,2
    15c4:	bd39                	j	13e2 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15c6:	0019c783          	lbu	a5,1(s3)
    15ca:	84ce                	mv	s1,s3
    15cc:	864e                	mv	a2,s3
    15ce:	e52782e3          	beq	a5,s2,1412 <printf+0xd2>
    write(f, s, l);
    15d2:	4601                	li	a2,0
    15d4:	85ce                	mv	a1,s3
    15d6:	4505                	li	a0,1
    15d8:	01d000ef          	jal	ra,1df4 <write>
    15dc:	84ce                	mv	s1,s3
    15de:	bbd1                	j	13b2 <printf+0x72>
                a = "(null)";
    15e0:	845e                	mv	s0,s7
    15e2:	b7e1                	j	15aa <printf+0x26a>

00000000000015e4 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e4:	1141                	addi	sp,sp,-16
    15e6:	e406                	sd	ra,8(sp)
    puts(m);
    15e8:	d37ff0ef          	jal	ra,131e <puts>
    exit(-100);
}
    15ec:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ee:	f9c00513          	li	a0,-100
}
    15f2:	0141                	addi	sp,sp,16
    exit(-100);
    15f4:	0530006f          	j	1e46 <exit>

00000000000015f8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	02000793          	li	a5,32
    15fc:	00f50663          	beq	a0,a5,1608 <isspace+0x10>
    1600:	355d                	addiw	a0,a0,-9
    1602:	00553513          	sltiu	a0,a0,5
    1606:	8082                	ret
    1608:	4505                	li	a0,1
}
    160a:	8082                	ret

000000000000160c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    160c:	fd05051b          	addiw	a0,a0,-48
}
    1610:	00a53513          	sltiu	a0,a0,10
    1614:	8082                	ret

0000000000001616 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1616:	02000613          	li	a2,32
    161a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    161c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1620:	0007079b          	sext.w	a5,a4
    1624:	ff77869b          	addiw	a3,a5,-9
    1628:	04c70b63          	beq	a4,a2,167e <atoi+0x68>
    162c:	04d5f963          	bleu	a3,a1,167e <atoi+0x68>
        s++;
    switch (*s)
    1630:	02b00693          	li	a3,43
    1634:	04d70a63          	beq	a4,a3,1688 <atoi+0x72>
    1638:	02d00693          	li	a3,45
    163c:	06d70463          	beq	a4,a3,16a4 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1640:	fd07859b          	addiw	a1,a5,-48
    1644:	4625                	li	a2,9
    1646:	873e                	mv	a4,a5
    1648:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    164a:	4e01                	li	t3,0
    while (isdigit(*s))
    164c:	04b66a63          	bltu	a2,a1,16a0 <atoi+0x8a>
    int n = 0, neg = 0;
    1650:	4501                	li	a0,0
    while (isdigit(*s))
    1652:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1654:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1656:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    165a:	0025179b          	slliw	a5,a0,0x2
    165e:	9d3d                	addw	a0,a0,a5
    1660:	fd07031b          	addiw	t1,a4,-48
    1664:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1668:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    166c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1670:	0006071b          	sext.w	a4,a2
    1674:	feb870e3          	bleu	a1,a6,1654 <atoi+0x3e>
    return neg ? n : -n;
    1678:	000e0563          	beqz	t3,1682 <atoi+0x6c>
}
    167c:	8082                	ret
        s++;
    167e:	0505                	addi	a0,a0,1
    1680:	bf71                	j	161c <atoi+0x6>
    1682:	4113053b          	subw	a0,t1,a7
    1686:	8082                	ret
    while (isdigit(*s))
    1688:	00154783          	lbu	a5,1(a0)
    168c:	4625                	li	a2,9
        s++;
    168e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1692:	fd07859b          	addiw	a1,a5,-48
    1696:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    169a:	4e01                	li	t3,0
    while (isdigit(*s))
    169c:	fab67ae3          	bleu	a1,a2,1650 <atoi+0x3a>
    16a0:	4501                	li	a0,0
}
    16a2:	8082                	ret
    while (isdigit(*s))
    16a4:	00154783          	lbu	a5,1(a0)
    16a8:	4625                	li	a2,9
        s++;
    16aa:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16ae:	fd07859b          	addiw	a1,a5,-48
    16b2:	0007871b          	sext.w	a4,a5
    16b6:	feb665e3          	bltu	a2,a1,16a0 <atoi+0x8a>
        neg = 1;
    16ba:	4e05                	li	t3,1
    16bc:	bf51                	j	1650 <atoi+0x3a>

00000000000016be <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16be:	16060d63          	beqz	a2,1838 <memset+0x17a>
    16c2:	40a007b3          	neg	a5,a0
    16c6:	8b9d                	andi	a5,a5,7
    16c8:	00778713          	addi	a4,a5,7
    16cc:	482d                	li	a6,11
    16ce:	0ff5f593          	andi	a1,a1,255
    16d2:	fff60693          	addi	a3,a2,-1
    16d6:	17076263          	bltu	a4,a6,183a <memset+0x17c>
    16da:	16e6ea63          	bltu	a3,a4,184e <memset+0x190>
    16de:	16078563          	beqz	a5,1848 <memset+0x18a>
    16e2:	00b50023          	sb	a1,0(a0)
    16e6:	4705                	li	a4,1
    16e8:	00150e93          	addi	t4,a0,1
    16ec:	14e78c63          	beq	a5,a4,1844 <memset+0x186>
    16f0:	00b500a3          	sb	a1,1(a0)
    16f4:	4709                	li	a4,2
    16f6:	00250e93          	addi	t4,a0,2
    16fa:	14e78d63          	beq	a5,a4,1854 <memset+0x196>
    16fe:	00b50123          	sb	a1,2(a0)
    1702:	470d                	li	a4,3
    1704:	00350e93          	addi	t4,a0,3
    1708:	12e78b63          	beq	a5,a4,183e <memset+0x180>
    170c:	00b501a3          	sb	a1,3(a0)
    1710:	4711                	li	a4,4
    1712:	00450e93          	addi	t4,a0,4
    1716:	14e78163          	beq	a5,a4,1858 <memset+0x19a>
    171a:	00b50223          	sb	a1,4(a0)
    171e:	4715                	li	a4,5
    1720:	00550e93          	addi	t4,a0,5
    1724:	12e78c63          	beq	a5,a4,185c <memset+0x19e>
    1728:	00b502a3          	sb	a1,5(a0)
    172c:	471d                	li	a4,7
    172e:	00650e93          	addi	t4,a0,6
    1732:	12e79763          	bne	a5,a4,1860 <memset+0x1a2>
    1736:	00750e93          	addi	t4,a0,7
    173a:	00b50323          	sb	a1,6(a0)
    173e:	4f1d                	li	t5,7
    1740:	00859713          	slli	a4,a1,0x8
    1744:	8f4d                	or	a4,a4,a1
    1746:	01059e13          	slli	t3,a1,0x10
    174a:	01c76e33          	or	t3,a4,t3
    174e:	01859313          	slli	t1,a1,0x18
    1752:	006e6333          	or	t1,t3,t1
    1756:	02059893          	slli	a7,a1,0x20
    175a:	011368b3          	or	a7,t1,a7
    175e:	02859813          	slli	a6,a1,0x28
    1762:	40f60333          	sub	t1,a2,a5
    1766:	0108e833          	or	a6,a7,a6
    176a:	03059693          	slli	a3,a1,0x30
    176e:	00d866b3          	or	a3,a6,a3
    1772:	03859713          	slli	a4,a1,0x38
    1776:	97aa                	add	a5,a5,a0
    1778:	ff837813          	andi	a6,t1,-8
    177c:	8f55                	or	a4,a4,a3
    177e:	00f806b3          	add	a3,a6,a5
    1782:	e398                	sd	a4,0(a5)
    1784:	07a1                	addi	a5,a5,8
    1786:	fed79ee3          	bne	a5,a3,1782 <memset+0xc4>
    178a:	ff837693          	andi	a3,t1,-8
    178e:	00de87b3          	add	a5,t4,a3
    1792:	01e6873b          	addw	a4,a3,t5
    1796:	0ad30663          	beq	t1,a3,1842 <memset+0x184>
    179a:	00b78023          	sb	a1,0(a5)
    179e:	0017069b          	addiw	a3,a4,1
    17a2:	08c6fb63          	bleu	a2,a3,1838 <memset+0x17a>
    17a6:	00b780a3          	sb	a1,1(a5)
    17aa:	0027069b          	addiw	a3,a4,2
    17ae:	08c6f563          	bleu	a2,a3,1838 <memset+0x17a>
    17b2:	00b78123          	sb	a1,2(a5)
    17b6:	0037069b          	addiw	a3,a4,3
    17ba:	06c6ff63          	bleu	a2,a3,1838 <memset+0x17a>
    17be:	00b781a3          	sb	a1,3(a5)
    17c2:	0047069b          	addiw	a3,a4,4
    17c6:	06c6f963          	bleu	a2,a3,1838 <memset+0x17a>
    17ca:	00b78223          	sb	a1,4(a5)
    17ce:	0057069b          	addiw	a3,a4,5
    17d2:	06c6f363          	bleu	a2,a3,1838 <memset+0x17a>
    17d6:	00b782a3          	sb	a1,5(a5)
    17da:	0067069b          	addiw	a3,a4,6
    17de:	04c6fd63          	bleu	a2,a3,1838 <memset+0x17a>
    17e2:	00b78323          	sb	a1,6(a5)
    17e6:	0077069b          	addiw	a3,a4,7
    17ea:	04c6f763          	bleu	a2,a3,1838 <memset+0x17a>
    17ee:	00b783a3          	sb	a1,7(a5)
    17f2:	0087069b          	addiw	a3,a4,8
    17f6:	04c6f163          	bleu	a2,a3,1838 <memset+0x17a>
    17fa:	00b78423          	sb	a1,8(a5)
    17fe:	0097069b          	addiw	a3,a4,9
    1802:	02c6fb63          	bleu	a2,a3,1838 <memset+0x17a>
    1806:	00b784a3          	sb	a1,9(a5)
    180a:	00a7069b          	addiw	a3,a4,10
    180e:	02c6f563          	bleu	a2,a3,1838 <memset+0x17a>
    1812:	00b78523          	sb	a1,10(a5)
    1816:	00b7069b          	addiw	a3,a4,11
    181a:	00c6ff63          	bleu	a2,a3,1838 <memset+0x17a>
    181e:	00b785a3          	sb	a1,11(a5)
    1822:	00c7069b          	addiw	a3,a4,12
    1826:	00c6f963          	bleu	a2,a3,1838 <memset+0x17a>
    182a:	00b78623          	sb	a1,12(a5)
    182e:	2735                	addiw	a4,a4,13
    1830:	00c77463          	bleu	a2,a4,1838 <memset+0x17a>
    1834:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1838:	8082                	ret
    183a:	472d                	li	a4,11
    183c:	bd79                	j	16da <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    183e:	4f0d                	li	t5,3
    1840:	b701                	j	1740 <memset+0x82>
    1842:	8082                	ret
    1844:	4f05                	li	t5,1
    1846:	bded                	j	1740 <memset+0x82>
    1848:	8eaa                	mv	t4,a0
    184a:	4f01                	li	t5,0
    184c:	bdd5                	j	1740 <memset+0x82>
    184e:	87aa                	mv	a5,a0
    1850:	4701                	li	a4,0
    1852:	b7a1                	j	179a <memset+0xdc>
    1854:	4f09                	li	t5,2
    1856:	b5ed                	j	1740 <memset+0x82>
    1858:	4f11                	li	t5,4
    185a:	b5dd                	j	1740 <memset+0x82>
    185c:	4f15                	li	t5,5
    185e:	b5cd                	j	1740 <memset+0x82>
    1860:	4f19                	li	t5,6
    1862:	bdf9                	j	1740 <memset+0x82>

0000000000001864 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1864:	00054703          	lbu	a4,0(a0)
    1868:	0005c783          	lbu	a5,0(a1)
    186c:	00e79b63          	bne	a5,a4,1882 <strcmp+0x1e>
    1870:	cf89                	beqz	a5,188a <strcmp+0x26>
    1872:	0505                	addi	a0,a0,1
    1874:	0585                	addi	a1,a1,1
    1876:	0005c783          	lbu	a5,0(a1)
    187a:	00054703          	lbu	a4,0(a0)
    187e:	fef709e3          	beq	a4,a5,1870 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1882:	0007051b          	sext.w	a0,a4
}
    1886:	9d1d                	subw	a0,a0,a5
    1888:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    188a:	4501                	li	a0,0
}
    188c:	9d1d                	subw	a0,a0,a5
    188e:	8082                	ret

0000000000001890 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1890:	c231                	beqz	a2,18d4 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1892:	00054783          	lbu	a5,0(a0)
    1896:	0005c683          	lbu	a3,0(a1)
    189a:	c795                	beqz	a5,18c6 <strncmp+0x36>
    189c:	ca85                	beqz	a3,18cc <strncmp+0x3c>
    if (!n--)
    189e:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a0:	c615                	beqz	a2,18cc <strncmp+0x3c>
    18a2:	00150713          	addi	a4,a0,1
    18a6:	9532                	add	a0,a0,a2
    18a8:	00d78963          	beq	a5,a3,18ba <strncmp+0x2a>
    18ac:	a005                	j	18cc <strncmp+0x3c>
    18ae:	ce99                	beqz	a3,18cc <strncmp+0x3c>
    18b0:	00e50e63          	beq	a0,a4,18cc <strncmp+0x3c>
    18b4:	0705                	addi	a4,a4,1
    18b6:	00d79b63          	bne	a5,a3,18cc <strncmp+0x3c>
    18ba:	00074783          	lbu	a5,0(a4)
    18be:	0585                	addi	a1,a1,1
    18c0:	0005c683          	lbu	a3,0(a1)
    18c4:	f7ed                	bnez	a5,18ae <strncmp+0x1e>
    18c6:	4501                	li	a0,0
        ;
    return *l - *r;
    18c8:	9d15                	subw	a0,a0,a3
    18ca:	8082                	ret
    18cc:	0007851b          	sext.w	a0,a5
    18d0:	9d15                	subw	a0,a0,a3
    18d2:	8082                	ret
        return 0;
    18d4:	4501                	li	a0,0
}
    18d6:	8082                	ret

00000000000018d8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18d8:	00757793          	andi	a5,a0,7
    18dc:	cfa1                	beqz	a5,1934 <strlen+0x5c>
        if (!*s)
    18de:	00054783          	lbu	a5,0(a0)
    18e2:	cbb9                	beqz	a5,1938 <strlen+0x60>
    18e4:	87aa                	mv	a5,a0
    18e6:	a021                	j	18ee <strlen+0x16>
    18e8:	0007c703          	lbu	a4,0(a5)
    18ec:	c329                	beqz	a4,192e <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18ee:	0785                	addi	a5,a5,1
    18f0:	0077f713          	andi	a4,a5,7
    18f4:	fb75                	bnez	a4,18e8 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18f6:	00001717          	auipc	a4,0x1
    18fa:	81a70713          	addi	a4,a4,-2022 # 2110 <__clone+0xe2>
    18fe:	630c                	ld	a1,0(a4)
    1900:	00001717          	auipc	a4,0x1
    1904:	81870713          	addi	a4,a4,-2024 # 2118 <__clone+0xea>
    1908:	6394                	ld	a3,0(a5)
    190a:	6310                	ld	a2,0(a4)
    190c:	a019                	j	1912 <strlen+0x3a>
    190e:	07a1                	addi	a5,a5,8
    1910:	6394                	ld	a3,0(a5)
    1912:	00b68733          	add	a4,a3,a1
    1916:	fff6c693          	not	a3,a3
    191a:	8f75                	and	a4,a4,a3
    191c:	8f71                	and	a4,a4,a2
    191e:	db65                	beqz	a4,190e <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1920:	0007c703          	lbu	a4,0(a5)
    1924:	c709                	beqz	a4,192e <strlen+0x56>
    1926:	0785                	addi	a5,a5,1
    1928:	0007c703          	lbu	a4,0(a5)
    192c:	ff6d                	bnez	a4,1926 <strlen+0x4e>
        ;
    return s - a;
    192e:	40a78533          	sub	a0,a5,a0
}
    1932:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1934:	87aa                	mv	a5,a0
    1936:	b7c1                	j	18f6 <strlen+0x1e>
        if (!*s)
    1938:	4501                	li	a0,0
            return s - a;
    193a:	8082                	ret

000000000000193c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    193c:	00757793          	andi	a5,a0,7
    1940:	0ff5f593          	andi	a1,a1,255
    1944:	cb99                	beqz	a5,195a <memchr+0x1e>
    1946:	c655                	beqz	a2,19f2 <memchr+0xb6>
    1948:	00054783          	lbu	a5,0(a0)
    194c:	0ab78663          	beq	a5,a1,19f8 <memchr+0xbc>
    1950:	0505                	addi	a0,a0,1
    1952:	00757793          	andi	a5,a0,7
    1956:	167d                	addi	a2,a2,-1
    1958:	f7fd                	bnez	a5,1946 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    195a:	4701                	li	a4,0
    if (n && *s != c)
    195c:	ca49                	beqz	a2,19ee <memchr+0xb2>
    195e:	00054783          	lbu	a5,0(a0)
    1962:	08b78b63          	beq	a5,a1,19f8 <memchr+0xbc>
        size_t k = ONES * c;
    1966:	00000797          	auipc	a5,0x0
    196a:	7ba78793          	addi	a5,a5,1978 # 2120 <__clone+0xf2>
    196e:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1970:	479d                	li	a5,7
        size_t k = ONES * c;
    1972:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1976:	08c7f863          	bleu	a2,a5,1a06 <memchr+0xca>
    197a:	611c                	ld	a5,0(a0)
    197c:	00000317          	auipc	t1,0x0
    1980:	79c30313          	addi	t1,t1,1948 # 2118 <__clone+0xea>
    1984:	00033803          	ld	a6,0(t1)
    1988:	00f8c7b3          	xor	a5,a7,a5
    198c:	fff7c713          	not	a4,a5
    1990:	8f95                	sub	a5,a5,a3
    1992:	8ff9                	and	a5,a5,a4
    1994:	0107f7b3          	and	a5,a5,a6
    1998:	e7bd                	bnez	a5,1a06 <memchr+0xca>
    199a:	4e1d                	li	t3,7
    199c:	00000e97          	auipc	t4,0x0
    19a0:	774e8e93          	addi	t4,t4,1908 # 2110 <__clone+0xe2>
    19a4:	a005                	j	19c4 <memchr+0x88>
    19a6:	6514                	ld	a3,8(a0)
    19a8:	000eb783          	ld	a5,0(t4)
    19ac:	00033803          	ld	a6,0(t1)
    19b0:	00d8c6b3          	xor	a3,a7,a3
    19b4:	97b6                	add	a5,a5,a3
    19b6:	fff6c693          	not	a3,a3
    19ba:	8ff5                	and	a5,a5,a3
    19bc:	0107f7b3          	and	a5,a5,a6
    19c0:	e3a1                	bnez	a5,1a00 <memchr+0xc4>
    19c2:	853a                	mv	a0,a4
    19c4:	1661                	addi	a2,a2,-8
    19c6:	00850713          	addi	a4,a0,8
    19ca:	fcce6ee3          	bltu	t3,a2,19a6 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19ce:	c215                	beqz	a2,19f2 <memchr+0xb6>
    19d0:	00074783          	lbu	a5,0(a4)
    19d4:	00f58d63          	beq	a1,a5,19ee <memchr+0xb2>
    19d8:	00170793          	addi	a5,a4,1
    19dc:	963a                	add	a2,a2,a4
    19de:	873e                	mv	a4,a5
    19e0:	00f60963          	beq	a2,a5,19f2 <memchr+0xb6>
    19e4:	0007c683          	lbu	a3,0(a5)
    19e8:	0785                	addi	a5,a5,1
    19ea:	feb69ae3          	bne	a3,a1,19de <memchr+0xa2>
}
    19ee:	853a                	mv	a0,a4
    19f0:	8082                	ret
    return n ? (void *)s : 0;
    19f2:	4701                	li	a4,0
}
    19f4:	853a                	mv	a0,a4
    19f6:	8082                	ret
    19f8:	872a                	mv	a4,a0
    19fa:	00074783          	lbu	a5,0(a4)
    19fe:	bfd9                	j	19d4 <memchr+0x98>
    1a00:	00854783          	lbu	a5,8(a0)
    1a04:	bfc1                	j	19d4 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a06:	872a                	mv	a4,a0
    1a08:	bfc1                	j	19d8 <memchr+0x9c>

0000000000001a0a <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a0a:	00757793          	andi	a5,a0,7
    1a0e:	cfc5                	beqz	a5,1ac6 <strnlen+0xbc>
    1a10:	c1c5                	beqz	a1,1ab0 <strnlen+0xa6>
    1a12:	00054783          	lbu	a5,0(a0)
    1a16:	cfd9                	beqz	a5,1ab4 <strnlen+0xaa>
    1a18:	87ae                	mv	a5,a1
    1a1a:	86aa                	mv	a3,a0
    1a1c:	a029                	j	1a26 <strnlen+0x1c>
    1a1e:	cbc9                	beqz	a5,1ab0 <strnlen+0xa6>
    1a20:	0006c703          	lbu	a4,0(a3)
    1a24:	cb51                	beqz	a4,1ab8 <strnlen+0xae>
    1a26:	0685                	addi	a3,a3,1
    1a28:	0076f713          	andi	a4,a3,7
    1a2c:	17fd                	addi	a5,a5,-1
    1a2e:	fb65                	bnez	a4,1a1e <strnlen+0x14>
    if (n && *s != c)
    1a30:	c3c1                	beqz	a5,1ab0 <strnlen+0xa6>
    1a32:	0006c703          	lbu	a4,0(a3)
    1a36:	c349                	beqz	a4,1ab8 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a38:	471d                	li	a4,7
    1a3a:	08f77a63          	bleu	a5,a4,1ace <strnlen+0xc4>
    1a3e:	00000e17          	auipc	t3,0x0
    1a42:	6d2e0e13          	addi	t3,t3,1746 # 2110 <__clone+0xe2>
    1a46:	6290                	ld	a2,0(a3)
    1a48:	000e3703          	ld	a4,0(t3)
    1a4c:	00000e97          	auipc	t4,0x0
    1a50:	6cce8e93          	addi	t4,t4,1740 # 2118 <__clone+0xea>
    1a54:	000eb803          	ld	a6,0(t4)
    1a58:	9732                	add	a4,a4,a2
    1a5a:	fff64613          	not	a2,a2
    1a5e:	8f71                	and	a4,a4,a2
    1a60:	01077733          	and	a4,a4,a6
    1a64:	e72d                	bnez	a4,1ace <strnlen+0xc4>
    1a66:	4f1d                	li	t5,7
    1a68:	a839                	j	1a86 <strnlen+0x7c>
    1a6a:	6698                	ld	a4,8(a3)
    1a6c:	000e3303          	ld	t1,0(t3)
    1a70:	000eb803          	ld	a6,0(t4)
    1a74:	fff74893          	not	a7,a4
    1a78:	971a                	add	a4,a4,t1
    1a7a:	01177733          	and	a4,a4,a7
    1a7e:	01077733          	and	a4,a4,a6
    1a82:	ef1d                	bnez	a4,1ac0 <strnlen+0xb6>
    1a84:	86b2                	mv	a3,a2
    1a86:	17e1                	addi	a5,a5,-8
    1a88:	00868613          	addi	a2,a3,8
    1a8c:	fcff6fe3          	bltu	t5,a5,1a6a <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a90:	c385                	beqz	a5,1ab0 <strnlen+0xa6>
    1a92:	00064703          	lbu	a4,0(a2)
    1a96:	cb19                	beqz	a4,1aac <strnlen+0xa2>
    1a98:	00160713          	addi	a4,a2,1
    1a9c:	97b2                	add	a5,a5,a2
    1a9e:	863a                	mv	a2,a4
    1aa0:	00e78863          	beq	a5,a4,1ab0 <strnlen+0xa6>
    1aa4:	0705                	addi	a4,a4,1
    1aa6:	fff74683          	lbu	a3,-1(a4)
    1aaa:	faf5                	bnez	a3,1a9e <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1aac:	40a605b3          	sub	a1,a2,a0
}
    1ab0:	852e                	mv	a0,a1
    1ab2:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ab4:	87ae                	mv	a5,a1
    1ab6:	86aa                	mv	a3,a0
    if (n && *s != c)
    1ab8:	8636                	mv	a2,a3
    1aba:	00064703          	lbu	a4,0(a2)
    1abe:	bfe1                	j	1a96 <strnlen+0x8c>
    1ac0:	0086c703          	lbu	a4,8(a3)
    1ac4:	bfc9                	j	1a96 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ac6:	87ae                	mv	a5,a1
    1ac8:	86aa                	mv	a3,a0
    if (n && *s != c)
    1aca:	f7a5                	bnez	a5,1a32 <strnlen+0x28>
    1acc:	b7d5                	j	1ab0 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ace:	8636                	mv	a2,a3
    1ad0:	b7e1                	j	1a98 <strnlen+0x8e>

0000000000001ad2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ad2:	00b547b3          	xor	a5,a0,a1
    1ad6:	8b9d                	andi	a5,a5,7
    1ad8:	efa9                	bnez	a5,1b32 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ada:	0075f793          	andi	a5,a1,7
    1ade:	c38d                	beqz	a5,1b00 <strcpy+0x2e>
            if (!(*d = *s))
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	00f50023          	sb	a5,0(a0)
    1ae8:	e799                	bnez	a5,1af6 <strcpy+0x24>
    1aea:	a095                	j	1b4e <strcpy+0x7c>
    1aec:	0005c783          	lbu	a5,0(a1)
    1af0:	00f50023          	sb	a5,0(a0)
    1af4:	cbb9                	beqz	a5,1b4a <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1af6:	0585                	addi	a1,a1,1
    1af8:	0075f793          	andi	a5,a1,7
    1afc:	0505                	addi	a0,a0,1
    1afe:	f7fd                	bnez	a5,1aec <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b00:	00000797          	auipc	a5,0x0
    1b04:	61078793          	addi	a5,a5,1552 # 2110 <__clone+0xe2>
    1b08:	0007b803          	ld	a6,0(a5)
    1b0c:	00000797          	auipc	a5,0x0
    1b10:	60c78793          	addi	a5,a5,1548 # 2118 <__clone+0xea>
    1b14:	6198                	ld	a4,0(a1)
    1b16:	6390                	ld	a2,0(a5)
    1b18:	a031                	j	1b24 <strcpy+0x52>
    1b1a:	0521                	addi	a0,a0,8
    1b1c:	05a1                	addi	a1,a1,8
    1b1e:	fee53c23          	sd	a4,-8(a0)
    1b22:	6198                	ld	a4,0(a1)
    1b24:	010707b3          	add	a5,a4,a6
    1b28:	fff74693          	not	a3,a4
    1b2c:	8ff5                	and	a5,a5,a3
    1b2e:	8ff1                	and	a5,a5,a2
    1b30:	d7ed                	beqz	a5,1b1a <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b32:	0005c783          	lbu	a5,0(a1)
    1b36:	00f50023          	sb	a5,0(a0)
    1b3a:	cb89                	beqz	a5,1b4c <strcpy+0x7a>
    1b3c:	0585                	addi	a1,a1,1
    1b3e:	0005c783          	lbu	a5,0(a1)
    1b42:	0505                	addi	a0,a0,1
    1b44:	00f50023          	sb	a5,0(a0)
    1b48:	fbf5                	bnez	a5,1b3c <strcpy+0x6a>
        ;
    return d;
}
    1b4a:	8082                	ret
    1b4c:	8082                	ret
    1b4e:	8082                	ret

0000000000001b50 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b50:	00b547b3          	xor	a5,a0,a1
    1b54:	8b9d                	andi	a5,a5,7
    1b56:	ebc1                	bnez	a5,1be6 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b58:	0075f793          	andi	a5,a1,7
    1b5c:	cf91                	beqz	a5,1b78 <strncpy+0x28>
    1b5e:	20060e63          	beqz	a2,1d7a <strncpy+0x22a>
    1b62:	0005c783          	lbu	a5,0(a1)
    1b66:	00f50023          	sb	a5,0(a0)
    1b6a:	c3d5                	beqz	a5,1c0e <strncpy+0xbe>
    1b6c:	0585                	addi	a1,a1,1
    1b6e:	0075f793          	andi	a5,a1,7
    1b72:	167d                	addi	a2,a2,-1
    1b74:	0505                	addi	a0,a0,1
    1b76:	f7e5                	bnez	a5,1b5e <strncpy+0xe>
            ;
        if (!n || !*s)
    1b78:	20060163          	beqz	a2,1d7a <strncpy+0x22a>
    1b7c:	0005c683          	lbu	a3,0(a1)
    1b80:	c6d9                	beqz	a3,1c0e <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b82:	479d                	li	a5,7
    1b84:	22c7f563          	bleu	a2,a5,1dae <strncpy+0x25e>
    1b88:	00000317          	auipc	t1,0x0
    1b8c:	58830313          	addi	t1,t1,1416 # 2110 <__clone+0xe2>
    1b90:	6198                	ld	a4,0(a1)
    1b92:	00033783          	ld	a5,0(t1)
    1b96:	00000e17          	auipc	t3,0x0
    1b9a:	582e0e13          	addi	t3,t3,1410 # 2118 <__clone+0xea>
    1b9e:	000e3803          	ld	a6,0(t3)
    1ba2:	97ba                	add	a5,a5,a4
    1ba4:	fff74893          	not	a7,a4
    1ba8:	0117f7b3          	and	a5,a5,a7
    1bac:	0107f7b3          	and	a5,a5,a6
    1bb0:	1e079f63          	bnez	a5,1dae <strncpy+0x25e>
    1bb4:	4e9d                	li	t4,7
    1bb6:	a005                	j	1bd6 <strncpy+0x86>
    1bb8:	6598                	ld	a4,8(a1)
    1bba:	00033783          	ld	a5,0(t1)
    1bbe:	000e3803          	ld	a6,0(t3)
    1bc2:	fff74893          	not	a7,a4
    1bc6:	97ba                	add	a5,a5,a4
    1bc8:	0117f7b3          	and	a5,a5,a7
    1bcc:	0107f7b3          	and	a5,a5,a6
    1bd0:	1a079f63          	bnez	a5,1d8e <strncpy+0x23e>
    1bd4:	85b6                	mv	a1,a3
            *wd = *ws;
    1bd6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bd8:	1661                	addi	a2,a2,-8
    1bda:	00858693          	addi	a3,a1,8
    1bde:	0521                	addi	a0,a0,8
    1be0:	fcceece3          	bltu	t4,a2,1bb8 <strncpy+0x68>
    1be4:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1be6:	18060a63          	beqz	a2,1d7a <strncpy+0x22a>
    1bea:	0005c783          	lbu	a5,0(a1)
    1bee:	872a                	mv	a4,a0
    1bf0:	00f50023          	sb	a5,0(a0)
    1bf4:	e799                	bnez	a5,1c02 <strncpy+0xb2>
    1bf6:	a829                	j	1c10 <strncpy+0xc0>
    1bf8:	0005c783          	lbu	a5,0(a1)
    1bfc:	00f70023          	sb	a5,0(a4)
    1c00:	cb81                	beqz	a5,1c10 <strncpy+0xc0>
    1c02:	167d                	addi	a2,a2,-1
    1c04:	0585                	addi	a1,a1,1
    1c06:	0705                	addi	a4,a4,1
    1c08:	fa65                	bnez	a2,1bf8 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1c0a:	853a                	mv	a0,a4
    1c0c:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1c0e:	872a                	mv	a4,a0
    1c10:	4805                	li	a6,1
    1c12:	14061c63          	bnez	a2,1d6a <strncpy+0x21a>
    1c16:	40e007b3          	neg	a5,a4
    1c1a:	8b9d                	andi	a5,a5,7
    1c1c:	4581                	li	a1,0
    1c1e:	12061e63          	bnez	a2,1d5a <strncpy+0x20a>
    1c22:	00778693          	addi	a3,a5,7
    1c26:	452d                	li	a0,11
    1c28:	12a6e763          	bltu	a3,a0,1d56 <strncpy+0x206>
    1c2c:	16d5e663          	bltu	a1,a3,1d98 <strncpy+0x248>
    1c30:	14078c63          	beqz	a5,1d88 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c34:	00070023          	sb	zero,0(a4)
    1c38:	4585                	li	a1,1
    1c3a:	00170693          	addi	a3,a4,1
    1c3e:	14b78363          	beq	a5,a1,1d84 <strncpy+0x234>
    1c42:	000700a3          	sb	zero,1(a4)
    1c46:	4589                	li	a1,2
    1c48:	00270693          	addi	a3,a4,2
    1c4c:	14b78963          	beq	a5,a1,1d9e <strncpy+0x24e>
    1c50:	00070123          	sb	zero,2(a4)
    1c54:	458d                	li	a1,3
    1c56:	00370693          	addi	a3,a4,3
    1c5a:	12b78363          	beq	a5,a1,1d80 <strncpy+0x230>
    1c5e:	000701a3          	sb	zero,3(a4)
    1c62:	4591                	li	a1,4
    1c64:	00470693          	addi	a3,a4,4
    1c68:	12b78d63          	beq	a5,a1,1da2 <strncpy+0x252>
    1c6c:	00070223          	sb	zero,4(a4)
    1c70:	4595                	li	a1,5
    1c72:	00570693          	addi	a3,a4,5
    1c76:	12b78863          	beq	a5,a1,1da6 <strncpy+0x256>
    1c7a:	000702a3          	sb	zero,5(a4)
    1c7e:	459d                	li	a1,7
    1c80:	00670693          	addi	a3,a4,6
    1c84:	12b79363          	bne	a5,a1,1daa <strncpy+0x25a>
    1c88:	00770693          	addi	a3,a4,7
    1c8c:	00070323          	sb	zero,6(a4)
    1c90:	40f80833          	sub	a6,a6,a5
    1c94:	ff887513          	andi	a0,a6,-8
    1c98:	97ba                	add	a5,a5,a4
    1c9a:	953e                	add	a0,a0,a5
    1c9c:	0007b023          	sd	zero,0(a5)
    1ca0:	07a1                	addi	a5,a5,8
    1ca2:	fea79de3          	bne	a5,a0,1c9c <strncpy+0x14c>
    1ca6:	ff887513          	andi	a0,a6,-8
    1caa:	9da9                	addw	a1,a1,a0
    1cac:	00a687b3          	add	a5,a3,a0
    1cb0:	f4a80de3          	beq	a6,a0,1c0a <strncpy+0xba>
    1cb4:	00078023          	sb	zero,0(a5)
    1cb8:	0015869b          	addiw	a3,a1,1
    1cbc:	f4c6f7e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1cc0:	000780a3          	sb	zero,1(a5)
    1cc4:	0025869b          	addiw	a3,a1,2
    1cc8:	f4c6f1e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1ccc:	00078123          	sb	zero,2(a5)
    1cd0:	0035869b          	addiw	a3,a1,3
    1cd4:	f2c6fbe3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1cd8:	000781a3          	sb	zero,3(a5)
    1cdc:	0045869b          	addiw	a3,a1,4
    1ce0:	f2c6f5e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1ce4:	00078223          	sb	zero,4(a5)
    1ce8:	0055869b          	addiw	a3,a1,5
    1cec:	f0c6ffe3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1cf0:	000782a3          	sb	zero,5(a5)
    1cf4:	0065869b          	addiw	a3,a1,6
    1cf8:	f0c6f9e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1cfc:	00078323          	sb	zero,6(a5)
    1d00:	0075869b          	addiw	a3,a1,7
    1d04:	f0c6f3e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d08:	000783a3          	sb	zero,7(a5)
    1d0c:	0085869b          	addiw	a3,a1,8
    1d10:	eec6fde3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d14:	00078423          	sb	zero,8(a5)
    1d18:	0095869b          	addiw	a3,a1,9
    1d1c:	eec6f7e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d20:	000784a3          	sb	zero,9(a5)
    1d24:	00a5869b          	addiw	a3,a1,10
    1d28:	eec6f1e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d2c:	00078523          	sb	zero,10(a5)
    1d30:	00b5869b          	addiw	a3,a1,11
    1d34:	ecc6fbe3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d38:	000785a3          	sb	zero,11(a5)
    1d3c:	00c5869b          	addiw	a3,a1,12
    1d40:	ecc6f5e3          	bleu	a2,a3,1c0a <strncpy+0xba>
    1d44:	00078623          	sb	zero,12(a5)
    1d48:	25b5                	addiw	a1,a1,13
    1d4a:	ecc5f0e3          	bleu	a2,a1,1c0a <strncpy+0xba>
    1d4e:	000786a3          	sb	zero,13(a5)
}
    1d52:	853a                	mv	a0,a4
    1d54:	8082                	ret
    1d56:	46ad                	li	a3,11
    1d58:	bdd1                	j	1c2c <strncpy+0xdc>
    1d5a:	00778693          	addi	a3,a5,7
    1d5e:	452d                	li	a0,11
    1d60:	fff60593          	addi	a1,a2,-1
    1d64:	eca6f4e3          	bleu	a0,a3,1c2c <strncpy+0xdc>
    1d68:	b7fd                	j	1d56 <strncpy+0x206>
    1d6a:	40e007b3          	neg	a5,a4
    1d6e:	8832                	mv	a6,a2
    1d70:	8b9d                	andi	a5,a5,7
    1d72:	4581                	li	a1,0
    1d74:	ea0607e3          	beqz	a2,1c22 <strncpy+0xd2>
    1d78:	b7cd                	j	1d5a <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d7a:	872a                	mv	a4,a0
}
    1d7c:	853a                	mv	a0,a4
    1d7e:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d80:	458d                	li	a1,3
    1d82:	b739                	j	1c90 <strncpy+0x140>
    1d84:	4585                	li	a1,1
    1d86:	b729                	j	1c90 <strncpy+0x140>
    1d88:	86ba                	mv	a3,a4
    1d8a:	4581                	li	a1,0
    1d8c:	b711                	j	1c90 <strncpy+0x140>
    1d8e:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d92:	872a                	mv	a4,a0
    1d94:	85b6                	mv	a1,a3
    1d96:	bda9                	j	1bf0 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d98:	87ba                	mv	a5,a4
    1d9a:	4581                	li	a1,0
    1d9c:	bf21                	j	1cb4 <strncpy+0x164>
    1d9e:	4589                	li	a1,2
    1da0:	bdc5                	j	1c90 <strncpy+0x140>
    1da2:	4591                	li	a1,4
    1da4:	b5f5                	j	1c90 <strncpy+0x140>
    1da6:	4595                	li	a1,5
    1da8:	b5e5                	j	1c90 <strncpy+0x140>
    1daa:	4599                	li	a1,6
    1dac:	b5d5                	j	1c90 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1dae:	00d50023          	sb	a3,0(a0)
    1db2:	872a                	mv	a4,a0
    1db4:	b5b9                	j	1c02 <strncpy+0xb2>

0000000000001db6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1db6:	87aa                	mv	a5,a0
    1db8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1dba:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1dbe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dc2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1dc4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <openat>:
    register long a7 __asm__("a7") = n;
    1dce:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1dd2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <close>:
    register long a7 __asm__("a7") = n;
    1dde:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <read>:
    register long a7 __asm__("a7") = n;
    1dea:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dee:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1df2:	8082                	ret

0000000000001df4 <write>:
    register long a7 __asm__("a7") = n;
    1df4:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dfc:	8082                	ret

0000000000001dfe <getpid>:
    register long a7 __asm__("a7") = n;
    1dfe:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e02:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <getppid>:
    register long a7 __asm__("a7") = n;
    1e0a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1e0e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e16:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e1a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <fork>:
    register long a7 __asm__("a7") = n;
    1e22:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1e26:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e28:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e32:	85b2                	mv	a1,a2
    1e34:	863a                	mv	a2,a4
    if (stack)
    1e36:	c191                	beqz	a1,1e3a <clone+0x8>
	stack += stack_size;
    1e38:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e3a:	4781                	li	a5,0
    1e3c:	4701                	li	a4,0
    1e3e:	4681                	li	a3,0
    1e40:	2601                	sext.w	a2,a2
    1e42:	1ec0006f          	j	202e <__clone>

0000000000001e46 <exit>:
    register long a7 __asm__("a7") = n;
    1e46:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e4a:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e4e:	8082                	ret

0000000000001e50 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e50:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e54:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e56:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <exec>:
    register long a7 __asm__("a7") = n;
    1e5e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <execve>:
    register long a7 __asm__("a7") = n;
    1e6a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <times>:
    register long a7 __asm__("a7") = n;
    1e76:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <get_time>:

int64 get_time()
{
    1e82:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e84:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e88:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e90:	2501                	sext.w	a0,a0
    1e92:	ed09                	bnez	a0,1eac <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e94:	67a2                	ld	a5,8(sp)
    1e96:	3e800713          	li	a4,1000
    1e9a:	00015503          	lhu	a0,0(sp)
    1e9e:	02e7d7b3          	divu	a5,a5,a4
    1ea2:	02e50533          	mul	a0,a0,a4
    1ea6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ea8:	0141                	addi	sp,sp,16
    1eaa:	8082                	ret
        return -1;
    1eac:	557d                	li	a0,-1
    1eae:	bfed                	j	1ea8 <get_time+0x26>

0000000000001eb0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1eb0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <time>:
    register long a7 __asm__("a7") = n;
    1ebc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ec0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <sleep>:

int sleep(unsigned long long time)
{
    1ec8:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1eca:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ecc:	850a                	mv	a0,sp
    1ece:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ed0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ed4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eda:	e501                	bnez	a0,1ee2 <sleep+0x1a>
    return 0;
    1edc:	4501                	li	a0,0
}
    1ede:	0141                	addi	sp,sp,16
    1ee0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ee2:	4502                	lw	a0,0(sp)
}
    1ee4:	0141                	addi	sp,sp,16
    1ee6:	8082                	ret

0000000000001ee8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ee8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eec:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ef4:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ef8:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1efc:	8082                	ret

0000000000001efe <munmap>:
    register long a7 __asm__("a7") = n;
    1efe:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f02:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1f06:	2501                	sext.w	a0,a0
    1f08:	8082                	ret

0000000000001f0a <wait>:

int wait(int *code)
{
    1f0a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f0c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f10:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1f12:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1f14:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1f16:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <spawn>:
    register long a7 __asm__("a7") = n;
    1f1e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f22:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <mailread>:
    register long a7 __asm__("a7") = n;
    1f2a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f36:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <fstat>:
    register long a7 __asm__("a7") = n;
    1f42:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f46:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f4e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f50:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f54:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f56:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f5e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f60:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f64:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f66:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f6a:	2501                	sext.w	a0,a0
    1f6c:	8082                	ret

0000000000001f6e <link>:

int link(char *old_path, char *new_path)
{
    1f6e:	87aa                	mv	a5,a0
    1f70:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f72:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f7c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f80:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f82:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <unlink>:

int unlink(char *path)
{
    1f8a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f8c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f90:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f94:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f96:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <uname>:
    register long a7 __asm__("a7") = n;
    1f9e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1fa2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <brk>:
    register long a7 __asm__("a7") = n;
    1faa:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1fae:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1fb6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1fbc:	8082                	ret

0000000000001fbe <chdir>:
    register long a7 __asm__("a7") = n;
    1fbe:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1fc2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1fc6:	2501                	sext.w	a0,a0
    1fc8:	8082                	ret

0000000000001fca <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fca:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1fcc:	02059613          	slli	a2,a1,0x20
    1fd0:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fd2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fd6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fda:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fdc:	00000073          	ecall
}
    1fe0:	2501                	sext.w	a0,a0
    1fe2:	8082                	ret

0000000000001fe4 <getdents>:
    register long a7 __asm__("a7") = n;
    1fe4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fe8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fec:	2501                	sext.w	a0,a0
    1fee:	8082                	ret

0000000000001ff0 <pipe>:
    register long a7 __asm__("a7") = n;
    1ff0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ff4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ff6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ffa:	2501                	sext.w	a0,a0
    1ffc:	8082                	ret

0000000000001ffe <dup>:
    register long a7 __asm__("a7") = n;
    1ffe:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    2000:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    2004:	2501                	sext.w	a0,a0
    2006:	8082                	ret

0000000000002008 <dup2>:
    register long a7 __asm__("a7") = n;
    2008:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    200a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    200c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2010:	2501                	sext.w	a0,a0
    2012:	8082                	ret

0000000000002014 <mount>:
    register long a7 __asm__("a7") = n;
    2014:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2018:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    201c:	2501                	sext.w	a0,a0
    201e:	8082                	ret

0000000000002020 <umount>:
    register long a7 __asm__("a7") = n;
    2020:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2024:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2026:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    202a:	2501                	sext.w	a0,a0
    202c:	8082                	ret

000000000000202e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    202e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2030:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2032:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2034:	8532                	mv	a0,a2
	mv a2, a4
    2036:	863a                	mv	a2,a4
	mv a3, a5
    2038:	86be                	mv	a3,a5
	mv a4, a6
    203a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    203c:	0dc00893          	li	a7,220
	ecall
    2040:	00000073          	ecall

	beqz a0, 1f
    2044:	c111                	beqz	a0,2048 <__clone+0x1a>
	# Parent
	ret
    2046:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2048:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    204a:	6522                	ld	a0,8(sp)
	jalr a1
    204c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    204e:	05d00893          	li	a7,93
	ecall
    2052:	00000073          	ecall
