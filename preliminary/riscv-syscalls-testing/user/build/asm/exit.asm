
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/exit:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0ae0006f          	j	10b0 <__start_main>

0000000000001006 <test_exit>:
 * 测试成功则输出：
 * "exit OK."
 * 测试失败则输出：
 * "exit ERR."
 */
void test_exit(void){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fe050513          	addi	a0,a0,-32 # 1fe8 <__clone+0x28>
void test_exit(void){
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    1014:	29c000ef          	jal	ra,12b0 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	06850513          	addi	a0,a0,104 # 2080 <__func__.1186>
    1020:	290000ef          	jal	ra,12b0 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fdc50513          	addi	a0,a0,-36 # 2000 <__clone+0x40>
    102c:	284000ef          	jal	ra,12b0 <puts>
    int cpid, waitret, wstatus;
    cpid = fork();
    1030:	585000ef          	jal	ra,1db4 <fork>
    assert(cpid != -1);
    1034:	57fd                	li	a5,-1
    cpid = fork();
    1036:	842a                	mv	s0,a0
    assert(cpid != -1);
    1038:	02f50b63          	beq	a0,a5,106e <test_exit+0x68>
    if(cpid == 0){
    103c:	ed1d                	bnez	a0,107a <test_exit+0x74>
        exit(0);
    103e:	59b000ef          	jal	ra,1dd8 <exit>
    }else{
        waitret = wait(&wstatus);
        if(waitret == cpid) printf("exit OK.\n");
        else printf("exit ERR.\n");
    }
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	00e50513          	addi	a0,a0,14 # 2050 <__clone+0x90>
    104a:	266000ef          	jal	ra,12b0 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	03250513          	addi	a0,a0,50 # 2080 <__func__.1186>
    1056:	25a000ef          	jal	ra,12b0 <puts>
    105a:	00001517          	auipc	a0,0x1
    105e:	fa650513          	addi	a0,a0,-90 # 2000 <__clone+0x40>
    1062:	24e000ef          	jal	ra,12b0 <puts>
}
    1066:	60e2                	ld	ra,24(sp)
    1068:	6442                	ld	s0,16(sp)
    106a:	6105                	addi	sp,sp,32
    106c:	8082                	ret
    assert(cpid != -1);
    106e:	00001517          	auipc	a0,0x1
    1072:	fa250513          	addi	a0,a0,-94 # 2010 <__clone+0x50>
    1076:	500000ef          	jal	ra,1576 <panic>
        waitret = wait(&wstatus);
    107a:	0068                	addi	a0,sp,12
    107c:	621000ef          	jal	ra,1e9c <wait>
        if(waitret == cpid) printf("exit OK.\n");
    1080:	00a40963          	beq	s0,a0,1092 <test_exit+0x8c>
        else printf("exit ERR.\n");
    1084:	00001517          	auipc	a0,0x1
    1088:	fbc50513          	addi	a0,a0,-68 # 2040 <__clone+0x80>
    108c:	246000ef          	jal	ra,12d2 <printf>
    1090:	bf4d                	j	1042 <test_exit+0x3c>
        if(waitret == cpid) printf("exit OK.\n");
    1092:	00001517          	auipc	a0,0x1
    1096:	f9e50513          	addi	a0,a0,-98 # 2030 <__clone+0x70>
    109a:	238000ef          	jal	ra,12d2 <printf>
    109e:	b755                	j	1042 <test_exit+0x3c>

00000000000010a0 <main>:

int main(void){
    10a0:	1141                	addi	sp,sp,-16
    10a2:	e406                	sd	ra,8(sp)
    test_exit();
    10a4:	f63ff0ef          	jal	ra,1006 <test_exit>
    return 0;
}
    10a8:	60a2                	ld	ra,8(sp)
    10aa:	4501                	li	a0,0
    10ac:	0141                	addi	sp,sp,16
    10ae:	8082                	ret

00000000000010b0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b2:	4108                	lw	a0,0(a0)
{
    10b4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b6:	05a1                	addi	a1,a1,8
{
    10b8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ba:	fe7ff0ef          	jal	ra,10a0 <main>
    10be:	51b000ef          	jal	ra,1dd8 <exit>
	return 0;
}
    10c2:	60a2                	ld	ra,8(sp)
    10c4:	4501                	li	a0,0
    10c6:	0141                	addi	sp,sp,16
    10c8:	8082                	ret

00000000000010ca <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ca:	7179                	addi	sp,sp,-48
    10cc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ce:	12054e63          	bltz	a0,120a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10d2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10d6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d8:	02b7f6bb          	remuw	a3,a5,a1
    10dc:	00001717          	auipc	a4,0x1
    10e0:	fb470713          	addi	a4,a4,-76 # 2090 <digits>
    buf[16] = 0;
    10e4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e8:	1682                	slli	a3,a3,0x20
    10ea:	9281                	srli	a3,a3,0x20
    10ec:	96ba                	add	a3,a3,a4
    10ee:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10f2:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10f6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10fa:	16b7e363          	bltu	a5,a1,1260 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10fe:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1102:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1106:	1602                	slli	a2,a2,0x20
    1108:	9201                	srli	a2,a2,0x20
    110a:	963a                	add	a2,a2,a4
    110c:	00064603          	lbu	a2,0(a2)
    1110:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1114:	0007861b          	sext.w	a2,a5
    1118:	12b6e863          	bltu	a3,a1,1248 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    111c:	02b7f6bb          	remuw	a3,a5,a1
    1120:	1682                	slli	a3,a3,0x20
    1122:	9281                	srli	a3,a3,0x20
    1124:	96ba                	add	a3,a3,a4
    1126:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    112a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    112e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1132:	10b66e63          	bltu	a2,a1,124e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1136:	02b876bb          	remuw	a3,a6,a1
    113a:	1682                	slli	a3,a3,0x20
    113c:	9281                	srli	a3,a3,0x20
    113e:	96ba                	add	a3,a3,a4
    1140:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1144:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1148:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    114c:	10b86463          	bltu	a6,a1,1254 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1150:	02b676bb          	remuw	a3,a2,a1
    1154:	1682                	slli	a3,a3,0x20
    1156:	9281                	srli	a3,a3,0x20
    1158:	96ba                	add	a3,a3,a4
    115a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1162:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1166:	0eb66a63          	bltu	a2,a1,125a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    116a:	02b876bb          	remuw	a3,a6,a1
    116e:	1682                	slli	a3,a3,0x20
    1170:	9281                	srli	a3,a3,0x20
    1172:	96ba                	add	a3,a3,a4
    1174:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1178:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    117c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1180:	0cb86163          	bltu	a6,a1,1242 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1184:	02b676bb          	remuw	a3,a2,a1
    1188:	1682                	slli	a3,a3,0x20
    118a:	9281                	srli	a3,a3,0x20
    118c:	96ba                	add	a3,a3,a4
    118e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1192:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1196:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    119a:	0cb66563          	bltu	a2,a1,1264 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    119e:	02b876bb          	remuw	a3,a6,a1
    11a2:	1682                	slli	a3,a3,0x20
    11a4:	9281                	srli	a3,a3,0x20
    11a6:	96ba                	add	a3,a3,a4
    11a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ac:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11b0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11b4:	0ab86b63          	bltu	a6,a1,126a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11b8:	02b676bb          	remuw	a3,a2,a1
    11bc:	1682                	slli	a3,a3,0x20
    11be:	9281                	srli	a3,a3,0x20
    11c0:	96ba                	add	a3,a3,a4
    11c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ca:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ce:	0ab66163          	bltu	a2,a1,1270 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11d2:	1782                	slli	a5,a5,0x20
    11d4:	9381                	srli	a5,a5,0x20
    11d6:	97ba                	add	a5,a5,a4
    11d8:	0007c703          	lbu	a4,0(a5)
    11dc:	4599                	li	a1,6
    11de:	4795                	li	a5,5
    11e0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11e4:	00055963          	bgez	a0,11f6 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e8:	1018                	addi	a4,sp,32
    11ea:	973e                	add	a4,a4,a5
    11ec:	02d00693          	li	a3,45
    11f0:	fed70423          	sb	a3,-24(a4)
    11f4:	85be                	mv	a1,a5
    write(f, s, l);
    11f6:	003c                	addi	a5,sp,8
    11f8:	4641                	li	a2,16
    11fa:	9e0d                	subw	a2,a2,a1
    11fc:	4505                	li	a0,1
    11fe:	95be                	add	a1,a1,a5
    1200:	387000ef          	jal	ra,1d86 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1204:	70a2                	ld	ra,40(sp)
    1206:	6145                	addi	sp,sp,48
    1208:	8082                	ret
        x = -xx;
    120a:	40a0063b          	negw	a2,a0
    120e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1210:	02b677bb          	remuw	a5,a2,a1
    1214:	00001717          	auipc	a4,0x1
    1218:	e7c70713          	addi	a4,a4,-388 # 2090 <digits>
    buf[16] = 0;
    121c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1220:	1782                	slli	a5,a5,0x20
    1222:	9381                	srli	a5,a5,0x20
    1224:	97ba                	add	a5,a5,a4
    1226:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    122e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1232:	ecb676e3          	bleu	a1,a2,10fe <printint.constprop.0+0x34>
        buf[i--] = '-';
    1236:	02d00793          	li	a5,45
    123a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123e:	45b9                	li	a1,14
    1240:	bf5d                	j	11f6 <printint.constprop.0+0x12c>
    1242:	47a5                	li	a5,9
    1244:	45a9                	li	a1,10
    1246:	bf79                	j	11e4 <printint.constprop.0+0x11a>
    1248:	47b5                	li	a5,13
    124a:	45b9                	li	a1,14
    124c:	bf61                	j	11e4 <printint.constprop.0+0x11a>
    124e:	47b1                	li	a5,12
    1250:	45b5                	li	a1,13
    1252:	bf49                	j	11e4 <printint.constprop.0+0x11a>
    1254:	47ad                	li	a5,11
    1256:	45b1                	li	a1,12
    1258:	b771                	j	11e4 <printint.constprop.0+0x11a>
    125a:	47a9                	li	a5,10
    125c:	45ad                	li	a1,11
    125e:	b759                	j	11e4 <printint.constprop.0+0x11a>
    i = 15;
    1260:	45bd                	li	a1,15
    1262:	bf51                	j	11f6 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1264:	47a1                	li	a5,8
    1266:	45a5                	li	a1,9
    1268:	bfb5                	j	11e4 <printint.constprop.0+0x11a>
    126a:	479d                	li	a5,7
    126c:	45a1                	li	a1,8
    126e:	bf9d                	j	11e4 <printint.constprop.0+0x11a>
    1270:	4799                	li	a5,6
    1272:	459d                	li	a1,7
    1274:	bf85                	j	11e4 <printint.constprop.0+0x11a>

0000000000001276 <getchar>:
{
    1276:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1278:	00f10593          	addi	a1,sp,15
    127c:	4605                	li	a2,1
    127e:	4501                	li	a0,0
{
    1280:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1282:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1286:	2f7000ef          	jal	ra,1d7c <read>
}
    128a:	60e2                	ld	ra,24(sp)
    128c:	00f14503          	lbu	a0,15(sp)
    1290:	6105                	addi	sp,sp,32
    1292:	8082                	ret

0000000000001294 <putchar>:
{
    1294:	1101                	addi	sp,sp,-32
    char byte = c;
    1296:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    129a:	00f10593          	addi	a1,sp,15
    129e:	4605                	li	a2,1
    12a0:	4505                	li	a0,1
{
    12a2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12a4:	2e3000ef          	jal	ra,1d86 <write>
}
    12a8:	60e2                	ld	ra,24(sp)
    12aa:	2501                	sext.w	a0,a0
    12ac:	6105                	addi	sp,sp,32
    12ae:	8082                	ret

00000000000012b0 <puts>:
{
    12b0:	1141                	addi	sp,sp,-16
    12b2:	e406                	sd	ra,8(sp)
    12b4:	e022                	sd	s0,0(sp)
    12b6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b8:	5b2000ef          	jal	ra,186a <strlen>
    12bc:	862a                	mv	a2,a0
    12be:	85a2                	mv	a1,s0
    12c0:	4505                	li	a0,1
    12c2:	2c5000ef          	jal	ra,1d86 <write>
}
    12c6:	60a2                	ld	ra,8(sp)
    12c8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ca:	957d                	srai	a0,a0,0x3f
    return r;
    12cc:	2501                	sext.w	a0,a0
}
    12ce:	0141                	addi	sp,sp,16
    12d0:	8082                	ret

00000000000012d2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d2:	7131                	addi	sp,sp,-192
    12d4:	e0da                	sd	s6,64(sp)
    12d6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12d8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12da:	013c                	addi	a5,sp,136
{
    12dc:	f0ca                	sd	s2,96(sp)
    12de:	ecce                	sd	s3,88(sp)
    12e0:	e8d2                	sd	s4,80(sp)
    12e2:	e4d6                	sd	s5,72(sp)
    12e4:	fc5e                	sd	s7,56(sp)
    12e6:	fc86                	sd	ra,120(sp)
    12e8:	f8a2                	sd	s0,112(sp)
    12ea:	f4a6                	sd	s1,104(sp)
    12ec:	89aa                	mv	s3,a0
    12ee:	e52e                	sd	a1,136(sp)
    12f0:	e932                	sd	a2,144(sp)
    12f2:	ed36                	sd	a3,152(sp)
    12f4:	f13a                	sd	a4,160(sp)
    12f6:	f942                	sd	a6,176(sp)
    12f8:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12fa:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12fc:	02500913          	li	s2,37
    1300:	07000a93          	li	s5,112
    buf[i++] = '0';
    1304:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1308:	00001a17          	auipc	s4,0x1
    130c:	d88a0a13          	addi	s4,s4,-632 # 2090 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1310:	00001b97          	auipc	s7,0x1
    1314:	d50b8b93          	addi	s7,s7,-688 # 2060 <__clone+0xa0>
        if (!*s)
    1318:	0009c783          	lbu	a5,0(s3)
    131c:	cfb9                	beqz	a5,137a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    131e:	23278d63          	beq	a5,s2,1558 <printf+0x286>
    1322:	864e                	mv	a2,s3
    1324:	a019                	j	132a <printf+0x58>
    1326:	07278563          	beq	a5,s2,1390 <printf+0xbe>
    132a:	0605                	addi	a2,a2,1
    132c:	00064783          	lbu	a5,0(a2)
    1330:	fbfd                	bnez	a5,1326 <printf+0x54>
    1332:	84b2                	mv	s1,a2
        l = z - a;
    1334:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1338:	8622                	mv	a2,s0
    133a:	85ce                	mv	a1,s3
    133c:	4505                	li	a0,1
    133e:	249000ef          	jal	ra,1d86 <write>
        if (l)
    1342:	ec3d                	bnez	s0,13c0 <printf+0xee>
        if (s[1] == 0)
    1344:	0014c783          	lbu	a5,1(s1)
    1348:	cb8d                	beqz	a5,137a <printf+0xa8>
        switch (s[1])
    134a:	09578b63          	beq	a5,s5,13e0 <printf+0x10e>
    134e:	06fafb63          	bleu	a5,s5,13c4 <printf+0xf2>
    1352:	07300713          	li	a4,115
    1356:	1ce78e63          	beq	a5,a4,1532 <printf+0x260>
    135a:	07800713          	li	a4,120
    135e:	1ae79563          	bne	a5,a4,1508 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1362:	6782                	ld	a5,0(sp)
    1364:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1366:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    136a:	4388                	lw	a0,0(a5)
    136c:	07a1                	addi	a5,a5,8
    136e:	e03e                	sd	a5,0(sp)
    1370:	d5bff0ef          	jal	ra,10ca <printint.constprop.0>
        if (!*s)
    1374:	0009c783          	lbu	a5,0(s3)
    1378:	f3dd                	bnez	a5,131e <printf+0x4c>
    }
    va_end(ap);
}
    137a:	70e6                	ld	ra,120(sp)
    137c:	7446                	ld	s0,112(sp)
    137e:	74a6                	ld	s1,104(sp)
    1380:	7906                	ld	s2,96(sp)
    1382:	69e6                	ld	s3,88(sp)
    1384:	6a46                	ld	s4,80(sp)
    1386:	6aa6                	ld	s5,72(sp)
    1388:	6b06                	ld	s6,64(sp)
    138a:	7be2                	ld	s7,56(sp)
    138c:	6129                	addi	sp,sp,192
    138e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1390:	00164783          	lbu	a5,1(a2)
    1394:	84b2                	mv	s1,a2
    1396:	01278763          	beq	a5,s2,13a4 <printf+0xd2>
    139a:	bf69                	j	1334 <printf+0x62>
    139c:	0014c783          	lbu	a5,1(s1)
    13a0:	f9279ae3          	bne	a5,s2,1334 <printf+0x62>
    13a4:	0489                	addi	s1,s1,2
    13a6:	0004c783          	lbu	a5,0(s1)
    13aa:	0605                	addi	a2,a2,1
    13ac:	ff2788e3          	beq	a5,s2,139c <printf+0xca>
        l = z - a;
    13b0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13b4:	8622                	mv	a2,s0
    13b6:	85ce                	mv	a1,s3
    13b8:	4505                	li	a0,1
    13ba:	1cd000ef          	jal	ra,1d86 <write>
        if (l)
    13be:	d059                	beqz	s0,1344 <printf+0x72>
    13c0:	89a6                	mv	s3,s1
    13c2:	bf99                	j	1318 <printf+0x46>
    13c4:	06400713          	li	a4,100
    13c8:	14e79063          	bne	a5,a4,1508 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13cc:	6782                	ld	a5,0(sp)
    13ce:	45a9                	li	a1,10
        s += 2;
    13d0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13d4:	4388                	lw	a0,0(a5)
    13d6:	07a1                	addi	a5,a5,8
    13d8:	e03e                	sd	a5,0(sp)
    13da:	cf1ff0ef          	jal	ra,10ca <printint.constprop.0>
        s += 2;
    13de:	bf59                	j	1374 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13e0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13e6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13e8:	631c                	ld	a5,0(a4)
    13ea:	0721                	addi	a4,a4,8
    13ec:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ee:	00479293          	slli	t0,a5,0x4
    13f2:	00879f93          	slli	t6,a5,0x8
    13f6:	00c79f13          	slli	t5,a5,0xc
    13fa:	01079e93          	slli	t4,a5,0x10
    13fe:	01479e13          	slli	t3,a5,0x14
    1402:	01879313          	slli	t1,a5,0x18
    1406:	01c79893          	slli	a7,a5,0x1c
    140a:	02479813          	slli	a6,a5,0x24
    140e:	02879513          	slli	a0,a5,0x28
    1412:	02c79593          	slli	a1,a5,0x2c
    1416:	03079693          	slli	a3,a5,0x30
    141a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141e:	03c7d413          	srli	s0,a5,0x3c
    1422:	01c7d39b          	srliw	t2,a5,0x1c
    1426:	03c2d293          	srli	t0,t0,0x3c
    142a:	03cfdf93          	srli	t6,t6,0x3c
    142e:	03cf5f13          	srli	t5,t5,0x3c
    1432:	03cede93          	srli	t4,t4,0x3c
    1436:	03ce5e13          	srli	t3,t3,0x3c
    143a:	03c35313          	srli	t1,t1,0x3c
    143e:	03c8d893          	srli	a7,a7,0x3c
    1442:	03c85813          	srli	a6,a6,0x3c
    1446:	9171                	srli	a0,a0,0x3c
    1448:	91f1                	srli	a1,a1,0x3c
    144a:	92f1                	srli	a3,a3,0x3c
    144c:	9371                	srli	a4,a4,0x3c
    144e:	96d2                	add	a3,a3,s4
    1450:	9752                	add	a4,a4,s4
    1452:	9452                	add	s0,s0,s4
    1454:	92d2                	add	t0,t0,s4
    1456:	9fd2                	add	t6,t6,s4
    1458:	9f52                	add	t5,t5,s4
    145a:	9ed2                	add	t4,t4,s4
    145c:	9e52                	add	t3,t3,s4
    145e:	9352                	add	t1,t1,s4
    1460:	98d2                	add	a7,a7,s4
    1462:	93d2                	add	t2,t2,s4
    1464:	9852                	add	a6,a6,s4
    1466:	9552                	add	a0,a0,s4
    1468:	95d2                	add	a1,a1,s4
    146a:	0006c983          	lbu	s3,0(a3)
    146e:	0002c283          	lbu	t0,0(t0)
    1472:	00074683          	lbu	a3,0(a4)
    1476:	000fcf83          	lbu	t6,0(t6)
    147a:	000f4f03          	lbu	t5,0(t5)
    147e:	000ece83          	lbu	t4,0(t4)
    1482:	000e4e03          	lbu	t3,0(t3)
    1486:	00034303          	lbu	t1,0(t1)
    148a:	0008c883          	lbu	a7,0(a7)
    148e:	0003c383          	lbu	t2,0(t2)
    1492:	00084803          	lbu	a6,0(a6)
    1496:	00054503          	lbu	a0,0(a0)
    149a:	0005c583          	lbu	a1,0(a1)
    149e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a6:	9371                	srli	a4,a4,0x3c
    14a8:	8bbd                	andi	a5,a5,15
    14aa:	9752                	add	a4,a4,s4
    14ac:	97d2                	add	a5,a5,s4
    14ae:	005105a3          	sb	t0,11(sp)
    14b2:	01f10623          	sb	t6,12(sp)
    14b6:	01e106a3          	sb	t5,13(sp)
    14ba:	01d10723          	sb	t4,14(sp)
    14be:	01c107a3          	sb	t3,15(sp)
    14c2:	00610823          	sb	t1,16(sp)
    14c6:	011108a3          	sb	a7,17(sp)
    14ca:	00710923          	sb	t2,18(sp)
    14ce:	010109a3          	sb	a6,19(sp)
    14d2:	00a10a23          	sb	a0,20(sp)
    14d6:	00b10aa3          	sb	a1,21(sp)
    14da:	01310b23          	sb	s3,22(sp)
    14de:	00d10ba3          	sb	a3,23(sp)
    14e2:	00810523          	sb	s0,10(sp)
    14e6:	00074703          	lbu	a4,0(a4)
    14ea:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ee:	002c                	addi	a1,sp,8
    14f0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f2:	00e10c23          	sb	a4,24(sp)
    14f6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14fa:	00010d23          	sb	zero,26(sp)
        s += 2;
    14fe:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1502:	085000ef          	jal	ra,1d86 <write>
        s += 2;
    1506:	b5bd                	j	1374 <printf+0xa2>
    char byte = c;
    1508:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    150c:	4605                	li	a2,1
    150e:	002c                	addi	a1,sp,8
    1510:	4505                	li	a0,1
    char byte = c;
    1512:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1516:	071000ef          	jal	ra,1d86 <write>
    char byte = c;
    151a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    151e:	4605                	li	a2,1
    1520:	002c                	addi	a1,sp,8
    1522:	4505                	li	a0,1
    char byte = c;
    1524:	00f10423          	sb	a5,8(sp)
        s += 2;
    1528:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    152c:	05b000ef          	jal	ra,1d86 <write>
        s += 2;
    1530:	b591                	j	1374 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1532:	6782                	ld	a5,0(sp)
    1534:	6380                	ld	s0,0(a5)
    1536:	07a1                	addi	a5,a5,8
    1538:	e03e                	sd	a5,0(sp)
    153a:	cc05                	beqz	s0,1572 <printf+0x2a0>
            l = strnlen(a, 200);
    153c:	0c800593          	li	a1,200
    1540:	8522                	mv	a0,s0
    1542:	45a000ef          	jal	ra,199c <strnlen>
    write(f, s, l);
    1546:	0005061b          	sext.w	a2,a0
    154a:	85a2                	mv	a1,s0
    154c:	4505                	li	a0,1
    154e:	039000ef          	jal	ra,1d86 <write>
        s += 2;
    1552:	00248993          	addi	s3,s1,2
    1556:	bd39                	j	1374 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1558:	0019c783          	lbu	a5,1(s3)
    155c:	84ce                	mv	s1,s3
    155e:	864e                	mv	a2,s3
    1560:	e52782e3          	beq	a5,s2,13a4 <printf+0xd2>
    write(f, s, l);
    1564:	4601                	li	a2,0
    1566:	85ce                	mv	a1,s3
    1568:	4505                	li	a0,1
    156a:	01d000ef          	jal	ra,1d86 <write>
    156e:	84ce                	mv	s1,s3
    1570:	bbd1                	j	1344 <printf+0x72>
                a = "(null)";
    1572:	845e                	mv	s0,s7
    1574:	b7e1                	j	153c <printf+0x26a>

0000000000001576 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1576:	1141                	addi	sp,sp,-16
    1578:	e406                	sd	ra,8(sp)
    puts(m);
    157a:	d37ff0ef          	jal	ra,12b0 <puts>
    exit(-100);
}
    157e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1580:	f9c00513          	li	a0,-100
}
    1584:	0141                	addi	sp,sp,16
    exit(-100);
    1586:	0530006f          	j	1dd8 <exit>

000000000000158a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    158a:	02000793          	li	a5,32
    158e:	00f50663          	beq	a0,a5,159a <isspace+0x10>
    1592:	355d                	addiw	a0,a0,-9
    1594:	00553513          	sltiu	a0,a0,5
    1598:	8082                	ret
    159a:	4505                	li	a0,1
}
    159c:	8082                	ret

000000000000159e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159e:	fd05051b          	addiw	a0,a0,-48
}
    15a2:	00a53513          	sltiu	a0,a0,10
    15a6:	8082                	ret

00000000000015a8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a8:	02000613          	li	a2,32
    15ac:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ae:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b2:	0007079b          	sext.w	a5,a4
    15b6:	ff77869b          	addiw	a3,a5,-9
    15ba:	04c70b63          	beq	a4,a2,1610 <atoi+0x68>
    15be:	04d5f963          	bleu	a3,a1,1610 <atoi+0x68>
        s++;
    switch (*s)
    15c2:	02b00693          	li	a3,43
    15c6:	04d70a63          	beq	a4,a3,161a <atoi+0x72>
    15ca:	02d00693          	li	a3,45
    15ce:	06d70463          	beq	a4,a3,1636 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d2:	fd07859b          	addiw	a1,a5,-48
    15d6:	4625                	li	a2,9
    15d8:	873e                	mv	a4,a5
    15da:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15dc:	4e01                	li	t3,0
    while (isdigit(*s))
    15de:	04b66a63          	bltu	a2,a1,1632 <atoi+0x8a>
    int n = 0, neg = 0;
    15e2:	4501                	li	a0,0
    while (isdigit(*s))
    15e4:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15e6:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15e8:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15ec:	0025179b          	slliw	a5,a0,0x2
    15f0:	9d3d                	addw	a0,a0,a5
    15f2:	fd07031b          	addiw	t1,a4,-48
    15f6:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15fa:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15fe:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1602:	0006071b          	sext.w	a4,a2
    1606:	feb870e3          	bleu	a1,a6,15e6 <atoi+0x3e>
    return neg ? n : -n;
    160a:	000e0563          	beqz	t3,1614 <atoi+0x6c>
}
    160e:	8082                	ret
        s++;
    1610:	0505                	addi	a0,a0,1
    1612:	bf71                	j	15ae <atoi+0x6>
    1614:	4113053b          	subw	a0,t1,a7
    1618:	8082                	ret
    while (isdigit(*s))
    161a:	00154783          	lbu	a5,1(a0)
    161e:	4625                	li	a2,9
        s++;
    1620:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1624:	fd07859b          	addiw	a1,a5,-48
    1628:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    162c:	4e01                	li	t3,0
    while (isdigit(*s))
    162e:	fab67ae3          	bleu	a1,a2,15e2 <atoi+0x3a>
    1632:	4501                	li	a0,0
}
    1634:	8082                	ret
    while (isdigit(*s))
    1636:	00154783          	lbu	a5,1(a0)
    163a:	4625                	li	a2,9
        s++;
    163c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1640:	fd07859b          	addiw	a1,a5,-48
    1644:	0007871b          	sext.w	a4,a5
    1648:	feb665e3          	bltu	a2,a1,1632 <atoi+0x8a>
        neg = 1;
    164c:	4e05                	li	t3,1
    164e:	bf51                	j	15e2 <atoi+0x3a>

0000000000001650 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1650:	16060d63          	beqz	a2,17ca <memset+0x17a>
    1654:	40a007b3          	neg	a5,a0
    1658:	8b9d                	andi	a5,a5,7
    165a:	00778713          	addi	a4,a5,7
    165e:	482d                	li	a6,11
    1660:	0ff5f593          	andi	a1,a1,255
    1664:	fff60693          	addi	a3,a2,-1
    1668:	17076263          	bltu	a4,a6,17cc <memset+0x17c>
    166c:	16e6ea63          	bltu	a3,a4,17e0 <memset+0x190>
    1670:	16078563          	beqz	a5,17da <memset+0x18a>
    1674:	00b50023          	sb	a1,0(a0)
    1678:	4705                	li	a4,1
    167a:	00150e93          	addi	t4,a0,1
    167e:	14e78c63          	beq	a5,a4,17d6 <memset+0x186>
    1682:	00b500a3          	sb	a1,1(a0)
    1686:	4709                	li	a4,2
    1688:	00250e93          	addi	t4,a0,2
    168c:	14e78d63          	beq	a5,a4,17e6 <memset+0x196>
    1690:	00b50123          	sb	a1,2(a0)
    1694:	470d                	li	a4,3
    1696:	00350e93          	addi	t4,a0,3
    169a:	12e78b63          	beq	a5,a4,17d0 <memset+0x180>
    169e:	00b501a3          	sb	a1,3(a0)
    16a2:	4711                	li	a4,4
    16a4:	00450e93          	addi	t4,a0,4
    16a8:	14e78163          	beq	a5,a4,17ea <memset+0x19a>
    16ac:	00b50223          	sb	a1,4(a0)
    16b0:	4715                	li	a4,5
    16b2:	00550e93          	addi	t4,a0,5
    16b6:	12e78c63          	beq	a5,a4,17ee <memset+0x19e>
    16ba:	00b502a3          	sb	a1,5(a0)
    16be:	471d                	li	a4,7
    16c0:	00650e93          	addi	t4,a0,6
    16c4:	12e79763          	bne	a5,a4,17f2 <memset+0x1a2>
    16c8:	00750e93          	addi	t4,a0,7
    16cc:	00b50323          	sb	a1,6(a0)
    16d0:	4f1d                	li	t5,7
    16d2:	00859713          	slli	a4,a1,0x8
    16d6:	8f4d                	or	a4,a4,a1
    16d8:	01059e13          	slli	t3,a1,0x10
    16dc:	01c76e33          	or	t3,a4,t3
    16e0:	01859313          	slli	t1,a1,0x18
    16e4:	006e6333          	or	t1,t3,t1
    16e8:	02059893          	slli	a7,a1,0x20
    16ec:	011368b3          	or	a7,t1,a7
    16f0:	02859813          	slli	a6,a1,0x28
    16f4:	40f60333          	sub	t1,a2,a5
    16f8:	0108e833          	or	a6,a7,a6
    16fc:	03059693          	slli	a3,a1,0x30
    1700:	00d866b3          	or	a3,a6,a3
    1704:	03859713          	slli	a4,a1,0x38
    1708:	97aa                	add	a5,a5,a0
    170a:	ff837813          	andi	a6,t1,-8
    170e:	8f55                	or	a4,a4,a3
    1710:	00f806b3          	add	a3,a6,a5
    1714:	e398                	sd	a4,0(a5)
    1716:	07a1                	addi	a5,a5,8
    1718:	fed79ee3          	bne	a5,a3,1714 <memset+0xc4>
    171c:	ff837693          	andi	a3,t1,-8
    1720:	00de87b3          	add	a5,t4,a3
    1724:	01e6873b          	addw	a4,a3,t5
    1728:	0ad30663          	beq	t1,a3,17d4 <memset+0x184>
    172c:	00b78023          	sb	a1,0(a5)
    1730:	0017069b          	addiw	a3,a4,1
    1734:	08c6fb63          	bleu	a2,a3,17ca <memset+0x17a>
    1738:	00b780a3          	sb	a1,1(a5)
    173c:	0027069b          	addiw	a3,a4,2
    1740:	08c6f563          	bleu	a2,a3,17ca <memset+0x17a>
    1744:	00b78123          	sb	a1,2(a5)
    1748:	0037069b          	addiw	a3,a4,3
    174c:	06c6ff63          	bleu	a2,a3,17ca <memset+0x17a>
    1750:	00b781a3          	sb	a1,3(a5)
    1754:	0047069b          	addiw	a3,a4,4
    1758:	06c6f963          	bleu	a2,a3,17ca <memset+0x17a>
    175c:	00b78223          	sb	a1,4(a5)
    1760:	0057069b          	addiw	a3,a4,5
    1764:	06c6f363          	bleu	a2,a3,17ca <memset+0x17a>
    1768:	00b782a3          	sb	a1,5(a5)
    176c:	0067069b          	addiw	a3,a4,6
    1770:	04c6fd63          	bleu	a2,a3,17ca <memset+0x17a>
    1774:	00b78323          	sb	a1,6(a5)
    1778:	0077069b          	addiw	a3,a4,7
    177c:	04c6f763          	bleu	a2,a3,17ca <memset+0x17a>
    1780:	00b783a3          	sb	a1,7(a5)
    1784:	0087069b          	addiw	a3,a4,8
    1788:	04c6f163          	bleu	a2,a3,17ca <memset+0x17a>
    178c:	00b78423          	sb	a1,8(a5)
    1790:	0097069b          	addiw	a3,a4,9
    1794:	02c6fb63          	bleu	a2,a3,17ca <memset+0x17a>
    1798:	00b784a3          	sb	a1,9(a5)
    179c:	00a7069b          	addiw	a3,a4,10
    17a0:	02c6f563          	bleu	a2,a3,17ca <memset+0x17a>
    17a4:	00b78523          	sb	a1,10(a5)
    17a8:	00b7069b          	addiw	a3,a4,11
    17ac:	00c6ff63          	bleu	a2,a3,17ca <memset+0x17a>
    17b0:	00b785a3          	sb	a1,11(a5)
    17b4:	00c7069b          	addiw	a3,a4,12
    17b8:	00c6f963          	bleu	a2,a3,17ca <memset+0x17a>
    17bc:	00b78623          	sb	a1,12(a5)
    17c0:	2735                	addiw	a4,a4,13
    17c2:	00c77463          	bleu	a2,a4,17ca <memset+0x17a>
    17c6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ca:	8082                	ret
    17cc:	472d                	li	a4,11
    17ce:	bd79                	j	166c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d0:	4f0d                	li	t5,3
    17d2:	b701                	j	16d2 <memset+0x82>
    17d4:	8082                	ret
    17d6:	4f05                	li	t5,1
    17d8:	bded                	j	16d2 <memset+0x82>
    17da:	8eaa                	mv	t4,a0
    17dc:	4f01                	li	t5,0
    17de:	bdd5                	j	16d2 <memset+0x82>
    17e0:	87aa                	mv	a5,a0
    17e2:	4701                	li	a4,0
    17e4:	b7a1                	j	172c <memset+0xdc>
    17e6:	4f09                	li	t5,2
    17e8:	b5ed                	j	16d2 <memset+0x82>
    17ea:	4f11                	li	t5,4
    17ec:	b5dd                	j	16d2 <memset+0x82>
    17ee:	4f15                	li	t5,5
    17f0:	b5cd                	j	16d2 <memset+0x82>
    17f2:	4f19                	li	t5,6
    17f4:	bdf9                	j	16d2 <memset+0x82>

00000000000017f6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f6:	00054703          	lbu	a4,0(a0)
    17fa:	0005c783          	lbu	a5,0(a1)
    17fe:	00e79b63          	bne	a5,a4,1814 <strcmp+0x1e>
    1802:	cf89                	beqz	a5,181c <strcmp+0x26>
    1804:	0505                	addi	a0,a0,1
    1806:	0585                	addi	a1,a1,1
    1808:	0005c783          	lbu	a5,0(a1)
    180c:	00054703          	lbu	a4,0(a0)
    1810:	fef709e3          	beq	a4,a5,1802 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1814:	0007051b          	sext.w	a0,a4
}
    1818:	9d1d                	subw	a0,a0,a5
    181a:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    181c:	4501                	li	a0,0
}
    181e:	9d1d                	subw	a0,a0,a5
    1820:	8082                	ret

0000000000001822 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1822:	c231                	beqz	a2,1866 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1824:	00054783          	lbu	a5,0(a0)
    1828:	0005c683          	lbu	a3,0(a1)
    182c:	c795                	beqz	a5,1858 <strncmp+0x36>
    182e:	ca85                	beqz	a3,185e <strncmp+0x3c>
    if (!n--)
    1830:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1832:	c615                	beqz	a2,185e <strncmp+0x3c>
    1834:	00150713          	addi	a4,a0,1
    1838:	9532                	add	a0,a0,a2
    183a:	00d78963          	beq	a5,a3,184c <strncmp+0x2a>
    183e:	a005                	j	185e <strncmp+0x3c>
    1840:	ce99                	beqz	a3,185e <strncmp+0x3c>
    1842:	00e50e63          	beq	a0,a4,185e <strncmp+0x3c>
    1846:	0705                	addi	a4,a4,1
    1848:	00d79b63          	bne	a5,a3,185e <strncmp+0x3c>
    184c:	00074783          	lbu	a5,0(a4)
    1850:	0585                	addi	a1,a1,1
    1852:	0005c683          	lbu	a3,0(a1)
    1856:	f7ed                	bnez	a5,1840 <strncmp+0x1e>
    1858:	4501                	li	a0,0
        ;
    return *l - *r;
    185a:	9d15                	subw	a0,a0,a3
    185c:	8082                	ret
    185e:	0007851b          	sext.w	a0,a5
    1862:	9d15                	subw	a0,a0,a3
    1864:	8082                	ret
        return 0;
    1866:	4501                	li	a0,0
}
    1868:	8082                	ret

000000000000186a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    186a:	00757793          	andi	a5,a0,7
    186e:	cfa1                	beqz	a5,18c6 <strlen+0x5c>
        if (!*s)
    1870:	00054783          	lbu	a5,0(a0)
    1874:	cbb9                	beqz	a5,18ca <strlen+0x60>
    1876:	87aa                	mv	a5,a0
    1878:	a021                	j	1880 <strlen+0x16>
    187a:	0007c703          	lbu	a4,0(a5)
    187e:	c329                	beqz	a4,18c0 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1880:	0785                	addi	a5,a5,1
    1882:	0077f713          	andi	a4,a5,7
    1886:	fb75                	bnez	a4,187a <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1888:	00000717          	auipc	a4,0x0
    188c:	7e070713          	addi	a4,a4,2016 # 2068 <__clone+0xa8>
    1890:	630c                	ld	a1,0(a4)
    1892:	00000717          	auipc	a4,0x0
    1896:	7de70713          	addi	a4,a4,2014 # 2070 <__clone+0xb0>
    189a:	6394                	ld	a3,0(a5)
    189c:	6310                	ld	a2,0(a4)
    189e:	a019                	j	18a4 <strlen+0x3a>
    18a0:	07a1                	addi	a5,a5,8
    18a2:	6394                	ld	a3,0(a5)
    18a4:	00b68733          	add	a4,a3,a1
    18a8:	fff6c693          	not	a3,a3
    18ac:	8f75                	and	a4,a4,a3
    18ae:	8f71                	and	a4,a4,a2
    18b0:	db65                	beqz	a4,18a0 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	c709                	beqz	a4,18c0 <strlen+0x56>
    18b8:	0785                	addi	a5,a5,1
    18ba:	0007c703          	lbu	a4,0(a5)
    18be:	ff6d                	bnez	a4,18b8 <strlen+0x4e>
        ;
    return s - a;
    18c0:	40a78533          	sub	a0,a5,a0
}
    18c4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c6:	87aa                	mv	a5,a0
    18c8:	b7c1                	j	1888 <strlen+0x1e>
        if (!*s)
    18ca:	4501                	li	a0,0
            return s - a;
    18cc:	8082                	ret

00000000000018ce <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ce:	00757793          	andi	a5,a0,7
    18d2:	0ff5f593          	andi	a1,a1,255
    18d6:	cb99                	beqz	a5,18ec <memchr+0x1e>
    18d8:	c655                	beqz	a2,1984 <memchr+0xb6>
    18da:	00054783          	lbu	a5,0(a0)
    18de:	0ab78663          	beq	a5,a1,198a <memchr+0xbc>
    18e2:	0505                	addi	a0,a0,1
    18e4:	00757793          	andi	a5,a0,7
    18e8:	167d                	addi	a2,a2,-1
    18ea:	f7fd                	bnez	a5,18d8 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ec:	4701                	li	a4,0
    if (n && *s != c)
    18ee:	ca49                	beqz	a2,1980 <memchr+0xb2>
    18f0:	00054783          	lbu	a5,0(a0)
    18f4:	08b78b63          	beq	a5,a1,198a <memchr+0xbc>
        size_t k = ONES * c;
    18f8:	00000797          	auipc	a5,0x0
    18fc:	78078793          	addi	a5,a5,1920 # 2078 <__clone+0xb8>
    1900:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	479d                	li	a5,7
        size_t k = ONES * c;
    1904:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1908:	08c7f863          	bleu	a2,a5,1998 <memchr+0xca>
    190c:	611c                	ld	a5,0(a0)
    190e:	00000317          	auipc	t1,0x0
    1912:	76230313          	addi	t1,t1,1890 # 2070 <__clone+0xb0>
    1916:	00033803          	ld	a6,0(t1)
    191a:	00f8c7b3          	xor	a5,a7,a5
    191e:	fff7c713          	not	a4,a5
    1922:	8f95                	sub	a5,a5,a3
    1924:	8ff9                	and	a5,a5,a4
    1926:	0107f7b3          	and	a5,a5,a6
    192a:	e7bd                	bnez	a5,1998 <memchr+0xca>
    192c:	4e1d                	li	t3,7
    192e:	00000e97          	auipc	t4,0x0
    1932:	73ae8e93          	addi	t4,t4,1850 # 2068 <__clone+0xa8>
    1936:	a005                	j	1956 <memchr+0x88>
    1938:	6514                	ld	a3,8(a0)
    193a:	000eb783          	ld	a5,0(t4)
    193e:	00033803          	ld	a6,0(t1)
    1942:	00d8c6b3          	xor	a3,a7,a3
    1946:	97b6                	add	a5,a5,a3
    1948:	fff6c693          	not	a3,a3
    194c:	8ff5                	and	a5,a5,a3
    194e:	0107f7b3          	and	a5,a5,a6
    1952:	e3a1                	bnez	a5,1992 <memchr+0xc4>
    1954:	853a                	mv	a0,a4
    1956:	1661                	addi	a2,a2,-8
    1958:	00850713          	addi	a4,a0,8
    195c:	fcce6ee3          	bltu	t3,a2,1938 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1960:	c215                	beqz	a2,1984 <memchr+0xb6>
    1962:	00074783          	lbu	a5,0(a4)
    1966:	00f58d63          	beq	a1,a5,1980 <memchr+0xb2>
    196a:	00170793          	addi	a5,a4,1
    196e:	963a                	add	a2,a2,a4
    1970:	873e                	mv	a4,a5
    1972:	00f60963          	beq	a2,a5,1984 <memchr+0xb6>
    1976:	0007c683          	lbu	a3,0(a5)
    197a:	0785                	addi	a5,a5,1
    197c:	feb69ae3          	bne	a3,a1,1970 <memchr+0xa2>
}
    1980:	853a                	mv	a0,a4
    1982:	8082                	ret
    return n ? (void *)s : 0;
    1984:	4701                	li	a4,0
}
    1986:	853a                	mv	a0,a4
    1988:	8082                	ret
    198a:	872a                	mv	a4,a0
    198c:	00074783          	lbu	a5,0(a4)
    1990:	bfd9                	j	1966 <memchr+0x98>
    1992:	00854783          	lbu	a5,8(a0)
    1996:	bfc1                	j	1966 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1998:	872a                	mv	a4,a0
    199a:	bfc1                	j	196a <memchr+0x9c>

000000000000199c <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    199c:	00757793          	andi	a5,a0,7
    19a0:	cfc5                	beqz	a5,1a58 <strnlen+0xbc>
    19a2:	c1c5                	beqz	a1,1a42 <strnlen+0xa6>
    19a4:	00054783          	lbu	a5,0(a0)
    19a8:	cfd9                	beqz	a5,1a46 <strnlen+0xaa>
    19aa:	87ae                	mv	a5,a1
    19ac:	86aa                	mv	a3,a0
    19ae:	a029                	j	19b8 <strnlen+0x1c>
    19b0:	cbc9                	beqz	a5,1a42 <strnlen+0xa6>
    19b2:	0006c703          	lbu	a4,0(a3)
    19b6:	cb51                	beqz	a4,1a4a <strnlen+0xae>
    19b8:	0685                	addi	a3,a3,1
    19ba:	0076f713          	andi	a4,a3,7
    19be:	17fd                	addi	a5,a5,-1
    19c0:	fb65                	bnez	a4,19b0 <strnlen+0x14>
    if (n && *s != c)
    19c2:	c3c1                	beqz	a5,1a42 <strnlen+0xa6>
    19c4:	0006c703          	lbu	a4,0(a3)
    19c8:	c349                	beqz	a4,1a4a <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ca:	471d                	li	a4,7
    19cc:	08f77a63          	bleu	a5,a4,1a60 <strnlen+0xc4>
    19d0:	00000e17          	auipc	t3,0x0
    19d4:	698e0e13          	addi	t3,t3,1688 # 2068 <__clone+0xa8>
    19d8:	6290                	ld	a2,0(a3)
    19da:	000e3703          	ld	a4,0(t3)
    19de:	00000e97          	auipc	t4,0x0
    19e2:	692e8e93          	addi	t4,t4,1682 # 2070 <__clone+0xb0>
    19e6:	000eb803          	ld	a6,0(t4)
    19ea:	9732                	add	a4,a4,a2
    19ec:	fff64613          	not	a2,a2
    19f0:	8f71                	and	a4,a4,a2
    19f2:	01077733          	and	a4,a4,a6
    19f6:	e72d                	bnez	a4,1a60 <strnlen+0xc4>
    19f8:	4f1d                	li	t5,7
    19fa:	a839                	j	1a18 <strnlen+0x7c>
    19fc:	6698                	ld	a4,8(a3)
    19fe:	000e3303          	ld	t1,0(t3)
    1a02:	000eb803          	ld	a6,0(t4)
    1a06:	fff74893          	not	a7,a4
    1a0a:	971a                	add	a4,a4,t1
    1a0c:	01177733          	and	a4,a4,a7
    1a10:	01077733          	and	a4,a4,a6
    1a14:	ef1d                	bnez	a4,1a52 <strnlen+0xb6>
    1a16:	86b2                	mv	a3,a2
    1a18:	17e1                	addi	a5,a5,-8
    1a1a:	00868613          	addi	a2,a3,8
    1a1e:	fcff6fe3          	bltu	t5,a5,19fc <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a22:	c385                	beqz	a5,1a42 <strnlen+0xa6>
    1a24:	00064703          	lbu	a4,0(a2)
    1a28:	cb19                	beqz	a4,1a3e <strnlen+0xa2>
    1a2a:	00160713          	addi	a4,a2,1
    1a2e:	97b2                	add	a5,a5,a2
    1a30:	863a                	mv	a2,a4
    1a32:	00e78863          	beq	a5,a4,1a42 <strnlen+0xa6>
    1a36:	0705                	addi	a4,a4,1
    1a38:	fff74683          	lbu	a3,-1(a4)
    1a3c:	faf5                	bnez	a3,1a30 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a3e:	40a605b3          	sub	a1,a2,a0
}
    1a42:	852e                	mv	a0,a1
    1a44:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a46:	87ae                	mv	a5,a1
    1a48:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a4a:	8636                	mv	a2,a3
    1a4c:	00064703          	lbu	a4,0(a2)
    1a50:	bfe1                	j	1a28 <strnlen+0x8c>
    1a52:	0086c703          	lbu	a4,8(a3)
    1a56:	bfc9                	j	1a28 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a58:	87ae                	mv	a5,a1
    1a5a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a5c:	f7a5                	bnez	a5,19c4 <strnlen+0x28>
    1a5e:	b7d5                	j	1a42 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a60:	8636                	mv	a2,a3
    1a62:	b7e1                	j	1a2a <strnlen+0x8e>

0000000000001a64 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a64:	00b547b3          	xor	a5,a0,a1
    1a68:	8b9d                	andi	a5,a5,7
    1a6a:	efa9                	bnez	a5,1ac4 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a6c:	0075f793          	andi	a5,a1,7
    1a70:	c38d                	beqz	a5,1a92 <strcpy+0x2e>
            if (!(*d = *s))
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	e799                	bnez	a5,1a88 <strcpy+0x24>
    1a7c:	a095                	j	1ae0 <strcpy+0x7c>
    1a7e:	0005c783          	lbu	a5,0(a1)
    1a82:	00f50023          	sb	a5,0(a0)
    1a86:	cbb9                	beqz	a5,1adc <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a88:	0585                	addi	a1,a1,1
    1a8a:	0075f793          	andi	a5,a1,7
    1a8e:	0505                	addi	a0,a0,1
    1a90:	f7fd                	bnez	a5,1a7e <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a92:	00000797          	auipc	a5,0x0
    1a96:	5d678793          	addi	a5,a5,1494 # 2068 <__clone+0xa8>
    1a9a:	0007b803          	ld	a6,0(a5)
    1a9e:	00000797          	auipc	a5,0x0
    1aa2:	5d278793          	addi	a5,a5,1490 # 2070 <__clone+0xb0>
    1aa6:	6198                	ld	a4,0(a1)
    1aa8:	6390                	ld	a2,0(a5)
    1aaa:	a031                	j	1ab6 <strcpy+0x52>
    1aac:	0521                	addi	a0,a0,8
    1aae:	05a1                	addi	a1,a1,8
    1ab0:	fee53c23          	sd	a4,-8(a0)
    1ab4:	6198                	ld	a4,0(a1)
    1ab6:	010707b3          	add	a5,a4,a6
    1aba:	fff74693          	not	a3,a4
    1abe:	8ff5                	and	a5,a5,a3
    1ac0:	8ff1                	and	a5,a5,a2
    1ac2:	d7ed                	beqz	a5,1aac <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ac4:	0005c783          	lbu	a5,0(a1)
    1ac8:	00f50023          	sb	a5,0(a0)
    1acc:	cb89                	beqz	a5,1ade <strcpy+0x7a>
    1ace:	0585                	addi	a1,a1,1
    1ad0:	0005c783          	lbu	a5,0(a1)
    1ad4:	0505                	addi	a0,a0,1
    1ad6:	00f50023          	sb	a5,0(a0)
    1ada:	fbf5                	bnez	a5,1ace <strcpy+0x6a>
        ;
    return d;
}
    1adc:	8082                	ret
    1ade:	8082                	ret
    1ae0:	8082                	ret

0000000000001ae2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ae2:	00b547b3          	xor	a5,a0,a1
    1ae6:	8b9d                	andi	a5,a5,7
    1ae8:	ebc1                	bnez	a5,1b78 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aea:	0075f793          	andi	a5,a1,7
    1aee:	cf91                	beqz	a5,1b0a <strncpy+0x28>
    1af0:	20060e63          	beqz	a2,1d0c <strncpy+0x22a>
    1af4:	0005c783          	lbu	a5,0(a1)
    1af8:	00f50023          	sb	a5,0(a0)
    1afc:	c3d5                	beqz	a5,1ba0 <strncpy+0xbe>
    1afe:	0585                	addi	a1,a1,1
    1b00:	0075f793          	andi	a5,a1,7
    1b04:	167d                	addi	a2,a2,-1
    1b06:	0505                	addi	a0,a0,1
    1b08:	f7e5                	bnez	a5,1af0 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b0a:	20060163          	beqz	a2,1d0c <strncpy+0x22a>
    1b0e:	0005c683          	lbu	a3,0(a1)
    1b12:	c6d9                	beqz	a3,1ba0 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b14:	479d                	li	a5,7
    1b16:	22c7f563          	bleu	a2,a5,1d40 <strncpy+0x25e>
    1b1a:	00000317          	auipc	t1,0x0
    1b1e:	54e30313          	addi	t1,t1,1358 # 2068 <__clone+0xa8>
    1b22:	6198                	ld	a4,0(a1)
    1b24:	00033783          	ld	a5,0(t1)
    1b28:	00000e17          	auipc	t3,0x0
    1b2c:	548e0e13          	addi	t3,t3,1352 # 2070 <__clone+0xb0>
    1b30:	000e3803          	ld	a6,0(t3)
    1b34:	97ba                	add	a5,a5,a4
    1b36:	fff74893          	not	a7,a4
    1b3a:	0117f7b3          	and	a5,a5,a7
    1b3e:	0107f7b3          	and	a5,a5,a6
    1b42:	1e079f63          	bnez	a5,1d40 <strncpy+0x25e>
    1b46:	4e9d                	li	t4,7
    1b48:	a005                	j	1b68 <strncpy+0x86>
    1b4a:	6598                	ld	a4,8(a1)
    1b4c:	00033783          	ld	a5,0(t1)
    1b50:	000e3803          	ld	a6,0(t3)
    1b54:	fff74893          	not	a7,a4
    1b58:	97ba                	add	a5,a5,a4
    1b5a:	0117f7b3          	and	a5,a5,a7
    1b5e:	0107f7b3          	and	a5,a5,a6
    1b62:	1a079f63          	bnez	a5,1d20 <strncpy+0x23e>
    1b66:	85b6                	mv	a1,a3
            *wd = *ws;
    1b68:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b6a:	1661                	addi	a2,a2,-8
    1b6c:	00858693          	addi	a3,a1,8
    1b70:	0521                	addi	a0,a0,8
    1b72:	fcceece3          	bltu	t4,a2,1b4a <strncpy+0x68>
    1b76:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b78:	18060a63          	beqz	a2,1d0c <strncpy+0x22a>
    1b7c:	0005c783          	lbu	a5,0(a1)
    1b80:	872a                	mv	a4,a0
    1b82:	00f50023          	sb	a5,0(a0)
    1b86:	e799                	bnez	a5,1b94 <strncpy+0xb2>
    1b88:	a829                	j	1ba2 <strncpy+0xc0>
    1b8a:	0005c783          	lbu	a5,0(a1)
    1b8e:	00f70023          	sb	a5,0(a4)
    1b92:	cb81                	beqz	a5,1ba2 <strncpy+0xc0>
    1b94:	167d                	addi	a2,a2,-1
    1b96:	0585                	addi	a1,a1,1
    1b98:	0705                	addi	a4,a4,1
    1b9a:	fa65                	bnez	a2,1b8a <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b9c:	853a                	mv	a0,a4
    1b9e:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1ba0:	872a                	mv	a4,a0
    1ba2:	4805                	li	a6,1
    1ba4:	14061c63          	bnez	a2,1cfc <strncpy+0x21a>
    1ba8:	40e007b3          	neg	a5,a4
    1bac:	8b9d                	andi	a5,a5,7
    1bae:	4581                	li	a1,0
    1bb0:	12061e63          	bnez	a2,1cec <strncpy+0x20a>
    1bb4:	00778693          	addi	a3,a5,7
    1bb8:	452d                	li	a0,11
    1bba:	12a6e763          	bltu	a3,a0,1ce8 <strncpy+0x206>
    1bbe:	16d5e663          	bltu	a1,a3,1d2a <strncpy+0x248>
    1bc2:	14078c63          	beqz	a5,1d1a <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc6:	00070023          	sb	zero,0(a4)
    1bca:	4585                	li	a1,1
    1bcc:	00170693          	addi	a3,a4,1
    1bd0:	14b78363          	beq	a5,a1,1d16 <strncpy+0x234>
    1bd4:	000700a3          	sb	zero,1(a4)
    1bd8:	4589                	li	a1,2
    1bda:	00270693          	addi	a3,a4,2
    1bde:	14b78963          	beq	a5,a1,1d30 <strncpy+0x24e>
    1be2:	00070123          	sb	zero,2(a4)
    1be6:	458d                	li	a1,3
    1be8:	00370693          	addi	a3,a4,3
    1bec:	12b78363          	beq	a5,a1,1d12 <strncpy+0x230>
    1bf0:	000701a3          	sb	zero,3(a4)
    1bf4:	4591                	li	a1,4
    1bf6:	00470693          	addi	a3,a4,4
    1bfa:	12b78d63          	beq	a5,a1,1d34 <strncpy+0x252>
    1bfe:	00070223          	sb	zero,4(a4)
    1c02:	4595                	li	a1,5
    1c04:	00570693          	addi	a3,a4,5
    1c08:	12b78863          	beq	a5,a1,1d38 <strncpy+0x256>
    1c0c:	000702a3          	sb	zero,5(a4)
    1c10:	459d                	li	a1,7
    1c12:	00670693          	addi	a3,a4,6
    1c16:	12b79363          	bne	a5,a1,1d3c <strncpy+0x25a>
    1c1a:	00770693          	addi	a3,a4,7
    1c1e:	00070323          	sb	zero,6(a4)
    1c22:	40f80833          	sub	a6,a6,a5
    1c26:	ff887513          	andi	a0,a6,-8
    1c2a:	97ba                	add	a5,a5,a4
    1c2c:	953e                	add	a0,a0,a5
    1c2e:	0007b023          	sd	zero,0(a5)
    1c32:	07a1                	addi	a5,a5,8
    1c34:	fea79de3          	bne	a5,a0,1c2e <strncpy+0x14c>
    1c38:	ff887513          	andi	a0,a6,-8
    1c3c:	9da9                	addw	a1,a1,a0
    1c3e:	00a687b3          	add	a5,a3,a0
    1c42:	f4a80de3          	beq	a6,a0,1b9c <strncpy+0xba>
    1c46:	00078023          	sb	zero,0(a5)
    1c4a:	0015869b          	addiw	a3,a1,1
    1c4e:	f4c6f7e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c52:	000780a3          	sb	zero,1(a5)
    1c56:	0025869b          	addiw	a3,a1,2
    1c5a:	f4c6f1e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c5e:	00078123          	sb	zero,2(a5)
    1c62:	0035869b          	addiw	a3,a1,3
    1c66:	f2c6fbe3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c6a:	000781a3          	sb	zero,3(a5)
    1c6e:	0045869b          	addiw	a3,a1,4
    1c72:	f2c6f5e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c76:	00078223          	sb	zero,4(a5)
    1c7a:	0055869b          	addiw	a3,a1,5
    1c7e:	f0c6ffe3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c82:	000782a3          	sb	zero,5(a5)
    1c86:	0065869b          	addiw	a3,a1,6
    1c8a:	f0c6f9e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c8e:	00078323          	sb	zero,6(a5)
    1c92:	0075869b          	addiw	a3,a1,7
    1c96:	f0c6f3e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1c9a:	000783a3          	sb	zero,7(a5)
    1c9e:	0085869b          	addiw	a3,a1,8
    1ca2:	eec6fde3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1ca6:	00078423          	sb	zero,8(a5)
    1caa:	0095869b          	addiw	a3,a1,9
    1cae:	eec6f7e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1cb2:	000784a3          	sb	zero,9(a5)
    1cb6:	00a5869b          	addiw	a3,a1,10
    1cba:	eec6f1e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1cbe:	00078523          	sb	zero,10(a5)
    1cc2:	00b5869b          	addiw	a3,a1,11
    1cc6:	ecc6fbe3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1cca:	000785a3          	sb	zero,11(a5)
    1cce:	00c5869b          	addiw	a3,a1,12
    1cd2:	ecc6f5e3          	bleu	a2,a3,1b9c <strncpy+0xba>
    1cd6:	00078623          	sb	zero,12(a5)
    1cda:	25b5                	addiw	a1,a1,13
    1cdc:	ecc5f0e3          	bleu	a2,a1,1b9c <strncpy+0xba>
    1ce0:	000786a3          	sb	zero,13(a5)
}
    1ce4:	853a                	mv	a0,a4
    1ce6:	8082                	ret
    1ce8:	46ad                	li	a3,11
    1cea:	bdd1                	j	1bbe <strncpy+0xdc>
    1cec:	00778693          	addi	a3,a5,7
    1cf0:	452d                	li	a0,11
    1cf2:	fff60593          	addi	a1,a2,-1
    1cf6:	eca6f4e3          	bleu	a0,a3,1bbe <strncpy+0xdc>
    1cfa:	b7fd                	j	1ce8 <strncpy+0x206>
    1cfc:	40e007b3          	neg	a5,a4
    1d00:	8832                	mv	a6,a2
    1d02:	8b9d                	andi	a5,a5,7
    1d04:	4581                	li	a1,0
    1d06:	ea0607e3          	beqz	a2,1bb4 <strncpy+0xd2>
    1d0a:	b7cd                	j	1cec <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d0c:	872a                	mv	a4,a0
}
    1d0e:	853a                	mv	a0,a4
    1d10:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d12:	458d                	li	a1,3
    1d14:	b739                	j	1c22 <strncpy+0x140>
    1d16:	4585                	li	a1,1
    1d18:	b729                	j	1c22 <strncpy+0x140>
    1d1a:	86ba                	mv	a3,a4
    1d1c:	4581                	li	a1,0
    1d1e:	b711                	j	1c22 <strncpy+0x140>
    1d20:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d24:	872a                	mv	a4,a0
    1d26:	85b6                	mv	a1,a3
    1d28:	bda9                	j	1b82 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d2a:	87ba                	mv	a5,a4
    1d2c:	4581                	li	a1,0
    1d2e:	bf21                	j	1c46 <strncpy+0x164>
    1d30:	4589                	li	a1,2
    1d32:	bdc5                	j	1c22 <strncpy+0x140>
    1d34:	4591                	li	a1,4
    1d36:	b5f5                	j	1c22 <strncpy+0x140>
    1d38:	4595                	li	a1,5
    1d3a:	b5e5                	j	1c22 <strncpy+0x140>
    1d3c:	4599                	li	a1,6
    1d3e:	b5d5                	j	1c22 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d40:	00d50023          	sb	a3,0(a0)
    1d44:	872a                	mv	a4,a0
    1d46:	b5b9                	j	1b94 <strncpy+0xb2>

0000000000001d48 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d48:	87aa                	mv	a5,a0
    1d4a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d4c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d56:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d58:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <openat>:
    register long a7 __asm__("a7") = n;
    1d60:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d64:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d68:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <close>:
    register long a7 __asm__("a7") = n;
    1d70:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <read>:
    register long a7 __asm__("a7") = n;
    1d7c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d80:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d84:	8082                	ret

0000000000001d86 <write>:
    register long a7 __asm__("a7") = n;
    1d86:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d8e:	8082                	ret

0000000000001d90 <getpid>:
    register long a7 __asm__("a7") = n;
    1d90:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d94:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <getppid>:
    register long a7 __asm__("a7") = n;
    1d9c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1da0:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1da8:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dac:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <fork>:
    register long a7 __asm__("a7") = n;
    1db4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1db8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbc:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dc4:	85b2                	mv	a1,a2
    1dc6:	863a                	mv	a2,a4
    if (stack)
    1dc8:	c191                	beqz	a1,1dcc <clone+0x8>
	stack += stack_size;
    1dca:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dcc:	4781                	li	a5,0
    1dce:	4701                	li	a4,0
    1dd0:	4681                	li	a3,0
    1dd2:	2601                	sext.w	a2,a2
    1dd4:	1ec0006f          	j	1fc0 <__clone>

0000000000001dd8 <exit>:
    register long a7 __asm__("a7") = n;
    1dd8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ddc:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1de0:	8082                	ret

0000000000001de2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1de2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1de6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1de8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <exec>:
    register long a7 __asm__("a7") = n;
    1df0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <execve>:
    register long a7 __asm__("a7") = n;
    1dfc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <times>:
    register long a7 __asm__("a7") = n;
    1e08:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <get_time>:

int64 get_time()
{
    1e14:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e16:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e1a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e1c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e22:	2501                	sext.w	a0,a0
    1e24:	ed09                	bnez	a0,1e3e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e26:	67a2                	ld	a5,8(sp)
    1e28:	3e800713          	li	a4,1000
    1e2c:	00015503          	lhu	a0,0(sp)
    1e30:	02e7d7b3          	divu	a5,a5,a4
    1e34:	02e50533          	mul	a0,a0,a4
    1e38:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e3a:	0141                	addi	sp,sp,16
    1e3c:	8082                	ret
        return -1;
    1e3e:	557d                	li	a0,-1
    1e40:	bfed                	j	1e3a <get_time+0x26>

0000000000001e42 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e42:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <time>:
    register long a7 __asm__("a7") = n;
    1e4e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e52:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <sleep>:

int sleep(unsigned long long time)
{
    1e5a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e5c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e5e:	850a                	mv	a0,sp
    1e60:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e62:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e66:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e6c:	e501                	bnez	a0,1e74 <sleep+0x1a>
    return 0;
    1e6e:	4501                	li	a0,0
}
    1e70:	0141                	addi	sp,sp,16
    1e72:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e74:	4502                	lw	a0,0(sp)
}
    1e76:	0141                	addi	sp,sp,16
    1e78:	8082                	ret

0000000000001e7a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e7a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e7e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e86:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e8a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e8e:	8082                	ret

0000000000001e90 <munmap>:
    register long a7 __asm__("a7") = n;
    1e90:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e94:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <wait>:

int wait(int *code)
{
    1e9c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ea2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ea4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ea6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ea8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <spawn>:
    register long a7 __asm__("a7") = n;
    1eb0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eb4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eb8:	2501                	sext.w	a0,a0
    1eba:	8082                	ret

0000000000001ebc <mailread>:
    register long a7 __asm__("a7") = n;
    1ebc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ec8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ecc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <fstat>:
    register long a7 __asm__("a7") = n;
    1ed4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ee0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ee2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ee6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ef0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ef2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ef6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <link>:

int link(char *old_path, char *new_path)
{
    1f00:	87aa                	mv	a5,a0
    1f02:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f04:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f08:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f0c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f0e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f12:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f14:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <unlink>:

int unlink(char *path)
{
    1f1c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f1e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f22:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f26:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f28:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <uname>:
    register long a7 __asm__("a7") = n;
    1f30:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f34:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <brk>:
    register long a7 __asm__("a7") = n;
    1f3c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f40:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f48:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f4e:	8082                	ret

0000000000001f50 <chdir>:
    register long a7 __asm__("a7") = n;
    1f50:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f54:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f5c:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f5e:	02059613          	slli	a2,a1,0x20
    1f62:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f64:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f6c:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6e:	00000073          	ecall
}
    1f72:	2501                	sext.w	a0,a0
    1f74:	8082                	ret

0000000000001f76 <getdents>:
    register long a7 __asm__("a7") = n;
    1f76:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <pipe>:
    register long a7 __asm__("a7") = n;
    1f82:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f86:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f88:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <dup>:
    register long a7 __asm__("a7") = n;
    1f90:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f92:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f96:	2501                	sext.w	a0,a0
    1f98:	8082                	ret

0000000000001f9a <dup2>:
    register long a7 __asm__("a7") = n;
    1f9a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f9c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fa2:	2501                	sext.w	a0,a0
    1fa4:	8082                	ret

0000000000001fa6 <mount>:
    register long a7 __asm__("a7") = n;
    1fa6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1faa:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <umount>:
    register long a7 __asm__("a7") = n;
    1fb2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fb6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fbc:	2501                	sext.w	a0,a0
    1fbe:	8082                	ret

0000000000001fc0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fc0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fc2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fc4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fc6:	8532                	mv	a0,a2
	mv a2, a4
    1fc8:	863a                	mv	a2,a4
	mv a3, a5
    1fca:	86be                	mv	a3,a5
	mv a4, a6
    1fcc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fce:	0dc00893          	li	a7,220
	ecall
    1fd2:	00000073          	ecall

	beqz a0, 1f
    1fd6:	c111                	beqz	a0,1fda <__clone+0x1a>
	# Parent
	ret
    1fd8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fda:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fdc:	6522                	ld	a0,8(sp)
	jalr a1
    1fde:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fe0:	05d00893          	li	a7,93
	ecall
    1fe4:	00000073          	ecall
