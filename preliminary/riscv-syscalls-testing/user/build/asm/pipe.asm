
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/pipe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	12e0006f          	j	1130 <__start_main>

0000000000001006 <test_pipe>:
 * 成功测试时的输出：
 * "  Write to pipe successfully."
 */
static int fd[2];

void test_pipe(void){
    1006:	7135                	addi	sp,sp,-160
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	06050513          	addi	a0,a0,96 # 2068 <__clone+0x28>
void test_pipe(void){
    1010:	ed06                	sd	ra,152(sp)
    1012:	e922                	sd	s0,144(sp)
    1014:	e526                	sd	s1,136(sp)
    TEST_START(__func__);
    1016:	31a000ef          	jal	ra,1330 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	0fe50513          	addi	a0,a0,254 # 2118 <__func__.1213>
    1022:	30e000ef          	jal	ra,1330 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	05a50513          	addi	a0,a0,90 # 2080 <__clone+0x40>
    102e:	302000ef          	jal	ra,1330 <puts>
    int cpid;
    char buf[128] = {0};
    1032:	08000613          	li	a2,128
    1036:	4581                	li	a1,0
    1038:	850a                	mv	a0,sp
    103a:	696000ef          	jal	ra,16d0 <memset>
    int ret = pipe(fd);
    103e:	00001517          	auipc	a0,0x1
    1042:	0d250513          	addi	a0,a0,210 # 2110 <fd>
    1046:	7bd000ef          	jal	ra,2002 <pipe>
    assert(ret != -1);
    104a:	57fd                	li	a5,-1
    104c:	0cf50363          	beq	a0,a5,1112 <test_pipe+0x10c>
    const char *data = "  Write to pipe successfully.\n";
    cpid = fork();
    1050:	5e5000ef          	jal	ra,1e34 <fork>
    1054:	842a                	mv	s0,a0
    printf("cpid: %d\n", cpid);
    1056:	85aa                	mv	a1,a0
    1058:	00001517          	auipc	a0,0x1
    105c:	05850513          	addi	a0,a0,88 # 20b0 <__clone+0x70>
    1060:	2f2000ef          	jal	ra,1352 <printf>
    if(cpid > 0){
    1064:	06805a63          	blez	s0,10d8 <test_pipe+0xd2>
	close(fd[1]);
    1068:	00001417          	auipc	s0,0x1
    106c:	0a840413          	addi	s0,s0,168 # 2110 <fd>
    1070:	4048                	lw	a0,4(s0)
    1072:	57f000ef          	jal	ra,1df0 <close>
	while(read(fd[0], buf, 1) > 0)
    1076:	a021                	j	107e <test_pipe+0x78>
            write(STDOUT, buf, 1);
    1078:	4505                	li	a0,1
    107a:	58d000ef          	jal	ra,1e06 <write>
	while(read(fd[0], buf, 1) > 0)
    107e:	4008                	lw	a0,0(s0)
    1080:	4605                	li	a2,1
    1082:	858a                	mv	a1,sp
    1084:	579000ef          	jal	ra,1dfc <read>
            write(STDOUT, buf, 1);
    1088:	4605                	li	a2,1
    108a:	858a                	mv	a1,sp
	while(read(fd[0], buf, 1) > 0)
    108c:	fea046e3          	bgtz	a0,1078 <test_pipe+0x72>
	write(STDOUT, "\n", 1);
    1090:	00001597          	auipc	a1,0x1
    1094:	01858593          	addi	a1,a1,24 # 20a8 <__clone+0x68>
    1098:	4505                	li	a0,1
    109a:	56d000ef          	jal	ra,1e06 <write>
	close(fd[0]);
    109e:	4008                	lw	a0,0(s0)
    10a0:	551000ef          	jal	ra,1df0 <close>
	wait(NULL);
    10a4:	4501                	li	a0,0
    10a6:	677000ef          	jal	ra,1f1c <wait>
	close(fd[0]);
	write(fd[1], data, strlen(data));
	close(fd[1]);
	exit(0);
    }
    TEST_END(__func__);
    10aa:	00001517          	auipc	a0,0x1
    10ae:	03650513          	addi	a0,a0,54 # 20e0 <__clone+0xa0>
    10b2:	27e000ef          	jal	ra,1330 <puts>
    10b6:	00001517          	auipc	a0,0x1
    10ba:	06250513          	addi	a0,a0,98 # 2118 <__func__.1213>
    10be:	272000ef          	jal	ra,1330 <puts>
    10c2:	00001517          	auipc	a0,0x1
    10c6:	fbe50513          	addi	a0,a0,-66 # 2080 <__clone+0x40>
    10ca:	266000ef          	jal	ra,1330 <puts>
}
    10ce:	60ea                	ld	ra,152(sp)
    10d0:	644a                	ld	s0,144(sp)
    10d2:	64aa                	ld	s1,136(sp)
    10d4:	610d                	addi	sp,sp,160
    10d6:	8082                	ret
	close(fd[0]);
    10d8:	00001417          	auipc	s0,0x1
    10dc:	03840413          	addi	s0,s0,56 # 2110 <fd>
    10e0:	4008                	lw	a0,0(s0)
    10e2:	50f000ef          	jal	ra,1df0 <close>
	write(fd[1], data, strlen(data));
    10e6:	4044                	lw	s1,4(s0)
    10e8:	00001517          	auipc	a0,0x1
    10ec:	fd850513          	addi	a0,a0,-40 # 20c0 <__clone+0x80>
    10f0:	7fa000ef          	jal	ra,18ea <strlen>
    10f4:	862a                	mv	a2,a0
    10f6:	00001597          	auipc	a1,0x1
    10fa:	fca58593          	addi	a1,a1,-54 # 20c0 <__clone+0x80>
    10fe:	8526                	mv	a0,s1
    1100:	507000ef          	jal	ra,1e06 <write>
	close(fd[1]);
    1104:	4048                	lw	a0,4(s0)
    1106:	4eb000ef          	jal	ra,1df0 <close>
	exit(0);
    110a:	4501                	li	a0,0
    110c:	54d000ef          	jal	ra,1e58 <exit>
    1110:	bf69                	j	10aa <test_pipe+0xa4>
    assert(ret != -1);
    1112:	00001517          	auipc	a0,0x1
    1116:	f7e50513          	addi	a0,a0,-130 # 2090 <__clone+0x50>
    111a:	4dc000ef          	jal	ra,15f6 <panic>
    111e:	bf0d                	j	1050 <test_pipe+0x4a>

0000000000001120 <main>:

int main(void){
    1120:	1141                	addi	sp,sp,-16
    1122:	e406                	sd	ra,8(sp)
    test_pipe();
    1124:	ee3ff0ef          	jal	ra,1006 <test_pipe>
    return 0;
}
    1128:	60a2                	ld	ra,8(sp)
    112a:	4501                	li	a0,0
    112c:	0141                	addi	sp,sp,16
    112e:	8082                	ret

0000000000001130 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1130:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1132:	4108                	lw	a0,0(a0)
{
    1134:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1136:	05a1                	addi	a1,a1,8
{
    1138:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    113a:	fe7ff0ef          	jal	ra,1120 <main>
    113e:	51b000ef          	jal	ra,1e58 <exit>
	return 0;
}
    1142:	60a2                	ld	ra,8(sp)
    1144:	4501                	li	a0,0
    1146:	0141                	addi	sp,sp,16
    1148:	8082                	ret

000000000000114a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    114a:	7179                	addi	sp,sp,-48
    114c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    114e:	12054e63          	bltz	a0,128a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1152:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1156:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1158:	02b7f6bb          	remuw	a3,a5,a1
    115c:	00001717          	auipc	a4,0x1
    1160:	fcc70713          	addi	a4,a4,-52 # 2128 <digits>
    buf[16] = 0;
    1164:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1168:	1682                	slli	a3,a3,0x20
    116a:	9281                	srli	a3,a3,0x20
    116c:	96ba                	add	a3,a3,a4
    116e:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1172:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1176:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    117a:	16b7e363          	bltu	a5,a1,12e0 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    117e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1182:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	963a                	add	a2,a2,a4
    118c:	00064603          	lbu	a2,0(a2)
    1190:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1194:	0007861b          	sext.w	a2,a5
    1198:	12b6e863          	bltu	a3,a1,12c8 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    119c:	02b7f6bb          	remuw	a3,a5,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    11ae:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    11b2:	10b66e63          	bltu	a2,a1,12ce <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    11b6:	02b876bb          	remuw	a3,a6,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c8:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    11cc:	10b86463          	bltu	a6,a1,12d4 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    11d0:	02b676bb          	remuw	a3,a2,a1
    11d4:	1682                	slli	a3,a3,0x20
    11d6:	9281                	srli	a3,a3,0x20
    11d8:	96ba                	add	a3,a3,a4
    11da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11de:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11e2:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11e6:	0eb66a63          	bltu	a2,a1,12da <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11ea:	02b876bb          	remuw	a3,a6,a1
    11ee:	1682                	slli	a3,a3,0x20
    11f0:	9281                	srli	a3,a3,0x20
    11f2:	96ba                	add	a3,a3,a4
    11f4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f8:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11fc:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1200:	0cb86163          	bltu	a6,a1,12c2 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1204:	02b676bb          	remuw	a3,a2,a1
    1208:	1682                	slli	a3,a3,0x20
    120a:	9281                	srli	a3,a3,0x20
    120c:	96ba                	add	a3,a3,a4
    120e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1212:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1216:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    121a:	0cb66563          	bltu	a2,a1,12e4 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    121e:	02b876bb          	remuw	a3,a6,a1
    1222:	1682                	slli	a3,a3,0x20
    1224:	9281                	srli	a3,a3,0x20
    1226:	96ba                	add	a3,a3,a4
    1228:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    122c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1230:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1234:	0ab86b63          	bltu	a6,a1,12ea <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1238:	02b676bb          	remuw	a3,a2,a1
    123c:	1682                	slli	a3,a3,0x20
    123e:	9281                	srli	a3,a3,0x20
    1240:	96ba                	add	a3,a3,a4
    1242:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1246:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    124a:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    124e:	0ab66163          	bltu	a2,a1,12f0 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1252:	1782                	slli	a5,a5,0x20
    1254:	9381                	srli	a5,a5,0x20
    1256:	97ba                	add	a5,a5,a4
    1258:	0007c703          	lbu	a4,0(a5)
    125c:	4599                	li	a1,6
    125e:	4795                	li	a5,5
    1260:	00e10723          	sb	a4,14(sp)

    if (sign)
    1264:	00055963          	bgez	a0,1276 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1268:	1018                	addi	a4,sp,32
    126a:	973e                	add	a4,a4,a5
    126c:	02d00693          	li	a3,45
    1270:	fed70423          	sb	a3,-24(a4)
    1274:	85be                	mv	a1,a5
    write(f, s, l);
    1276:	003c                	addi	a5,sp,8
    1278:	4641                	li	a2,16
    127a:	9e0d                	subw	a2,a2,a1
    127c:	4505                	li	a0,1
    127e:	95be                	add	a1,a1,a5
    1280:	387000ef          	jal	ra,1e06 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1284:	70a2                	ld	ra,40(sp)
    1286:	6145                	addi	sp,sp,48
    1288:	8082                	ret
        x = -xx;
    128a:	40a0063b          	negw	a2,a0
    128e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1290:	02b677bb          	remuw	a5,a2,a1
    1294:	00001717          	auipc	a4,0x1
    1298:	e9470713          	addi	a4,a4,-364 # 2128 <digits>
    buf[16] = 0;
    129c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    12a0:	1782                	slli	a5,a5,0x20
    12a2:	9381                	srli	a5,a5,0x20
    12a4:	97ba                	add	a5,a5,a4
    12a6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12aa:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    12ae:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12b2:	ecb676e3          	bleu	a1,a2,117e <printint.constprop.0+0x34>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12be:	45b9                	li	a1,14
    12c0:	bf5d                	j	1276 <printint.constprop.0+0x12c>
    12c2:	47a5                	li	a5,9
    12c4:	45a9                	li	a1,10
    12c6:	bf79                	j	1264 <printint.constprop.0+0x11a>
    12c8:	47b5                	li	a5,13
    12ca:	45b9                	li	a1,14
    12cc:	bf61                	j	1264 <printint.constprop.0+0x11a>
    12ce:	47b1                	li	a5,12
    12d0:	45b5                	li	a1,13
    12d2:	bf49                	j	1264 <printint.constprop.0+0x11a>
    12d4:	47ad                	li	a5,11
    12d6:	45b1                	li	a1,12
    12d8:	b771                	j	1264 <printint.constprop.0+0x11a>
    12da:	47a9                	li	a5,10
    12dc:	45ad                	li	a1,11
    12de:	b759                	j	1264 <printint.constprop.0+0x11a>
    i = 15;
    12e0:	45bd                	li	a1,15
    12e2:	bf51                	j	1276 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12e4:	47a1                	li	a5,8
    12e6:	45a5                	li	a1,9
    12e8:	bfb5                	j	1264 <printint.constprop.0+0x11a>
    12ea:	479d                	li	a5,7
    12ec:	45a1                	li	a1,8
    12ee:	bf9d                	j	1264 <printint.constprop.0+0x11a>
    12f0:	4799                	li	a5,6
    12f2:	459d                	li	a1,7
    12f4:	bf85                	j	1264 <printint.constprop.0+0x11a>

00000000000012f6 <getchar>:
{
    12f6:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12f8:	00f10593          	addi	a1,sp,15
    12fc:	4605                	li	a2,1
    12fe:	4501                	li	a0,0
{
    1300:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1302:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1306:	2f7000ef          	jal	ra,1dfc <read>
}
    130a:	60e2                	ld	ra,24(sp)
    130c:	00f14503          	lbu	a0,15(sp)
    1310:	6105                	addi	sp,sp,32
    1312:	8082                	ret

0000000000001314 <putchar>:
{
    1314:	1101                	addi	sp,sp,-32
    char byte = c;
    1316:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    131a:	00f10593          	addi	a1,sp,15
    131e:	4605                	li	a2,1
    1320:	4505                	li	a0,1
{
    1322:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1324:	2e3000ef          	jal	ra,1e06 <write>
}
    1328:	60e2                	ld	ra,24(sp)
    132a:	2501                	sext.w	a0,a0
    132c:	6105                	addi	sp,sp,32
    132e:	8082                	ret

0000000000001330 <puts>:
{
    1330:	1141                	addi	sp,sp,-16
    1332:	e406                	sd	ra,8(sp)
    1334:	e022                	sd	s0,0(sp)
    1336:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1338:	5b2000ef          	jal	ra,18ea <strlen>
    133c:	862a                	mv	a2,a0
    133e:	85a2                	mv	a1,s0
    1340:	4505                	li	a0,1
    1342:	2c5000ef          	jal	ra,1e06 <write>
}
    1346:	60a2                	ld	ra,8(sp)
    1348:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    134a:	957d                	srai	a0,a0,0x3f
    return r;
    134c:	2501                	sext.w	a0,a0
}
    134e:	0141                	addi	sp,sp,16
    1350:	8082                	ret

0000000000001352 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1352:	7131                	addi	sp,sp,-192
    1354:	e0da                	sd	s6,64(sp)
    1356:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1358:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    135a:	013c                	addi	a5,sp,136
{
    135c:	f0ca                	sd	s2,96(sp)
    135e:	ecce                	sd	s3,88(sp)
    1360:	e8d2                	sd	s4,80(sp)
    1362:	e4d6                	sd	s5,72(sp)
    1364:	fc5e                	sd	s7,56(sp)
    1366:	fc86                	sd	ra,120(sp)
    1368:	f8a2                	sd	s0,112(sp)
    136a:	f4a6                	sd	s1,104(sp)
    136c:	89aa                	mv	s3,a0
    136e:	e52e                	sd	a1,136(sp)
    1370:	e932                	sd	a2,144(sp)
    1372:	ed36                	sd	a3,152(sp)
    1374:	f13a                	sd	a4,160(sp)
    1376:	f942                	sd	a6,176(sp)
    1378:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    137a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    137c:	02500913          	li	s2,37
    1380:	07000a93          	li	s5,112
    buf[i++] = '0';
    1384:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1388:	00001a17          	auipc	s4,0x1
    138c:	da0a0a13          	addi	s4,s4,-608 # 2128 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1390:	00001b97          	auipc	s7,0x1
    1394:	d60b8b93          	addi	s7,s7,-672 # 20f0 <__clone+0xb0>
        if (!*s)
    1398:	0009c783          	lbu	a5,0(s3)
    139c:	cfb9                	beqz	a5,13fa <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    139e:	23278d63          	beq	a5,s2,15d8 <printf+0x286>
    13a2:	864e                	mv	a2,s3
    13a4:	a019                	j	13aa <printf+0x58>
    13a6:	07278563          	beq	a5,s2,1410 <printf+0xbe>
    13aa:	0605                	addi	a2,a2,1
    13ac:	00064783          	lbu	a5,0(a2)
    13b0:	fbfd                	bnez	a5,13a6 <printf+0x54>
    13b2:	84b2                	mv	s1,a2
        l = z - a;
    13b4:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13b8:	8622                	mv	a2,s0
    13ba:	85ce                	mv	a1,s3
    13bc:	4505                	li	a0,1
    13be:	249000ef          	jal	ra,1e06 <write>
        if (l)
    13c2:	ec3d                	bnez	s0,1440 <printf+0xee>
        if (s[1] == 0)
    13c4:	0014c783          	lbu	a5,1(s1)
    13c8:	cb8d                	beqz	a5,13fa <printf+0xa8>
        switch (s[1])
    13ca:	09578b63          	beq	a5,s5,1460 <printf+0x10e>
    13ce:	06fafb63          	bleu	a5,s5,1444 <printf+0xf2>
    13d2:	07300713          	li	a4,115
    13d6:	1ce78e63          	beq	a5,a4,15b2 <printf+0x260>
    13da:	07800713          	li	a4,120
    13de:	1ae79563          	bne	a5,a4,1588 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13e2:	6782                	ld	a5,0(sp)
    13e4:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13e6:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13ea:	4388                	lw	a0,0(a5)
    13ec:	07a1                	addi	a5,a5,8
    13ee:	e03e                	sd	a5,0(sp)
    13f0:	d5bff0ef          	jal	ra,114a <printint.constprop.0>
        if (!*s)
    13f4:	0009c783          	lbu	a5,0(s3)
    13f8:	f3dd                	bnez	a5,139e <printf+0x4c>
    }
    va_end(ap);
}
    13fa:	70e6                	ld	ra,120(sp)
    13fc:	7446                	ld	s0,112(sp)
    13fe:	74a6                	ld	s1,104(sp)
    1400:	7906                	ld	s2,96(sp)
    1402:	69e6                	ld	s3,88(sp)
    1404:	6a46                	ld	s4,80(sp)
    1406:	6aa6                	ld	s5,72(sp)
    1408:	6b06                	ld	s6,64(sp)
    140a:	7be2                	ld	s7,56(sp)
    140c:	6129                	addi	sp,sp,192
    140e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1410:	00164783          	lbu	a5,1(a2)
    1414:	84b2                	mv	s1,a2
    1416:	01278763          	beq	a5,s2,1424 <printf+0xd2>
    141a:	bf69                	j	13b4 <printf+0x62>
    141c:	0014c783          	lbu	a5,1(s1)
    1420:	f9279ae3          	bne	a5,s2,13b4 <printf+0x62>
    1424:	0489                	addi	s1,s1,2
    1426:	0004c783          	lbu	a5,0(s1)
    142a:	0605                	addi	a2,a2,1
    142c:	ff2788e3          	beq	a5,s2,141c <printf+0xca>
        l = z - a;
    1430:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1434:	8622                	mv	a2,s0
    1436:	85ce                	mv	a1,s3
    1438:	4505                	li	a0,1
    143a:	1cd000ef          	jal	ra,1e06 <write>
        if (l)
    143e:	d059                	beqz	s0,13c4 <printf+0x72>
    1440:	89a6                	mv	s3,s1
    1442:	bf99                	j	1398 <printf+0x46>
    1444:	06400713          	li	a4,100
    1448:	14e79063          	bne	a5,a4,1588 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    144c:	6782                	ld	a5,0(sp)
    144e:	45a9                	li	a1,10
        s += 2;
    1450:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1454:	4388                	lw	a0,0(a5)
    1456:	07a1                	addi	a5,a5,8
    1458:	e03e                	sd	a5,0(sp)
    145a:	cf1ff0ef          	jal	ra,114a <printint.constprop.0>
        s += 2;
    145e:	bf59                	j	13f4 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1460:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1462:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1466:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1468:	631c                	ld	a5,0(a4)
    146a:	0721                	addi	a4,a4,8
    146c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    146e:	00479293          	slli	t0,a5,0x4
    1472:	00879f93          	slli	t6,a5,0x8
    1476:	00c79f13          	slli	t5,a5,0xc
    147a:	01079e93          	slli	t4,a5,0x10
    147e:	01479e13          	slli	t3,a5,0x14
    1482:	01879313          	slli	t1,a5,0x18
    1486:	01c79893          	slli	a7,a5,0x1c
    148a:	02479813          	slli	a6,a5,0x24
    148e:	02879513          	slli	a0,a5,0x28
    1492:	02c79593          	slli	a1,a5,0x2c
    1496:	03079693          	slli	a3,a5,0x30
    149a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149e:	03c7d413          	srli	s0,a5,0x3c
    14a2:	01c7d39b          	srliw	t2,a5,0x1c
    14a6:	03c2d293          	srli	t0,t0,0x3c
    14aa:	03cfdf93          	srli	t6,t6,0x3c
    14ae:	03cf5f13          	srli	t5,t5,0x3c
    14b2:	03cede93          	srli	t4,t4,0x3c
    14b6:	03ce5e13          	srli	t3,t3,0x3c
    14ba:	03c35313          	srli	t1,t1,0x3c
    14be:	03c8d893          	srli	a7,a7,0x3c
    14c2:	03c85813          	srli	a6,a6,0x3c
    14c6:	9171                	srli	a0,a0,0x3c
    14c8:	91f1                	srli	a1,a1,0x3c
    14ca:	92f1                	srli	a3,a3,0x3c
    14cc:	9371                	srli	a4,a4,0x3c
    14ce:	96d2                	add	a3,a3,s4
    14d0:	9752                	add	a4,a4,s4
    14d2:	9452                	add	s0,s0,s4
    14d4:	92d2                	add	t0,t0,s4
    14d6:	9fd2                	add	t6,t6,s4
    14d8:	9f52                	add	t5,t5,s4
    14da:	9ed2                	add	t4,t4,s4
    14dc:	9e52                	add	t3,t3,s4
    14de:	9352                	add	t1,t1,s4
    14e0:	98d2                	add	a7,a7,s4
    14e2:	93d2                	add	t2,t2,s4
    14e4:	9852                	add	a6,a6,s4
    14e6:	9552                	add	a0,a0,s4
    14e8:	95d2                	add	a1,a1,s4
    14ea:	0006c983          	lbu	s3,0(a3)
    14ee:	0002c283          	lbu	t0,0(t0)
    14f2:	00074683          	lbu	a3,0(a4)
    14f6:	000fcf83          	lbu	t6,0(t6)
    14fa:	000f4f03          	lbu	t5,0(t5)
    14fe:	000ece83          	lbu	t4,0(t4)
    1502:	000e4e03          	lbu	t3,0(t3)
    1506:	00034303          	lbu	t1,0(t1)
    150a:	0008c883          	lbu	a7,0(a7)
    150e:	0003c383          	lbu	t2,0(t2)
    1512:	00084803          	lbu	a6,0(a6)
    1516:	00054503          	lbu	a0,0(a0)
    151a:	0005c583          	lbu	a1,0(a1)
    151e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1522:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1526:	9371                	srli	a4,a4,0x3c
    1528:	8bbd                	andi	a5,a5,15
    152a:	9752                	add	a4,a4,s4
    152c:	97d2                	add	a5,a5,s4
    152e:	005105a3          	sb	t0,11(sp)
    1532:	01f10623          	sb	t6,12(sp)
    1536:	01e106a3          	sb	t5,13(sp)
    153a:	01d10723          	sb	t4,14(sp)
    153e:	01c107a3          	sb	t3,15(sp)
    1542:	00610823          	sb	t1,16(sp)
    1546:	011108a3          	sb	a7,17(sp)
    154a:	00710923          	sb	t2,18(sp)
    154e:	010109a3          	sb	a6,19(sp)
    1552:	00a10a23          	sb	a0,20(sp)
    1556:	00b10aa3          	sb	a1,21(sp)
    155a:	01310b23          	sb	s3,22(sp)
    155e:	00d10ba3          	sb	a3,23(sp)
    1562:	00810523          	sb	s0,10(sp)
    1566:	00074703          	lbu	a4,0(a4)
    156a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    156e:	002c                	addi	a1,sp,8
    1570:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1572:	00e10c23          	sb	a4,24(sp)
    1576:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    157a:	00010d23          	sb	zero,26(sp)
        s += 2;
    157e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1582:	085000ef          	jal	ra,1e06 <write>
        s += 2;
    1586:	b5bd                	j	13f4 <printf+0xa2>
    char byte = c;
    1588:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    158c:	4605                	li	a2,1
    158e:	002c                	addi	a1,sp,8
    1590:	4505                	li	a0,1
    char byte = c;
    1592:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1596:	071000ef          	jal	ra,1e06 <write>
    char byte = c;
    159a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    159e:	4605                	li	a2,1
    15a0:	002c                	addi	a1,sp,8
    15a2:	4505                	li	a0,1
    char byte = c;
    15a4:	00f10423          	sb	a5,8(sp)
        s += 2;
    15a8:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    15ac:	05b000ef          	jal	ra,1e06 <write>
        s += 2;
    15b0:	b591                	j	13f4 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    15b2:	6782                	ld	a5,0(sp)
    15b4:	6380                	ld	s0,0(a5)
    15b6:	07a1                	addi	a5,a5,8
    15b8:	e03e                	sd	a5,0(sp)
    15ba:	cc05                	beqz	s0,15f2 <printf+0x2a0>
            l = strnlen(a, 200);
    15bc:	0c800593          	li	a1,200
    15c0:	8522                	mv	a0,s0
    15c2:	45a000ef          	jal	ra,1a1c <strnlen>
    write(f, s, l);
    15c6:	0005061b          	sext.w	a2,a0
    15ca:	85a2                	mv	a1,s0
    15cc:	4505                	li	a0,1
    15ce:	039000ef          	jal	ra,1e06 <write>
        s += 2;
    15d2:	00248993          	addi	s3,s1,2
    15d6:	bd39                	j	13f4 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15d8:	0019c783          	lbu	a5,1(s3)
    15dc:	84ce                	mv	s1,s3
    15de:	864e                	mv	a2,s3
    15e0:	e52782e3          	beq	a5,s2,1424 <printf+0xd2>
    write(f, s, l);
    15e4:	4601                	li	a2,0
    15e6:	85ce                	mv	a1,s3
    15e8:	4505                	li	a0,1
    15ea:	01d000ef          	jal	ra,1e06 <write>
    15ee:	84ce                	mv	s1,s3
    15f0:	bbd1                	j	13c4 <printf+0x72>
                a = "(null)";
    15f2:	845e                	mv	s0,s7
    15f4:	b7e1                	j	15bc <printf+0x26a>

00000000000015f6 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15f6:	1141                	addi	sp,sp,-16
    15f8:	e406                	sd	ra,8(sp)
    puts(m);
    15fa:	d37ff0ef          	jal	ra,1330 <puts>
    exit(-100);
}
    15fe:	60a2                	ld	ra,8(sp)
    exit(-100);
    1600:	f9c00513          	li	a0,-100
}
    1604:	0141                	addi	sp,sp,16
    exit(-100);
    1606:	0530006f          	j	1e58 <exit>

000000000000160a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    160a:	02000793          	li	a5,32
    160e:	00f50663          	beq	a0,a5,161a <isspace+0x10>
    1612:	355d                	addiw	a0,a0,-9
    1614:	00553513          	sltiu	a0,a0,5
    1618:	8082                	ret
    161a:	4505                	li	a0,1
}
    161c:	8082                	ret

000000000000161e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    161e:	fd05051b          	addiw	a0,a0,-48
}
    1622:	00a53513          	sltiu	a0,a0,10
    1626:	8082                	ret

0000000000001628 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1628:	02000613          	li	a2,32
    162c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    162e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1632:	0007079b          	sext.w	a5,a4
    1636:	ff77869b          	addiw	a3,a5,-9
    163a:	04c70b63          	beq	a4,a2,1690 <atoi+0x68>
    163e:	04d5f963          	bleu	a3,a1,1690 <atoi+0x68>
        s++;
    switch (*s)
    1642:	02b00693          	li	a3,43
    1646:	04d70a63          	beq	a4,a3,169a <atoi+0x72>
    164a:	02d00693          	li	a3,45
    164e:	06d70463          	beq	a4,a3,16b6 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1652:	fd07859b          	addiw	a1,a5,-48
    1656:	4625                	li	a2,9
    1658:	873e                	mv	a4,a5
    165a:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    165c:	4e01                	li	t3,0
    while (isdigit(*s))
    165e:	04b66a63          	bltu	a2,a1,16b2 <atoi+0x8a>
    int n = 0, neg = 0;
    1662:	4501                	li	a0,0
    while (isdigit(*s))
    1664:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1666:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1668:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    166c:	0025179b          	slliw	a5,a0,0x2
    1670:	9d3d                	addw	a0,a0,a5
    1672:	fd07031b          	addiw	t1,a4,-48
    1676:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    167a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    167e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1682:	0006071b          	sext.w	a4,a2
    1686:	feb870e3          	bleu	a1,a6,1666 <atoi+0x3e>
    return neg ? n : -n;
    168a:	000e0563          	beqz	t3,1694 <atoi+0x6c>
}
    168e:	8082                	ret
        s++;
    1690:	0505                	addi	a0,a0,1
    1692:	bf71                	j	162e <atoi+0x6>
    1694:	4113053b          	subw	a0,t1,a7
    1698:	8082                	ret
    while (isdigit(*s))
    169a:	00154783          	lbu	a5,1(a0)
    169e:	4625                	li	a2,9
        s++;
    16a0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16a4:	fd07859b          	addiw	a1,a5,-48
    16a8:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    16ac:	4e01                	li	t3,0
    while (isdigit(*s))
    16ae:	fab67ae3          	bleu	a1,a2,1662 <atoi+0x3a>
    16b2:	4501                	li	a0,0
}
    16b4:	8082                	ret
    while (isdigit(*s))
    16b6:	00154783          	lbu	a5,1(a0)
    16ba:	4625                	li	a2,9
        s++;
    16bc:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    16c0:	fd07859b          	addiw	a1,a5,-48
    16c4:	0007871b          	sext.w	a4,a5
    16c8:	feb665e3          	bltu	a2,a1,16b2 <atoi+0x8a>
        neg = 1;
    16cc:	4e05                	li	t3,1
    16ce:	bf51                	j	1662 <atoi+0x3a>

00000000000016d0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16d0:	16060d63          	beqz	a2,184a <memset+0x17a>
    16d4:	40a007b3          	neg	a5,a0
    16d8:	8b9d                	andi	a5,a5,7
    16da:	00778713          	addi	a4,a5,7
    16de:	482d                	li	a6,11
    16e0:	0ff5f593          	andi	a1,a1,255
    16e4:	fff60693          	addi	a3,a2,-1
    16e8:	17076263          	bltu	a4,a6,184c <memset+0x17c>
    16ec:	16e6ea63          	bltu	a3,a4,1860 <memset+0x190>
    16f0:	16078563          	beqz	a5,185a <memset+0x18a>
    16f4:	00b50023          	sb	a1,0(a0)
    16f8:	4705                	li	a4,1
    16fa:	00150e93          	addi	t4,a0,1
    16fe:	14e78c63          	beq	a5,a4,1856 <memset+0x186>
    1702:	00b500a3          	sb	a1,1(a0)
    1706:	4709                	li	a4,2
    1708:	00250e93          	addi	t4,a0,2
    170c:	14e78d63          	beq	a5,a4,1866 <memset+0x196>
    1710:	00b50123          	sb	a1,2(a0)
    1714:	470d                	li	a4,3
    1716:	00350e93          	addi	t4,a0,3
    171a:	12e78b63          	beq	a5,a4,1850 <memset+0x180>
    171e:	00b501a3          	sb	a1,3(a0)
    1722:	4711                	li	a4,4
    1724:	00450e93          	addi	t4,a0,4
    1728:	14e78163          	beq	a5,a4,186a <memset+0x19a>
    172c:	00b50223          	sb	a1,4(a0)
    1730:	4715                	li	a4,5
    1732:	00550e93          	addi	t4,a0,5
    1736:	12e78c63          	beq	a5,a4,186e <memset+0x19e>
    173a:	00b502a3          	sb	a1,5(a0)
    173e:	471d                	li	a4,7
    1740:	00650e93          	addi	t4,a0,6
    1744:	12e79763          	bne	a5,a4,1872 <memset+0x1a2>
    1748:	00750e93          	addi	t4,a0,7
    174c:	00b50323          	sb	a1,6(a0)
    1750:	4f1d                	li	t5,7
    1752:	00859713          	slli	a4,a1,0x8
    1756:	8f4d                	or	a4,a4,a1
    1758:	01059e13          	slli	t3,a1,0x10
    175c:	01c76e33          	or	t3,a4,t3
    1760:	01859313          	slli	t1,a1,0x18
    1764:	006e6333          	or	t1,t3,t1
    1768:	02059893          	slli	a7,a1,0x20
    176c:	011368b3          	or	a7,t1,a7
    1770:	02859813          	slli	a6,a1,0x28
    1774:	40f60333          	sub	t1,a2,a5
    1778:	0108e833          	or	a6,a7,a6
    177c:	03059693          	slli	a3,a1,0x30
    1780:	00d866b3          	or	a3,a6,a3
    1784:	03859713          	slli	a4,a1,0x38
    1788:	97aa                	add	a5,a5,a0
    178a:	ff837813          	andi	a6,t1,-8
    178e:	8f55                	or	a4,a4,a3
    1790:	00f806b3          	add	a3,a6,a5
    1794:	e398                	sd	a4,0(a5)
    1796:	07a1                	addi	a5,a5,8
    1798:	fed79ee3          	bne	a5,a3,1794 <memset+0xc4>
    179c:	ff837693          	andi	a3,t1,-8
    17a0:	00de87b3          	add	a5,t4,a3
    17a4:	01e6873b          	addw	a4,a3,t5
    17a8:	0ad30663          	beq	t1,a3,1854 <memset+0x184>
    17ac:	00b78023          	sb	a1,0(a5)
    17b0:	0017069b          	addiw	a3,a4,1
    17b4:	08c6fb63          	bleu	a2,a3,184a <memset+0x17a>
    17b8:	00b780a3          	sb	a1,1(a5)
    17bc:	0027069b          	addiw	a3,a4,2
    17c0:	08c6f563          	bleu	a2,a3,184a <memset+0x17a>
    17c4:	00b78123          	sb	a1,2(a5)
    17c8:	0037069b          	addiw	a3,a4,3
    17cc:	06c6ff63          	bleu	a2,a3,184a <memset+0x17a>
    17d0:	00b781a3          	sb	a1,3(a5)
    17d4:	0047069b          	addiw	a3,a4,4
    17d8:	06c6f963          	bleu	a2,a3,184a <memset+0x17a>
    17dc:	00b78223          	sb	a1,4(a5)
    17e0:	0057069b          	addiw	a3,a4,5
    17e4:	06c6f363          	bleu	a2,a3,184a <memset+0x17a>
    17e8:	00b782a3          	sb	a1,5(a5)
    17ec:	0067069b          	addiw	a3,a4,6
    17f0:	04c6fd63          	bleu	a2,a3,184a <memset+0x17a>
    17f4:	00b78323          	sb	a1,6(a5)
    17f8:	0077069b          	addiw	a3,a4,7
    17fc:	04c6f763          	bleu	a2,a3,184a <memset+0x17a>
    1800:	00b783a3          	sb	a1,7(a5)
    1804:	0087069b          	addiw	a3,a4,8
    1808:	04c6f163          	bleu	a2,a3,184a <memset+0x17a>
    180c:	00b78423          	sb	a1,8(a5)
    1810:	0097069b          	addiw	a3,a4,9
    1814:	02c6fb63          	bleu	a2,a3,184a <memset+0x17a>
    1818:	00b784a3          	sb	a1,9(a5)
    181c:	00a7069b          	addiw	a3,a4,10
    1820:	02c6f563          	bleu	a2,a3,184a <memset+0x17a>
    1824:	00b78523          	sb	a1,10(a5)
    1828:	00b7069b          	addiw	a3,a4,11
    182c:	00c6ff63          	bleu	a2,a3,184a <memset+0x17a>
    1830:	00b785a3          	sb	a1,11(a5)
    1834:	00c7069b          	addiw	a3,a4,12
    1838:	00c6f963          	bleu	a2,a3,184a <memset+0x17a>
    183c:	00b78623          	sb	a1,12(a5)
    1840:	2735                	addiw	a4,a4,13
    1842:	00c77463          	bleu	a2,a4,184a <memset+0x17a>
    1846:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    184a:	8082                	ret
    184c:	472d                	li	a4,11
    184e:	bd79                	j	16ec <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1850:	4f0d                	li	t5,3
    1852:	b701                	j	1752 <memset+0x82>
    1854:	8082                	ret
    1856:	4f05                	li	t5,1
    1858:	bded                	j	1752 <memset+0x82>
    185a:	8eaa                	mv	t4,a0
    185c:	4f01                	li	t5,0
    185e:	bdd5                	j	1752 <memset+0x82>
    1860:	87aa                	mv	a5,a0
    1862:	4701                	li	a4,0
    1864:	b7a1                	j	17ac <memset+0xdc>
    1866:	4f09                	li	t5,2
    1868:	b5ed                	j	1752 <memset+0x82>
    186a:	4f11                	li	t5,4
    186c:	b5dd                	j	1752 <memset+0x82>
    186e:	4f15                	li	t5,5
    1870:	b5cd                	j	1752 <memset+0x82>
    1872:	4f19                	li	t5,6
    1874:	bdf9                	j	1752 <memset+0x82>

0000000000001876 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1876:	00054703          	lbu	a4,0(a0)
    187a:	0005c783          	lbu	a5,0(a1)
    187e:	00e79b63          	bne	a5,a4,1894 <strcmp+0x1e>
    1882:	cf89                	beqz	a5,189c <strcmp+0x26>
    1884:	0505                	addi	a0,a0,1
    1886:	0585                	addi	a1,a1,1
    1888:	0005c783          	lbu	a5,0(a1)
    188c:	00054703          	lbu	a4,0(a0)
    1890:	fef709e3          	beq	a4,a5,1882 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1894:	0007051b          	sext.w	a0,a4
}
    1898:	9d1d                	subw	a0,a0,a5
    189a:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    189c:	4501                	li	a0,0
}
    189e:	9d1d                	subw	a0,a0,a5
    18a0:	8082                	ret

00000000000018a2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    18a2:	c231                	beqz	a2,18e6 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18a4:	00054783          	lbu	a5,0(a0)
    18a8:	0005c683          	lbu	a3,0(a1)
    18ac:	c795                	beqz	a5,18d8 <strncmp+0x36>
    18ae:	ca85                	beqz	a3,18de <strncmp+0x3c>
    if (!n--)
    18b0:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    18b2:	c615                	beqz	a2,18de <strncmp+0x3c>
    18b4:	00150713          	addi	a4,a0,1
    18b8:	9532                	add	a0,a0,a2
    18ba:	00d78963          	beq	a5,a3,18cc <strncmp+0x2a>
    18be:	a005                	j	18de <strncmp+0x3c>
    18c0:	ce99                	beqz	a3,18de <strncmp+0x3c>
    18c2:	00e50e63          	beq	a0,a4,18de <strncmp+0x3c>
    18c6:	0705                	addi	a4,a4,1
    18c8:	00d79b63          	bne	a5,a3,18de <strncmp+0x3c>
    18cc:	00074783          	lbu	a5,0(a4)
    18d0:	0585                	addi	a1,a1,1
    18d2:	0005c683          	lbu	a3,0(a1)
    18d6:	f7ed                	bnez	a5,18c0 <strncmp+0x1e>
    18d8:	4501                	li	a0,0
        ;
    return *l - *r;
    18da:	9d15                	subw	a0,a0,a3
    18dc:	8082                	ret
    18de:	0007851b          	sext.w	a0,a5
    18e2:	9d15                	subw	a0,a0,a3
    18e4:	8082                	ret
        return 0;
    18e6:	4501                	li	a0,0
}
    18e8:	8082                	ret

00000000000018ea <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18ea:	00757793          	andi	a5,a0,7
    18ee:	cfa1                	beqz	a5,1946 <strlen+0x5c>
        if (!*s)
    18f0:	00054783          	lbu	a5,0(a0)
    18f4:	cbb9                	beqz	a5,194a <strlen+0x60>
    18f6:	87aa                	mv	a5,a0
    18f8:	a021                	j	1900 <strlen+0x16>
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	c329                	beqz	a4,1940 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1900:	0785                	addi	a5,a5,1
    1902:	0077f713          	andi	a4,a5,7
    1906:	fb75                	bnez	a4,18fa <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1908:	00000717          	auipc	a4,0x0
    190c:	7f070713          	addi	a4,a4,2032 # 20f8 <__clone+0xb8>
    1910:	630c                	ld	a1,0(a4)
    1912:	00000717          	auipc	a4,0x0
    1916:	7ee70713          	addi	a4,a4,2030 # 2100 <__clone+0xc0>
    191a:	6394                	ld	a3,0(a5)
    191c:	6310                	ld	a2,0(a4)
    191e:	a019                	j	1924 <strlen+0x3a>
    1920:	07a1                	addi	a5,a5,8
    1922:	6394                	ld	a3,0(a5)
    1924:	00b68733          	add	a4,a3,a1
    1928:	fff6c693          	not	a3,a3
    192c:	8f75                	and	a4,a4,a3
    192e:	8f71                	and	a4,a4,a2
    1930:	db65                	beqz	a4,1920 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1932:	0007c703          	lbu	a4,0(a5)
    1936:	c709                	beqz	a4,1940 <strlen+0x56>
    1938:	0785                	addi	a5,a5,1
    193a:	0007c703          	lbu	a4,0(a5)
    193e:	ff6d                	bnez	a4,1938 <strlen+0x4e>
        ;
    return s - a;
    1940:	40a78533          	sub	a0,a5,a0
}
    1944:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1946:	87aa                	mv	a5,a0
    1948:	b7c1                	j	1908 <strlen+0x1e>
        if (!*s)
    194a:	4501                	li	a0,0
            return s - a;
    194c:	8082                	ret

000000000000194e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    194e:	00757793          	andi	a5,a0,7
    1952:	0ff5f593          	andi	a1,a1,255
    1956:	cb99                	beqz	a5,196c <memchr+0x1e>
    1958:	c655                	beqz	a2,1a04 <memchr+0xb6>
    195a:	00054783          	lbu	a5,0(a0)
    195e:	0ab78663          	beq	a5,a1,1a0a <memchr+0xbc>
    1962:	0505                	addi	a0,a0,1
    1964:	00757793          	andi	a5,a0,7
    1968:	167d                	addi	a2,a2,-1
    196a:	f7fd                	bnez	a5,1958 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    196c:	4701                	li	a4,0
    if (n && *s != c)
    196e:	ca49                	beqz	a2,1a00 <memchr+0xb2>
    1970:	00054783          	lbu	a5,0(a0)
    1974:	08b78b63          	beq	a5,a1,1a0a <memchr+0xbc>
        size_t k = ONES * c;
    1978:	00000797          	auipc	a5,0x0
    197c:	79078793          	addi	a5,a5,1936 # 2108 <__clone+0xc8>
    1980:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1982:	479d                	li	a5,7
        size_t k = ONES * c;
    1984:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1988:	08c7f863          	bleu	a2,a5,1a18 <memchr+0xca>
    198c:	611c                	ld	a5,0(a0)
    198e:	00000317          	auipc	t1,0x0
    1992:	77230313          	addi	t1,t1,1906 # 2100 <__clone+0xc0>
    1996:	00033803          	ld	a6,0(t1)
    199a:	00f8c7b3          	xor	a5,a7,a5
    199e:	fff7c713          	not	a4,a5
    19a2:	8f95                	sub	a5,a5,a3
    19a4:	8ff9                	and	a5,a5,a4
    19a6:	0107f7b3          	and	a5,a5,a6
    19aa:	e7bd                	bnez	a5,1a18 <memchr+0xca>
    19ac:	4e1d                	li	t3,7
    19ae:	00000e97          	auipc	t4,0x0
    19b2:	74ae8e93          	addi	t4,t4,1866 # 20f8 <__clone+0xb8>
    19b6:	a005                	j	19d6 <memchr+0x88>
    19b8:	6514                	ld	a3,8(a0)
    19ba:	000eb783          	ld	a5,0(t4)
    19be:	00033803          	ld	a6,0(t1)
    19c2:	00d8c6b3          	xor	a3,a7,a3
    19c6:	97b6                	add	a5,a5,a3
    19c8:	fff6c693          	not	a3,a3
    19cc:	8ff5                	and	a5,a5,a3
    19ce:	0107f7b3          	and	a5,a5,a6
    19d2:	e3a1                	bnez	a5,1a12 <memchr+0xc4>
    19d4:	853a                	mv	a0,a4
    19d6:	1661                	addi	a2,a2,-8
    19d8:	00850713          	addi	a4,a0,8
    19dc:	fcce6ee3          	bltu	t3,a2,19b8 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    19e0:	c215                	beqz	a2,1a04 <memchr+0xb6>
    19e2:	00074783          	lbu	a5,0(a4)
    19e6:	00f58d63          	beq	a1,a5,1a00 <memchr+0xb2>
    19ea:	00170793          	addi	a5,a4,1
    19ee:	963a                	add	a2,a2,a4
    19f0:	873e                	mv	a4,a5
    19f2:	00f60963          	beq	a2,a5,1a04 <memchr+0xb6>
    19f6:	0007c683          	lbu	a3,0(a5)
    19fa:	0785                	addi	a5,a5,1
    19fc:	feb69ae3          	bne	a3,a1,19f0 <memchr+0xa2>
}
    1a00:	853a                	mv	a0,a4
    1a02:	8082                	ret
    return n ? (void *)s : 0;
    1a04:	4701                	li	a4,0
}
    1a06:	853a                	mv	a0,a4
    1a08:	8082                	ret
    1a0a:	872a                	mv	a4,a0
    1a0c:	00074783          	lbu	a5,0(a4)
    1a10:	bfd9                	j	19e6 <memchr+0x98>
    1a12:	00854783          	lbu	a5,8(a0)
    1a16:	bfc1                	j	19e6 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a18:	872a                	mv	a4,a0
    1a1a:	bfc1                	j	19ea <memchr+0x9c>

0000000000001a1c <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a1c:	00757793          	andi	a5,a0,7
    1a20:	cfc5                	beqz	a5,1ad8 <strnlen+0xbc>
    1a22:	c1c5                	beqz	a1,1ac2 <strnlen+0xa6>
    1a24:	00054783          	lbu	a5,0(a0)
    1a28:	cfd9                	beqz	a5,1ac6 <strnlen+0xaa>
    1a2a:	87ae                	mv	a5,a1
    1a2c:	86aa                	mv	a3,a0
    1a2e:	a029                	j	1a38 <strnlen+0x1c>
    1a30:	cbc9                	beqz	a5,1ac2 <strnlen+0xa6>
    1a32:	0006c703          	lbu	a4,0(a3)
    1a36:	cb51                	beqz	a4,1aca <strnlen+0xae>
    1a38:	0685                	addi	a3,a3,1
    1a3a:	0076f713          	andi	a4,a3,7
    1a3e:	17fd                	addi	a5,a5,-1
    1a40:	fb65                	bnez	a4,1a30 <strnlen+0x14>
    if (n && *s != c)
    1a42:	c3c1                	beqz	a5,1ac2 <strnlen+0xa6>
    1a44:	0006c703          	lbu	a4,0(a3)
    1a48:	c349                	beqz	a4,1aca <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a4a:	471d                	li	a4,7
    1a4c:	08f77a63          	bleu	a5,a4,1ae0 <strnlen+0xc4>
    1a50:	00000e17          	auipc	t3,0x0
    1a54:	6a8e0e13          	addi	t3,t3,1704 # 20f8 <__clone+0xb8>
    1a58:	6290                	ld	a2,0(a3)
    1a5a:	000e3703          	ld	a4,0(t3)
    1a5e:	00000e97          	auipc	t4,0x0
    1a62:	6a2e8e93          	addi	t4,t4,1698 # 2100 <__clone+0xc0>
    1a66:	000eb803          	ld	a6,0(t4)
    1a6a:	9732                	add	a4,a4,a2
    1a6c:	fff64613          	not	a2,a2
    1a70:	8f71                	and	a4,a4,a2
    1a72:	01077733          	and	a4,a4,a6
    1a76:	e72d                	bnez	a4,1ae0 <strnlen+0xc4>
    1a78:	4f1d                	li	t5,7
    1a7a:	a839                	j	1a98 <strnlen+0x7c>
    1a7c:	6698                	ld	a4,8(a3)
    1a7e:	000e3303          	ld	t1,0(t3)
    1a82:	000eb803          	ld	a6,0(t4)
    1a86:	fff74893          	not	a7,a4
    1a8a:	971a                	add	a4,a4,t1
    1a8c:	01177733          	and	a4,a4,a7
    1a90:	01077733          	and	a4,a4,a6
    1a94:	ef1d                	bnez	a4,1ad2 <strnlen+0xb6>
    1a96:	86b2                	mv	a3,a2
    1a98:	17e1                	addi	a5,a5,-8
    1a9a:	00868613          	addi	a2,a3,8
    1a9e:	fcff6fe3          	bltu	t5,a5,1a7c <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1aa2:	c385                	beqz	a5,1ac2 <strnlen+0xa6>
    1aa4:	00064703          	lbu	a4,0(a2)
    1aa8:	cb19                	beqz	a4,1abe <strnlen+0xa2>
    1aaa:	00160713          	addi	a4,a2,1
    1aae:	97b2                	add	a5,a5,a2
    1ab0:	863a                	mv	a2,a4
    1ab2:	00e78863          	beq	a5,a4,1ac2 <strnlen+0xa6>
    1ab6:	0705                	addi	a4,a4,1
    1ab8:	fff74683          	lbu	a3,-1(a4)
    1abc:	faf5                	bnez	a3,1ab0 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1abe:	40a605b3          	sub	a1,a2,a0
}
    1ac2:	852e                	mv	a0,a1
    1ac4:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ac6:	87ae                	mv	a5,a1
    1ac8:	86aa                	mv	a3,a0
    if (n && *s != c)
    1aca:	8636                	mv	a2,a3
    1acc:	00064703          	lbu	a4,0(a2)
    1ad0:	bfe1                	j	1aa8 <strnlen+0x8c>
    1ad2:	0086c703          	lbu	a4,8(a3)
    1ad6:	bfc9                	j	1aa8 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ad8:	87ae                	mv	a5,a1
    1ada:	86aa                	mv	a3,a0
    if (n && *s != c)
    1adc:	f7a5                	bnez	a5,1a44 <strnlen+0x28>
    1ade:	b7d5                	j	1ac2 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ae0:	8636                	mv	a2,a3
    1ae2:	b7e1                	j	1aaa <strnlen+0x8e>

0000000000001ae4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ae4:	00b547b3          	xor	a5,a0,a1
    1ae8:	8b9d                	andi	a5,a5,7
    1aea:	efa9                	bnez	a5,1b44 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1aec:	0075f793          	andi	a5,a1,7
    1af0:	c38d                	beqz	a5,1b12 <strcpy+0x2e>
            if (!(*d = *s))
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	00f50023          	sb	a5,0(a0)
    1afa:	e799                	bnez	a5,1b08 <strcpy+0x24>
    1afc:	a095                	j	1b60 <strcpy+0x7c>
    1afe:	0005c783          	lbu	a5,0(a1)
    1b02:	00f50023          	sb	a5,0(a0)
    1b06:	cbb9                	beqz	a5,1b5c <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1b08:	0585                	addi	a1,a1,1
    1b0a:	0075f793          	andi	a5,a1,7
    1b0e:	0505                	addi	a0,a0,1
    1b10:	f7fd                	bnez	a5,1afe <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b12:	00000797          	auipc	a5,0x0
    1b16:	5e678793          	addi	a5,a5,1510 # 20f8 <__clone+0xb8>
    1b1a:	0007b803          	ld	a6,0(a5)
    1b1e:	00000797          	auipc	a5,0x0
    1b22:	5e278793          	addi	a5,a5,1506 # 2100 <__clone+0xc0>
    1b26:	6198                	ld	a4,0(a1)
    1b28:	6390                	ld	a2,0(a5)
    1b2a:	a031                	j	1b36 <strcpy+0x52>
    1b2c:	0521                	addi	a0,a0,8
    1b2e:	05a1                	addi	a1,a1,8
    1b30:	fee53c23          	sd	a4,-8(a0)
    1b34:	6198                	ld	a4,0(a1)
    1b36:	010707b3          	add	a5,a4,a6
    1b3a:	fff74693          	not	a3,a4
    1b3e:	8ff5                	and	a5,a5,a3
    1b40:	8ff1                	and	a5,a5,a2
    1b42:	d7ed                	beqz	a5,1b2c <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b44:	0005c783          	lbu	a5,0(a1)
    1b48:	00f50023          	sb	a5,0(a0)
    1b4c:	cb89                	beqz	a5,1b5e <strcpy+0x7a>
    1b4e:	0585                	addi	a1,a1,1
    1b50:	0005c783          	lbu	a5,0(a1)
    1b54:	0505                	addi	a0,a0,1
    1b56:	00f50023          	sb	a5,0(a0)
    1b5a:	fbf5                	bnez	a5,1b4e <strcpy+0x6a>
        ;
    return d;
}
    1b5c:	8082                	ret
    1b5e:	8082                	ret
    1b60:	8082                	ret

0000000000001b62 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b62:	00b547b3          	xor	a5,a0,a1
    1b66:	8b9d                	andi	a5,a5,7
    1b68:	ebc1                	bnez	a5,1bf8 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b6a:	0075f793          	andi	a5,a1,7
    1b6e:	cf91                	beqz	a5,1b8a <strncpy+0x28>
    1b70:	20060e63          	beqz	a2,1d8c <strncpy+0x22a>
    1b74:	0005c783          	lbu	a5,0(a1)
    1b78:	00f50023          	sb	a5,0(a0)
    1b7c:	c3d5                	beqz	a5,1c20 <strncpy+0xbe>
    1b7e:	0585                	addi	a1,a1,1
    1b80:	0075f793          	andi	a5,a1,7
    1b84:	167d                	addi	a2,a2,-1
    1b86:	0505                	addi	a0,a0,1
    1b88:	f7e5                	bnez	a5,1b70 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b8a:	20060163          	beqz	a2,1d8c <strncpy+0x22a>
    1b8e:	0005c683          	lbu	a3,0(a1)
    1b92:	c6d9                	beqz	a3,1c20 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b94:	479d                	li	a5,7
    1b96:	22c7f563          	bleu	a2,a5,1dc0 <strncpy+0x25e>
    1b9a:	00000317          	auipc	t1,0x0
    1b9e:	55e30313          	addi	t1,t1,1374 # 20f8 <__clone+0xb8>
    1ba2:	6198                	ld	a4,0(a1)
    1ba4:	00033783          	ld	a5,0(t1)
    1ba8:	00000e17          	auipc	t3,0x0
    1bac:	558e0e13          	addi	t3,t3,1368 # 2100 <__clone+0xc0>
    1bb0:	000e3803          	ld	a6,0(t3)
    1bb4:	97ba                	add	a5,a5,a4
    1bb6:	fff74893          	not	a7,a4
    1bba:	0117f7b3          	and	a5,a5,a7
    1bbe:	0107f7b3          	and	a5,a5,a6
    1bc2:	1e079f63          	bnez	a5,1dc0 <strncpy+0x25e>
    1bc6:	4e9d                	li	t4,7
    1bc8:	a005                	j	1be8 <strncpy+0x86>
    1bca:	6598                	ld	a4,8(a1)
    1bcc:	00033783          	ld	a5,0(t1)
    1bd0:	000e3803          	ld	a6,0(t3)
    1bd4:	fff74893          	not	a7,a4
    1bd8:	97ba                	add	a5,a5,a4
    1bda:	0117f7b3          	and	a5,a5,a7
    1bde:	0107f7b3          	and	a5,a5,a6
    1be2:	1a079f63          	bnez	a5,1da0 <strncpy+0x23e>
    1be6:	85b6                	mv	a1,a3
            *wd = *ws;
    1be8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bea:	1661                	addi	a2,a2,-8
    1bec:	00858693          	addi	a3,a1,8
    1bf0:	0521                	addi	a0,a0,8
    1bf2:	fcceece3          	bltu	t4,a2,1bca <strncpy+0x68>
    1bf6:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bf8:	18060a63          	beqz	a2,1d8c <strncpy+0x22a>
    1bfc:	0005c783          	lbu	a5,0(a1)
    1c00:	872a                	mv	a4,a0
    1c02:	00f50023          	sb	a5,0(a0)
    1c06:	e799                	bnez	a5,1c14 <strncpy+0xb2>
    1c08:	a829                	j	1c22 <strncpy+0xc0>
    1c0a:	0005c783          	lbu	a5,0(a1)
    1c0e:	00f70023          	sb	a5,0(a4)
    1c12:	cb81                	beqz	a5,1c22 <strncpy+0xc0>
    1c14:	167d                	addi	a2,a2,-1
    1c16:	0585                	addi	a1,a1,1
    1c18:	0705                	addi	a4,a4,1
    1c1a:	fa65                	bnez	a2,1c0a <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1c1c:	853a                	mv	a0,a4
    1c1e:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1c20:	872a                	mv	a4,a0
    1c22:	4805                	li	a6,1
    1c24:	14061c63          	bnez	a2,1d7c <strncpy+0x21a>
    1c28:	40e007b3          	neg	a5,a4
    1c2c:	8b9d                	andi	a5,a5,7
    1c2e:	4581                	li	a1,0
    1c30:	12061e63          	bnez	a2,1d6c <strncpy+0x20a>
    1c34:	00778693          	addi	a3,a5,7
    1c38:	452d                	li	a0,11
    1c3a:	12a6e763          	bltu	a3,a0,1d68 <strncpy+0x206>
    1c3e:	16d5e663          	bltu	a1,a3,1daa <strncpy+0x248>
    1c42:	14078c63          	beqz	a5,1d9a <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c46:	00070023          	sb	zero,0(a4)
    1c4a:	4585                	li	a1,1
    1c4c:	00170693          	addi	a3,a4,1
    1c50:	14b78363          	beq	a5,a1,1d96 <strncpy+0x234>
    1c54:	000700a3          	sb	zero,1(a4)
    1c58:	4589                	li	a1,2
    1c5a:	00270693          	addi	a3,a4,2
    1c5e:	14b78963          	beq	a5,a1,1db0 <strncpy+0x24e>
    1c62:	00070123          	sb	zero,2(a4)
    1c66:	458d                	li	a1,3
    1c68:	00370693          	addi	a3,a4,3
    1c6c:	12b78363          	beq	a5,a1,1d92 <strncpy+0x230>
    1c70:	000701a3          	sb	zero,3(a4)
    1c74:	4591                	li	a1,4
    1c76:	00470693          	addi	a3,a4,4
    1c7a:	12b78d63          	beq	a5,a1,1db4 <strncpy+0x252>
    1c7e:	00070223          	sb	zero,4(a4)
    1c82:	4595                	li	a1,5
    1c84:	00570693          	addi	a3,a4,5
    1c88:	12b78863          	beq	a5,a1,1db8 <strncpy+0x256>
    1c8c:	000702a3          	sb	zero,5(a4)
    1c90:	459d                	li	a1,7
    1c92:	00670693          	addi	a3,a4,6
    1c96:	12b79363          	bne	a5,a1,1dbc <strncpy+0x25a>
    1c9a:	00770693          	addi	a3,a4,7
    1c9e:	00070323          	sb	zero,6(a4)
    1ca2:	40f80833          	sub	a6,a6,a5
    1ca6:	ff887513          	andi	a0,a6,-8
    1caa:	97ba                	add	a5,a5,a4
    1cac:	953e                	add	a0,a0,a5
    1cae:	0007b023          	sd	zero,0(a5)
    1cb2:	07a1                	addi	a5,a5,8
    1cb4:	fea79de3          	bne	a5,a0,1cae <strncpy+0x14c>
    1cb8:	ff887513          	andi	a0,a6,-8
    1cbc:	9da9                	addw	a1,a1,a0
    1cbe:	00a687b3          	add	a5,a3,a0
    1cc2:	f4a80de3          	beq	a6,a0,1c1c <strncpy+0xba>
    1cc6:	00078023          	sb	zero,0(a5)
    1cca:	0015869b          	addiw	a3,a1,1
    1cce:	f4c6f7e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1cd2:	000780a3          	sb	zero,1(a5)
    1cd6:	0025869b          	addiw	a3,a1,2
    1cda:	f4c6f1e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1cde:	00078123          	sb	zero,2(a5)
    1ce2:	0035869b          	addiw	a3,a1,3
    1ce6:	f2c6fbe3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1cea:	000781a3          	sb	zero,3(a5)
    1cee:	0045869b          	addiw	a3,a1,4
    1cf2:	f2c6f5e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1cf6:	00078223          	sb	zero,4(a5)
    1cfa:	0055869b          	addiw	a3,a1,5
    1cfe:	f0c6ffe3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d02:	000782a3          	sb	zero,5(a5)
    1d06:	0065869b          	addiw	a3,a1,6
    1d0a:	f0c6f9e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d0e:	00078323          	sb	zero,6(a5)
    1d12:	0075869b          	addiw	a3,a1,7
    1d16:	f0c6f3e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d1a:	000783a3          	sb	zero,7(a5)
    1d1e:	0085869b          	addiw	a3,a1,8
    1d22:	eec6fde3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d26:	00078423          	sb	zero,8(a5)
    1d2a:	0095869b          	addiw	a3,a1,9
    1d2e:	eec6f7e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d32:	000784a3          	sb	zero,9(a5)
    1d36:	00a5869b          	addiw	a3,a1,10
    1d3a:	eec6f1e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d3e:	00078523          	sb	zero,10(a5)
    1d42:	00b5869b          	addiw	a3,a1,11
    1d46:	ecc6fbe3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d4a:	000785a3          	sb	zero,11(a5)
    1d4e:	00c5869b          	addiw	a3,a1,12
    1d52:	ecc6f5e3          	bleu	a2,a3,1c1c <strncpy+0xba>
    1d56:	00078623          	sb	zero,12(a5)
    1d5a:	25b5                	addiw	a1,a1,13
    1d5c:	ecc5f0e3          	bleu	a2,a1,1c1c <strncpy+0xba>
    1d60:	000786a3          	sb	zero,13(a5)
}
    1d64:	853a                	mv	a0,a4
    1d66:	8082                	ret
    1d68:	46ad                	li	a3,11
    1d6a:	bdd1                	j	1c3e <strncpy+0xdc>
    1d6c:	00778693          	addi	a3,a5,7
    1d70:	452d                	li	a0,11
    1d72:	fff60593          	addi	a1,a2,-1
    1d76:	eca6f4e3          	bleu	a0,a3,1c3e <strncpy+0xdc>
    1d7a:	b7fd                	j	1d68 <strncpy+0x206>
    1d7c:	40e007b3          	neg	a5,a4
    1d80:	8832                	mv	a6,a2
    1d82:	8b9d                	andi	a5,a5,7
    1d84:	4581                	li	a1,0
    1d86:	ea0607e3          	beqz	a2,1c34 <strncpy+0xd2>
    1d8a:	b7cd                	j	1d6c <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d8c:	872a                	mv	a4,a0
}
    1d8e:	853a                	mv	a0,a4
    1d90:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d92:	458d                	li	a1,3
    1d94:	b739                	j	1ca2 <strncpy+0x140>
    1d96:	4585                	li	a1,1
    1d98:	b729                	j	1ca2 <strncpy+0x140>
    1d9a:	86ba                	mv	a3,a4
    1d9c:	4581                	li	a1,0
    1d9e:	b711                	j	1ca2 <strncpy+0x140>
    1da0:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1da4:	872a                	mv	a4,a0
    1da6:	85b6                	mv	a1,a3
    1da8:	bda9                	j	1c02 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1daa:	87ba                	mv	a5,a4
    1dac:	4581                	li	a1,0
    1dae:	bf21                	j	1cc6 <strncpy+0x164>
    1db0:	4589                	li	a1,2
    1db2:	bdc5                	j	1ca2 <strncpy+0x140>
    1db4:	4591                	li	a1,4
    1db6:	b5f5                	j	1ca2 <strncpy+0x140>
    1db8:	4595                	li	a1,5
    1dba:	b5e5                	j	1ca2 <strncpy+0x140>
    1dbc:	4599                	li	a1,6
    1dbe:	b5d5                	j	1ca2 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1dc0:	00d50023          	sb	a3,0(a0)
    1dc4:	872a                	mv	a4,a0
    1dc6:	b5b9                	j	1c14 <strncpy+0xb2>

0000000000001dc8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1dc8:	87aa                	mv	a5,a0
    1dca:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1dcc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1dd0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dd4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1dd6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <openat>:
    register long a7 __asm__("a7") = n;
    1de0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1de4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1de8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <close>:
    register long a7 __asm__("a7") = n;
    1df0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <read>:
    register long a7 __asm__("a7") = n;
    1dfc:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e04:	8082                	ret

0000000000001e06 <write>:
    register long a7 __asm__("a7") = n;
    1e06:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e0e:	8082                	ret

0000000000001e10 <getpid>:
    register long a7 __asm__("a7") = n;
    1e10:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e14:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <getppid>:
    register long a7 __asm__("a7") = n;
    1e1c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1e20:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e28:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e2c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <fork>:
    register long a7 __asm__("a7") = n;
    1e34:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1e38:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1e3a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e44:	85b2                	mv	a1,a2
    1e46:	863a                	mv	a2,a4
    if (stack)
    1e48:	c191                	beqz	a1,1e4c <clone+0x8>
	stack += stack_size;
    1e4a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e4c:	4781                	li	a5,0
    1e4e:	4701                	li	a4,0
    1e50:	4681                	li	a3,0
    1e52:	2601                	sext.w	a2,a2
    1e54:	1ec0006f          	j	2040 <__clone>

0000000000001e58 <exit>:
    register long a7 __asm__("a7") = n;
    1e58:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e60:	8082                	ret

0000000000001e62 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e62:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e66:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e68:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <exec>:
    register long a7 __asm__("a7") = n;
    1e70:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e74:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <execve>:
    register long a7 __asm__("a7") = n;
    1e7c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e80:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <times>:
    register long a7 __asm__("a7") = n;
    1e88:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <get_time>:

int64 get_time()
{
    1e94:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e96:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e9a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e9c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	ed09                	bnez	a0,1ebe <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea6:	67a2                	ld	a5,8(sp)
    1ea8:	3e800713          	li	a4,1000
    1eac:	00015503          	lhu	a0,0(sp)
    1eb0:	02e7d7b3          	divu	a5,a5,a4
    1eb4:	02e50533          	mul	a0,a0,a4
    1eb8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eba:	0141                	addi	sp,sp,16
    1ebc:	8082                	ret
        return -1;
    1ebe:	557d                	li	a0,-1
    1ec0:	bfed                	j	1eba <get_time+0x26>

0000000000001ec2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ec2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <time>:
    register long a7 __asm__("a7") = n;
    1ece:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ed2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <sleep>:

int sleep(unsigned long long time)
{
    1eda:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1edc:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ede:	850a                	mv	a0,sp
    1ee0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ee2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ee6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eec:	e501                	bnez	a0,1ef4 <sleep+0x1a>
    return 0;
    1eee:	4501                	li	a0,0
}
    1ef0:	0141                	addi	sp,sp,16
    1ef2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ef4:	4502                	lw	a0,0(sp)
}
    1ef6:	0141                	addi	sp,sp,16
    1ef8:	8082                	ret

0000000000001efa <set_priority>:
    register long a7 __asm__("a7") = n;
    1efa:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1efe:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1f06:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1f0a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1f0e:	8082                	ret

0000000000001f10 <munmap>:
    register long a7 __asm__("a7") = n;
    1f10:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f14:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <wait>:

int wait(int *code)
{
    1f1c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f1e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f22:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1f24:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1f26:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1f28:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <spawn>:
    register long a7 __asm__("a7") = n;
    1f30:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f34:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <mailread>:
    register long a7 __asm__("a7") = n;
    1f3c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f40:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f48:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <fstat>:
    register long a7 __asm__("a7") = n;
    1f54:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f58:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f60:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f62:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f66:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f68:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f70:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f72:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f76:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f78:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <link>:

int link(char *old_path, char *new_path)
{
    1f80:	87aa                	mv	a5,a0
    1f82:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f84:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f8c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f8e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f92:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f94:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <unlink>:

int unlink(char *path)
{
    1f9c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f9e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fa2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fa6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <uname>:
    register long a7 __asm__("a7") = n;
    1fb0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1fb4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1fb8:	2501                	sext.w	a0,a0
    1fba:	8082                	ret

0000000000001fbc <brk>:
    register long a7 __asm__("a7") = n;
    1fbc:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1fc0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1fc8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fca:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1fce:	8082                	ret

0000000000001fd0 <chdir>:
    register long a7 __asm__("a7") = n;
    1fd0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1fd4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1fd8:	2501                	sext.w	a0,a0
    1fda:	8082                	ret

0000000000001fdc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1fdc:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1fde:	02059613          	slli	a2,a1,0x20
    1fe2:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fe4:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fe8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fec:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fee:	00000073          	ecall
}
    1ff2:	2501                	sext.w	a0,a0
    1ff4:	8082                	ret

0000000000001ff6 <getdents>:
    register long a7 __asm__("a7") = n;
    1ff6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ffa:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1ffe:	2501                	sext.w	a0,a0
    2000:	8082                	ret

0000000000002002 <pipe>:
    register long a7 __asm__("a7") = n;
    2002:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    2006:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2008:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    200c:	2501                	sext.w	a0,a0
    200e:	8082                	ret

0000000000002010 <dup>:
    register long a7 __asm__("a7") = n;
    2010:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    2012:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    2016:	2501                	sext.w	a0,a0
    2018:	8082                	ret

000000000000201a <dup2>:
    register long a7 __asm__("a7") = n;
    201a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    201c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    201e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    2022:	2501                	sext.w	a0,a0
    2024:	8082                	ret

0000000000002026 <mount>:
    register long a7 __asm__("a7") = n;
    2026:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    202a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    202e:	2501                	sext.w	a0,a0
    2030:	8082                	ret

0000000000002032 <umount>:
    register long a7 __asm__("a7") = n;
    2032:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    2036:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2038:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    203c:	2501                	sext.w	a0,a0
    203e:	8082                	ret

0000000000002040 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    2040:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    2042:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2044:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2046:	8532                	mv	a0,a2
	mv a2, a4
    2048:	863a                	mv	a2,a4
	mv a3, a5
    204a:	86be                	mv	a3,a5
	mv a4, a6
    204c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    204e:	0dc00893          	li	a7,220
	ecall
    2052:	00000073          	ecall

	beqz a0, 1f
    2056:	c111                	beqz	a0,205a <__clone+0x1a>
	# Parent
	ret
    2058:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    205a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    205c:	6522                	ld	a0,8(sp)
	jalr a1
    205e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2060:	05d00893          	li	a7,93
	ecall
    2064:	00000073          	ecall
