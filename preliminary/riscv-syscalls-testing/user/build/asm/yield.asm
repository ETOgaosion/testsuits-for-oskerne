
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/yield:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0be0006f          	j	10c0 <__start_main>

0000000000001006 <test_yield>:

/*
理想结果：三个子进程交替输出
*/

int test_yield(){
    1006:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fe050513          	addi	a0,a0,-32 # 1fe8 <__clone+0x2c>
int test_yield(){
    1010:	f406                	sd	ra,40(sp)
    1012:	f022                	sd	s0,32(sp)
    1014:	e84a                	sd	s2,16(sp)
    1016:	e44e                	sd	s3,8(sp)
    1018:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    101a:	2a6000ef          	jal	ra,12c0 <puts>
    101e:	00001517          	auipc	a0,0x1
    1022:	05250513          	addi	a0,a0,82 # 2070 <__func__.1183>
    1026:	29a000ef          	jal	ra,12c0 <puts>
    102a:	00001517          	auipc	a0,0x1
    102e:	fd650513          	addi	a0,a0,-42 # 2000 <__clone+0x44>
    1032:	28e000ef          	jal	ra,12c0 <puts>

    for (int i = 0; i < 3; ++i){
    1036:	4401                	li	s0,0
        if(fork() == 0){
	    for (int j = 0; j< 5; ++j){
                sched_yield();
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1038:	00001917          	auipc	s2,0x1
    103c:	fd890913          	addi	s2,s2,-40 # 2010 <__clone+0x54>
    for (int i = 0; i < 3; ++i){
    1040:	498d                	li	s3,3
        if(fork() == 0){
    1042:	56f000ef          	jal	ra,1db0 <fork>
    1046:	c529                	beqz	a0,1090 <test_yield+0x8a>
    for (int i = 0; i < 3; ++i){
    1048:	2405                	addiw	s0,s0,1
    104a:	ff341ce3          	bne	s0,s3,1042 <test_yield+0x3c>
	    }
	    exit(0);
        }
    }
    wait(NULL);
    104e:	4501                	li	a0,0
    1050:	649000ef          	jal	ra,1e98 <wait>
    wait(NULL);
    1054:	4501                	li	a0,0
    1056:	643000ef          	jal	ra,1e98 <wait>
    wait(NULL);
    105a:	4501                	li	a0,0
    105c:	63d000ef          	jal	ra,1e98 <wait>
    TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	fe050513          	addi	a0,a0,-32 # 2040 <__clone+0x84>
    1068:	258000ef          	jal	ra,12c0 <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	00450513          	addi	a0,a0,4 # 2070 <__func__.1183>
    1074:	24c000ef          	jal	ra,12c0 <puts>
}
    1078:	7402                	ld	s0,32(sp)
    107a:	70a2                	ld	ra,40(sp)
    107c:	64e2                	ld	s1,24(sp)
    107e:	6942                	ld	s2,16(sp)
    1080:	69a2                	ld	s3,8(sp)
    TEST_END(__func__);
    1082:	00001517          	auipc	a0,0x1
    1086:	f7e50513          	addi	a0,a0,-130 # 2000 <__clone+0x44>
}
    108a:	6145                	addi	sp,sp,48
    TEST_END(__func__);
    108c:	2340006f          	j	12c0 <puts>
    1090:	4495                	li	s1,5
                sched_yield();
    1092:	513000ef          	jal	ra,1da4 <sched_yield>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1096:	4f7000ef          	jal	ra,1d8c <getpid>
    109a:	85aa                	mv	a1,a0
    109c:	34fd                	addiw	s1,s1,-1
    109e:	8622                	mv	a2,s0
    10a0:	854a                	mv	a0,s2
    10a2:	240000ef          	jal	ra,12e2 <printf>
	    for (int j = 0; j< 5; ++j){
    10a6:	f4f5                	bnez	s1,1092 <test_yield+0x8c>
	    exit(0);
    10a8:	4501                	li	a0,0
    10aa:	52b000ef          	jal	ra,1dd4 <exit>
    10ae:	bf69                	j	1048 <test_yield+0x42>

00000000000010b0 <main>:

int main(void) {
    10b0:	1141                	addi	sp,sp,-16
    10b2:	e406                	sd	ra,8(sp)
    test_yield();
    10b4:	f53ff0ef          	jal	ra,1006 <test_yield>
    return 0;
}
    10b8:	60a2                	ld	ra,8(sp)
    10ba:	4501                	li	a0,0
    10bc:	0141                	addi	sp,sp,16
    10be:	8082                	ret

00000000000010c0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c2:	4108                	lw	a0,0(a0)
{
    10c4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c6:	05a1                	addi	a1,a1,8
{
    10c8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ca:	fe7ff0ef          	jal	ra,10b0 <main>
    10ce:	507000ef          	jal	ra,1dd4 <exit>
	return 0;
}
    10d2:	60a2                	ld	ra,8(sp)
    10d4:	4501                	li	a0,0
    10d6:	0141                	addi	sp,sp,16
    10d8:	8082                	ret

00000000000010da <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10da:	7179                	addi	sp,sp,-48
    10dc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10de:	12054e63          	bltz	a0,121a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10e2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10e6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e8:	02b7f6bb          	remuw	a3,a5,a1
    10ec:	00001717          	auipc	a4,0x1
    10f0:	f9470713          	addi	a4,a4,-108 # 2080 <digits>
    buf[16] = 0;
    10f4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f8:	1682                	slli	a3,a3,0x20
    10fa:	9281                	srli	a3,a3,0x20
    10fc:	96ba                	add	a3,a3,a4
    10fe:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1102:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1106:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    110a:	16b7e363          	bltu	a5,a1,1270 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    110e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1112:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1116:	1602                	slli	a2,a2,0x20
    1118:	9201                	srli	a2,a2,0x20
    111a:	963a                	add	a2,a2,a4
    111c:	00064603          	lbu	a2,0(a2)
    1120:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1124:	0007861b          	sext.w	a2,a5
    1128:	12b6e863          	bltu	a3,a1,1258 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    112c:	02b7f6bb          	remuw	a3,a5,a1
    1130:	1682                	slli	a3,a3,0x20
    1132:	9281                	srli	a3,a3,0x20
    1134:	96ba                	add	a3,a3,a4
    1136:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    113e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1142:	10b66e63          	bltu	a2,a1,125e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1146:	02b876bb          	remuw	a3,a6,a1
    114a:	1682                	slli	a3,a3,0x20
    114c:	9281                	srli	a3,a3,0x20
    114e:	96ba                	add	a3,a3,a4
    1150:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1154:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1158:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    115c:	10b86463          	bltu	a6,a1,1264 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1160:	02b676bb          	remuw	a3,a2,a1
    1164:	1682                	slli	a3,a3,0x20
    1166:	9281                	srli	a3,a3,0x20
    1168:	96ba                	add	a3,a3,a4
    116a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1172:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1176:	0eb66a63          	bltu	a2,a1,126a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    117a:	02b876bb          	remuw	a3,a6,a1
    117e:	1682                	slli	a3,a3,0x20
    1180:	9281                	srli	a3,a3,0x20
    1182:	96ba                	add	a3,a3,a4
    1184:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1188:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1190:	0cb86163          	bltu	a6,a1,1252 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1194:	02b676bb          	remuw	a3,a2,a1
    1198:	1682                	slli	a3,a3,0x20
    119a:	9281                	srli	a3,a3,0x20
    119c:	96ba                	add	a3,a3,a4
    119e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11a6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11aa:	0cb66563          	bltu	a2,a1,1274 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ae:	02b876bb          	remuw	a3,a6,a1
    11b2:	1682                	slli	a3,a3,0x20
    11b4:	9281                	srli	a3,a3,0x20
    11b6:	96ba                	add	a3,a3,a4
    11b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11bc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11c4:	0ab86b63          	bltu	a6,a1,127a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11c8:	02b676bb          	remuw	a3,a2,a1
    11cc:	1682                	slli	a3,a3,0x20
    11ce:	9281                	srli	a3,a3,0x20
    11d0:	96ba                	add	a3,a3,a4
    11d2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11da:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11de:	0ab66163          	bltu	a2,a1,1280 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11e2:	1782                	slli	a5,a5,0x20
    11e4:	9381                	srli	a5,a5,0x20
    11e6:	97ba                	add	a5,a5,a4
    11e8:	0007c703          	lbu	a4,0(a5)
    11ec:	4599                	li	a1,6
    11ee:	4795                	li	a5,5
    11f0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11f4:	00055963          	bgez	a0,1206 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f8:	1018                	addi	a4,sp,32
    11fa:	973e                	add	a4,a4,a5
    11fc:	02d00693          	li	a3,45
    1200:	fed70423          	sb	a3,-24(a4)
    1204:	85be                	mv	a1,a5
    write(f, s, l);
    1206:	003c                	addi	a5,sp,8
    1208:	4641                	li	a2,16
    120a:	9e0d                	subw	a2,a2,a1
    120c:	4505                	li	a0,1
    120e:	95be                	add	a1,a1,a5
    1210:	373000ef          	jal	ra,1d82 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1214:	70a2                	ld	ra,40(sp)
    1216:	6145                	addi	sp,sp,48
    1218:	8082                	ret
        x = -xx;
    121a:	40a0063b          	negw	a2,a0
    121e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1220:	02b677bb          	remuw	a5,a2,a1
    1224:	00001717          	auipc	a4,0x1
    1228:	e5c70713          	addi	a4,a4,-420 # 2080 <digits>
    buf[16] = 0;
    122c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1230:	1782                	slli	a5,a5,0x20
    1232:	9381                	srli	a5,a5,0x20
    1234:	97ba                	add	a5,a5,a4
    1236:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    123e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1242:	ecb676e3          	bleu	a1,a2,110e <printint.constprop.0+0x34>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124e:	45b9                	li	a1,14
    1250:	bf5d                	j	1206 <printint.constprop.0+0x12c>
    1252:	47a5                	li	a5,9
    1254:	45a9                	li	a1,10
    1256:	bf79                	j	11f4 <printint.constprop.0+0x11a>
    1258:	47b5                	li	a5,13
    125a:	45b9                	li	a1,14
    125c:	bf61                	j	11f4 <printint.constprop.0+0x11a>
    125e:	47b1                	li	a5,12
    1260:	45b5                	li	a1,13
    1262:	bf49                	j	11f4 <printint.constprop.0+0x11a>
    1264:	47ad                	li	a5,11
    1266:	45b1                	li	a1,12
    1268:	b771                	j	11f4 <printint.constprop.0+0x11a>
    126a:	47a9                	li	a5,10
    126c:	45ad                	li	a1,11
    126e:	b759                	j	11f4 <printint.constprop.0+0x11a>
    i = 15;
    1270:	45bd                	li	a1,15
    1272:	bf51                	j	1206 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1274:	47a1                	li	a5,8
    1276:	45a5                	li	a1,9
    1278:	bfb5                	j	11f4 <printint.constprop.0+0x11a>
    127a:	479d                	li	a5,7
    127c:	45a1                	li	a1,8
    127e:	bf9d                	j	11f4 <printint.constprop.0+0x11a>
    1280:	4799                	li	a5,6
    1282:	459d                	li	a1,7
    1284:	bf85                	j	11f4 <printint.constprop.0+0x11a>

0000000000001286 <getchar>:
{
    1286:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1288:	00f10593          	addi	a1,sp,15
    128c:	4605                	li	a2,1
    128e:	4501                	li	a0,0
{
    1290:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1292:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1296:	2e3000ef          	jal	ra,1d78 <read>
}
    129a:	60e2                	ld	ra,24(sp)
    129c:	00f14503          	lbu	a0,15(sp)
    12a0:	6105                	addi	sp,sp,32
    12a2:	8082                	ret

00000000000012a4 <putchar>:
{
    12a4:	1101                	addi	sp,sp,-32
    char byte = c;
    12a6:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12aa:	00f10593          	addi	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4505                	li	a0,1
{
    12b2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12b4:	2cf000ef          	jal	ra,1d82 <write>
}
    12b8:	60e2                	ld	ra,24(sp)
    12ba:	2501                	sext.w	a0,a0
    12bc:	6105                	addi	sp,sp,32
    12be:	8082                	ret

00000000000012c0 <puts>:
{
    12c0:	1141                	addi	sp,sp,-16
    12c2:	e406                	sd	ra,8(sp)
    12c4:	e022                	sd	s0,0(sp)
    12c6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c8:	59e000ef          	jal	ra,1866 <strlen>
    12cc:	862a                	mv	a2,a0
    12ce:	85a2                	mv	a1,s0
    12d0:	4505                	li	a0,1
    12d2:	2b1000ef          	jal	ra,1d82 <write>
}
    12d6:	60a2                	ld	ra,8(sp)
    12d8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12da:	957d                	srai	a0,a0,0x3f
    return r;
    12dc:	2501                	sext.w	a0,a0
}
    12de:	0141                	addi	sp,sp,16
    12e0:	8082                	ret

00000000000012e2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e2:	7131                	addi	sp,sp,-192
    12e4:	e0da                	sd	s6,64(sp)
    12e6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12e8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ea:	013c                	addi	a5,sp,136
{
    12ec:	f0ca                	sd	s2,96(sp)
    12ee:	ecce                	sd	s3,88(sp)
    12f0:	e8d2                	sd	s4,80(sp)
    12f2:	e4d6                	sd	s5,72(sp)
    12f4:	fc5e                	sd	s7,56(sp)
    12f6:	fc86                	sd	ra,120(sp)
    12f8:	f8a2                	sd	s0,112(sp)
    12fa:	f4a6                	sd	s1,104(sp)
    12fc:	89aa                	mv	s3,a0
    12fe:	e52e                	sd	a1,136(sp)
    1300:	e932                	sd	a2,144(sp)
    1302:	ed36                	sd	a3,152(sp)
    1304:	f13a                	sd	a4,160(sp)
    1306:	f942                	sd	a6,176(sp)
    1308:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    130a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130c:	02500913          	li	s2,37
    1310:	07000a93          	li	s5,112
    buf[i++] = '0';
    1314:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1318:	00001a17          	auipc	s4,0x1
    131c:	d68a0a13          	addi	s4,s4,-664 # 2080 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1320:	00001b97          	auipc	s7,0x1
    1324:	d30b8b93          	addi	s7,s7,-720 # 2050 <__clone+0x94>
        if (!*s)
    1328:	0009c783          	lbu	a5,0(s3)
    132c:	cfb9                	beqz	a5,138a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    132e:	23278d63          	beq	a5,s2,1568 <printf+0x286>
    1332:	864e                	mv	a2,s3
    1334:	a019                	j	133a <printf+0x58>
    1336:	07278563          	beq	a5,s2,13a0 <printf+0xbe>
    133a:	0605                	addi	a2,a2,1
    133c:	00064783          	lbu	a5,0(a2)
    1340:	fbfd                	bnez	a5,1336 <printf+0x54>
    1342:	84b2                	mv	s1,a2
        l = z - a;
    1344:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1348:	8622                	mv	a2,s0
    134a:	85ce                	mv	a1,s3
    134c:	4505                	li	a0,1
    134e:	235000ef          	jal	ra,1d82 <write>
        if (l)
    1352:	ec3d                	bnez	s0,13d0 <printf+0xee>
        if (s[1] == 0)
    1354:	0014c783          	lbu	a5,1(s1)
    1358:	cb8d                	beqz	a5,138a <printf+0xa8>
        switch (s[1])
    135a:	09578b63          	beq	a5,s5,13f0 <printf+0x10e>
    135e:	06fafb63          	bleu	a5,s5,13d4 <printf+0xf2>
    1362:	07300713          	li	a4,115
    1366:	1ce78e63          	beq	a5,a4,1542 <printf+0x260>
    136a:	07800713          	li	a4,120
    136e:	1ae79563          	bne	a5,a4,1518 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1372:	6782                	ld	a5,0(sp)
    1374:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1376:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    137a:	4388                	lw	a0,0(a5)
    137c:	07a1                	addi	a5,a5,8
    137e:	e03e                	sd	a5,0(sp)
    1380:	d5bff0ef          	jal	ra,10da <printint.constprop.0>
        if (!*s)
    1384:	0009c783          	lbu	a5,0(s3)
    1388:	f3dd                	bnez	a5,132e <printf+0x4c>
    }
    va_end(ap);
}
    138a:	70e6                	ld	ra,120(sp)
    138c:	7446                	ld	s0,112(sp)
    138e:	74a6                	ld	s1,104(sp)
    1390:	7906                	ld	s2,96(sp)
    1392:	69e6                	ld	s3,88(sp)
    1394:	6a46                	ld	s4,80(sp)
    1396:	6aa6                	ld	s5,72(sp)
    1398:	6b06                	ld	s6,64(sp)
    139a:	7be2                	ld	s7,56(sp)
    139c:	6129                	addi	sp,sp,192
    139e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13a0:	00164783          	lbu	a5,1(a2)
    13a4:	84b2                	mv	s1,a2
    13a6:	01278763          	beq	a5,s2,13b4 <printf+0xd2>
    13aa:	bf69                	j	1344 <printf+0x62>
    13ac:	0014c783          	lbu	a5,1(s1)
    13b0:	f9279ae3          	bne	a5,s2,1344 <printf+0x62>
    13b4:	0489                	addi	s1,s1,2
    13b6:	0004c783          	lbu	a5,0(s1)
    13ba:	0605                	addi	a2,a2,1
    13bc:	ff2788e3          	beq	a5,s2,13ac <printf+0xca>
        l = z - a;
    13c0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13c4:	8622                	mv	a2,s0
    13c6:	85ce                	mv	a1,s3
    13c8:	4505                	li	a0,1
    13ca:	1b9000ef          	jal	ra,1d82 <write>
        if (l)
    13ce:	d059                	beqz	s0,1354 <printf+0x72>
    13d0:	89a6                	mv	s3,s1
    13d2:	bf99                	j	1328 <printf+0x46>
    13d4:	06400713          	li	a4,100
    13d8:	14e79063          	bne	a5,a4,1518 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13dc:	6782                	ld	a5,0(sp)
    13de:	45a9                	li	a1,10
        s += 2;
    13e0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13e4:	4388                	lw	a0,0(a5)
    13e6:	07a1                	addi	a5,a5,8
    13e8:	e03e                	sd	a5,0(sp)
    13ea:	cf1ff0ef          	jal	ra,10da <printint.constprop.0>
        s += 2;
    13ee:	bf59                	j	1384 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13f0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13f6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f8:	631c                	ld	a5,0(a4)
    13fa:	0721                	addi	a4,a4,8
    13fc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fe:	00479293          	slli	t0,a5,0x4
    1402:	00879f93          	slli	t6,a5,0x8
    1406:	00c79f13          	slli	t5,a5,0xc
    140a:	01079e93          	slli	t4,a5,0x10
    140e:	01479e13          	slli	t3,a5,0x14
    1412:	01879313          	slli	t1,a5,0x18
    1416:	01c79893          	slli	a7,a5,0x1c
    141a:	02479813          	slli	a6,a5,0x24
    141e:	02879513          	slli	a0,a5,0x28
    1422:	02c79593          	slli	a1,a5,0x2c
    1426:	03079693          	slli	a3,a5,0x30
    142a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	03c7d413          	srli	s0,a5,0x3c
    1432:	01c7d39b          	srliw	t2,a5,0x1c
    1436:	03c2d293          	srli	t0,t0,0x3c
    143a:	03cfdf93          	srli	t6,t6,0x3c
    143e:	03cf5f13          	srli	t5,t5,0x3c
    1442:	03cede93          	srli	t4,t4,0x3c
    1446:	03ce5e13          	srli	t3,t3,0x3c
    144a:	03c35313          	srli	t1,t1,0x3c
    144e:	03c8d893          	srli	a7,a7,0x3c
    1452:	03c85813          	srli	a6,a6,0x3c
    1456:	9171                	srli	a0,a0,0x3c
    1458:	91f1                	srli	a1,a1,0x3c
    145a:	92f1                	srli	a3,a3,0x3c
    145c:	9371                	srli	a4,a4,0x3c
    145e:	96d2                	add	a3,a3,s4
    1460:	9752                	add	a4,a4,s4
    1462:	9452                	add	s0,s0,s4
    1464:	92d2                	add	t0,t0,s4
    1466:	9fd2                	add	t6,t6,s4
    1468:	9f52                	add	t5,t5,s4
    146a:	9ed2                	add	t4,t4,s4
    146c:	9e52                	add	t3,t3,s4
    146e:	9352                	add	t1,t1,s4
    1470:	98d2                	add	a7,a7,s4
    1472:	93d2                	add	t2,t2,s4
    1474:	9852                	add	a6,a6,s4
    1476:	9552                	add	a0,a0,s4
    1478:	95d2                	add	a1,a1,s4
    147a:	0006c983          	lbu	s3,0(a3)
    147e:	0002c283          	lbu	t0,0(t0)
    1482:	00074683          	lbu	a3,0(a4)
    1486:	000fcf83          	lbu	t6,0(t6)
    148a:	000f4f03          	lbu	t5,0(t5)
    148e:	000ece83          	lbu	t4,0(t4)
    1492:	000e4e03          	lbu	t3,0(t3)
    1496:	00034303          	lbu	t1,0(t1)
    149a:	0008c883          	lbu	a7,0(a7)
    149e:	0003c383          	lbu	t2,0(t2)
    14a2:	00084803          	lbu	a6,0(a6)
    14a6:	00054503          	lbu	a0,0(a0)
    14aa:	0005c583          	lbu	a1,0(a1)
    14ae:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b6:	9371                	srli	a4,a4,0x3c
    14b8:	8bbd                	andi	a5,a5,15
    14ba:	9752                	add	a4,a4,s4
    14bc:	97d2                	add	a5,a5,s4
    14be:	005105a3          	sb	t0,11(sp)
    14c2:	01f10623          	sb	t6,12(sp)
    14c6:	01e106a3          	sb	t5,13(sp)
    14ca:	01d10723          	sb	t4,14(sp)
    14ce:	01c107a3          	sb	t3,15(sp)
    14d2:	00610823          	sb	t1,16(sp)
    14d6:	011108a3          	sb	a7,17(sp)
    14da:	00710923          	sb	t2,18(sp)
    14de:	010109a3          	sb	a6,19(sp)
    14e2:	00a10a23          	sb	a0,20(sp)
    14e6:	00b10aa3          	sb	a1,21(sp)
    14ea:	01310b23          	sb	s3,22(sp)
    14ee:	00d10ba3          	sb	a3,23(sp)
    14f2:	00810523          	sb	s0,10(sp)
    14f6:	00074703          	lbu	a4,0(a4)
    14fa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fe:	002c                	addi	a1,sp,8
    1500:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1502:	00e10c23          	sb	a4,24(sp)
    1506:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150a:	00010d23          	sb	zero,26(sp)
        s += 2;
    150e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1512:	071000ef          	jal	ra,1d82 <write>
        s += 2;
    1516:	b5bd                	j	1384 <printf+0xa2>
    char byte = c;
    1518:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1526:	05d000ef          	jal	ra,1d82 <write>
    char byte = c;
    152a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
        s += 2;
    1538:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    153c:	047000ef          	jal	ra,1d82 <write>
        s += 2;
    1540:	b591                	j	1384 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1542:	6782                	ld	a5,0(sp)
    1544:	6380                	ld	s0,0(a5)
    1546:	07a1                	addi	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	cc05                	beqz	s0,1582 <printf+0x2a0>
            l = strnlen(a, 200);
    154c:	0c800593          	li	a1,200
    1550:	8522                	mv	a0,s0
    1552:	446000ef          	jal	ra,1998 <strnlen>
    write(f, s, l);
    1556:	0005061b          	sext.w	a2,a0
    155a:	85a2                	mv	a1,s0
    155c:	4505                	li	a0,1
    155e:	025000ef          	jal	ra,1d82 <write>
        s += 2;
    1562:	00248993          	addi	s3,s1,2
    1566:	bd39                	j	1384 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1568:	0019c783          	lbu	a5,1(s3)
    156c:	84ce                	mv	s1,s3
    156e:	864e                	mv	a2,s3
    1570:	e52782e3          	beq	a5,s2,13b4 <printf+0xd2>
    write(f, s, l);
    1574:	4601                	li	a2,0
    1576:	85ce                	mv	a1,s3
    1578:	4505                	li	a0,1
    157a:	009000ef          	jal	ra,1d82 <write>
    157e:	84ce                	mv	s1,s3
    1580:	bbd1                	j	1354 <printf+0x72>
                a = "(null)";
    1582:	845e                	mv	s0,s7
    1584:	b7e1                	j	154c <printf+0x26a>

0000000000001586 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1586:	02000793          	li	a5,32
    158a:	00f50663          	beq	a0,a5,1596 <isspace+0x10>
    158e:	355d                	addiw	a0,a0,-9
    1590:	00553513          	sltiu	a0,a0,5
    1594:	8082                	ret
    1596:	4505                	li	a0,1
}
    1598:	8082                	ret

000000000000159a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159a:	fd05051b          	addiw	a0,a0,-48
}
    159e:	00a53513          	sltiu	a0,a0,10
    15a2:	8082                	ret

00000000000015a4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000613          	li	a2,32
    15a8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15aa:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	0007079b          	sext.w	a5,a4
    15b2:	ff77869b          	addiw	a3,a5,-9
    15b6:	04c70b63          	beq	a4,a2,160c <atoi+0x68>
    15ba:	04d5f963          	bleu	a3,a1,160c <atoi+0x68>
        s++;
    switch (*s)
    15be:	02b00693          	li	a3,43
    15c2:	04d70a63          	beq	a4,a3,1616 <atoi+0x72>
    15c6:	02d00693          	li	a3,45
    15ca:	06d70463          	beq	a4,a3,1632 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ce:	fd07859b          	addiw	a1,a5,-48
    15d2:	4625                	li	a2,9
    15d4:	873e                	mv	a4,a5
    15d6:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d8:	4e01                	li	t3,0
    while (isdigit(*s))
    15da:	04b66a63          	bltu	a2,a1,162e <atoi+0x8a>
    int n = 0, neg = 0;
    15de:	4501                	li	a0,0
    while (isdigit(*s))
    15e0:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15e2:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15e4:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15e8:	0025179b          	slliw	a5,a0,0x2
    15ec:	9d3d                	addw	a0,a0,a5
    15ee:	fd07031b          	addiw	t1,a4,-48
    15f2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15fa:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15fe:	0006071b          	sext.w	a4,a2
    1602:	feb870e3          	bleu	a1,a6,15e2 <atoi+0x3e>
    return neg ? n : -n;
    1606:	000e0563          	beqz	t3,1610 <atoi+0x6c>
}
    160a:	8082                	ret
        s++;
    160c:	0505                	addi	a0,a0,1
    160e:	bf71                	j	15aa <atoi+0x6>
    1610:	4113053b          	subw	a0,t1,a7
    1614:	8082                	ret
    while (isdigit(*s))
    1616:	00154783          	lbu	a5,1(a0)
    161a:	4625                	li	a2,9
        s++;
    161c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1620:	fd07859b          	addiw	a1,a5,-48
    1624:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1628:	4e01                	li	t3,0
    while (isdigit(*s))
    162a:	fab67ae3          	bleu	a1,a2,15de <atoi+0x3a>
    162e:	4501                	li	a0,0
}
    1630:	8082                	ret
    while (isdigit(*s))
    1632:	00154783          	lbu	a5,1(a0)
    1636:	4625                	li	a2,9
        s++;
    1638:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163c:	fd07859b          	addiw	a1,a5,-48
    1640:	0007871b          	sext.w	a4,a5
    1644:	feb665e3          	bltu	a2,a1,162e <atoi+0x8a>
        neg = 1;
    1648:	4e05                	li	t3,1
    164a:	bf51                	j	15de <atoi+0x3a>

000000000000164c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164c:	16060d63          	beqz	a2,17c6 <memset+0x17a>
    1650:	40a007b3          	neg	a5,a0
    1654:	8b9d                	andi	a5,a5,7
    1656:	00778713          	addi	a4,a5,7
    165a:	482d                	li	a6,11
    165c:	0ff5f593          	andi	a1,a1,255
    1660:	fff60693          	addi	a3,a2,-1
    1664:	17076263          	bltu	a4,a6,17c8 <memset+0x17c>
    1668:	16e6ea63          	bltu	a3,a4,17dc <memset+0x190>
    166c:	16078563          	beqz	a5,17d6 <memset+0x18a>
    1670:	00b50023          	sb	a1,0(a0)
    1674:	4705                	li	a4,1
    1676:	00150e93          	addi	t4,a0,1
    167a:	14e78c63          	beq	a5,a4,17d2 <memset+0x186>
    167e:	00b500a3          	sb	a1,1(a0)
    1682:	4709                	li	a4,2
    1684:	00250e93          	addi	t4,a0,2
    1688:	14e78d63          	beq	a5,a4,17e2 <memset+0x196>
    168c:	00b50123          	sb	a1,2(a0)
    1690:	470d                	li	a4,3
    1692:	00350e93          	addi	t4,a0,3
    1696:	12e78b63          	beq	a5,a4,17cc <memset+0x180>
    169a:	00b501a3          	sb	a1,3(a0)
    169e:	4711                	li	a4,4
    16a0:	00450e93          	addi	t4,a0,4
    16a4:	14e78163          	beq	a5,a4,17e6 <memset+0x19a>
    16a8:	00b50223          	sb	a1,4(a0)
    16ac:	4715                	li	a4,5
    16ae:	00550e93          	addi	t4,a0,5
    16b2:	12e78c63          	beq	a5,a4,17ea <memset+0x19e>
    16b6:	00b502a3          	sb	a1,5(a0)
    16ba:	471d                	li	a4,7
    16bc:	00650e93          	addi	t4,a0,6
    16c0:	12e79763          	bne	a5,a4,17ee <memset+0x1a2>
    16c4:	00750e93          	addi	t4,a0,7
    16c8:	00b50323          	sb	a1,6(a0)
    16cc:	4f1d                	li	t5,7
    16ce:	00859713          	slli	a4,a1,0x8
    16d2:	8f4d                	or	a4,a4,a1
    16d4:	01059e13          	slli	t3,a1,0x10
    16d8:	01c76e33          	or	t3,a4,t3
    16dc:	01859313          	slli	t1,a1,0x18
    16e0:	006e6333          	or	t1,t3,t1
    16e4:	02059893          	slli	a7,a1,0x20
    16e8:	011368b3          	or	a7,t1,a7
    16ec:	02859813          	slli	a6,a1,0x28
    16f0:	40f60333          	sub	t1,a2,a5
    16f4:	0108e833          	or	a6,a7,a6
    16f8:	03059693          	slli	a3,a1,0x30
    16fc:	00d866b3          	or	a3,a6,a3
    1700:	03859713          	slli	a4,a1,0x38
    1704:	97aa                	add	a5,a5,a0
    1706:	ff837813          	andi	a6,t1,-8
    170a:	8f55                	or	a4,a4,a3
    170c:	00f806b3          	add	a3,a6,a5
    1710:	e398                	sd	a4,0(a5)
    1712:	07a1                	addi	a5,a5,8
    1714:	fed79ee3          	bne	a5,a3,1710 <memset+0xc4>
    1718:	ff837693          	andi	a3,t1,-8
    171c:	00de87b3          	add	a5,t4,a3
    1720:	01e6873b          	addw	a4,a3,t5
    1724:	0ad30663          	beq	t1,a3,17d0 <memset+0x184>
    1728:	00b78023          	sb	a1,0(a5)
    172c:	0017069b          	addiw	a3,a4,1
    1730:	08c6fb63          	bleu	a2,a3,17c6 <memset+0x17a>
    1734:	00b780a3          	sb	a1,1(a5)
    1738:	0027069b          	addiw	a3,a4,2
    173c:	08c6f563          	bleu	a2,a3,17c6 <memset+0x17a>
    1740:	00b78123          	sb	a1,2(a5)
    1744:	0037069b          	addiw	a3,a4,3
    1748:	06c6ff63          	bleu	a2,a3,17c6 <memset+0x17a>
    174c:	00b781a3          	sb	a1,3(a5)
    1750:	0047069b          	addiw	a3,a4,4
    1754:	06c6f963          	bleu	a2,a3,17c6 <memset+0x17a>
    1758:	00b78223          	sb	a1,4(a5)
    175c:	0057069b          	addiw	a3,a4,5
    1760:	06c6f363          	bleu	a2,a3,17c6 <memset+0x17a>
    1764:	00b782a3          	sb	a1,5(a5)
    1768:	0067069b          	addiw	a3,a4,6
    176c:	04c6fd63          	bleu	a2,a3,17c6 <memset+0x17a>
    1770:	00b78323          	sb	a1,6(a5)
    1774:	0077069b          	addiw	a3,a4,7
    1778:	04c6f763          	bleu	a2,a3,17c6 <memset+0x17a>
    177c:	00b783a3          	sb	a1,7(a5)
    1780:	0087069b          	addiw	a3,a4,8
    1784:	04c6f163          	bleu	a2,a3,17c6 <memset+0x17a>
    1788:	00b78423          	sb	a1,8(a5)
    178c:	0097069b          	addiw	a3,a4,9
    1790:	02c6fb63          	bleu	a2,a3,17c6 <memset+0x17a>
    1794:	00b784a3          	sb	a1,9(a5)
    1798:	00a7069b          	addiw	a3,a4,10
    179c:	02c6f563          	bleu	a2,a3,17c6 <memset+0x17a>
    17a0:	00b78523          	sb	a1,10(a5)
    17a4:	00b7069b          	addiw	a3,a4,11
    17a8:	00c6ff63          	bleu	a2,a3,17c6 <memset+0x17a>
    17ac:	00b785a3          	sb	a1,11(a5)
    17b0:	00c7069b          	addiw	a3,a4,12
    17b4:	00c6f963          	bleu	a2,a3,17c6 <memset+0x17a>
    17b8:	00b78623          	sb	a1,12(a5)
    17bc:	2735                	addiw	a4,a4,13
    17be:	00c77463          	bleu	a2,a4,17c6 <memset+0x17a>
    17c2:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c6:	8082                	ret
    17c8:	472d                	li	a4,11
    17ca:	bd79                	j	1668 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17cc:	4f0d                	li	t5,3
    17ce:	b701                	j	16ce <memset+0x82>
    17d0:	8082                	ret
    17d2:	4f05                	li	t5,1
    17d4:	bded                	j	16ce <memset+0x82>
    17d6:	8eaa                	mv	t4,a0
    17d8:	4f01                	li	t5,0
    17da:	bdd5                	j	16ce <memset+0x82>
    17dc:	87aa                	mv	a5,a0
    17de:	4701                	li	a4,0
    17e0:	b7a1                	j	1728 <memset+0xdc>
    17e2:	4f09                	li	t5,2
    17e4:	b5ed                	j	16ce <memset+0x82>
    17e6:	4f11                	li	t5,4
    17e8:	b5dd                	j	16ce <memset+0x82>
    17ea:	4f15                	li	t5,5
    17ec:	b5cd                	j	16ce <memset+0x82>
    17ee:	4f19                	li	t5,6
    17f0:	bdf9                	j	16ce <memset+0x82>

00000000000017f2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f2:	00054703          	lbu	a4,0(a0)
    17f6:	0005c783          	lbu	a5,0(a1)
    17fa:	00e79b63          	bne	a5,a4,1810 <strcmp+0x1e>
    17fe:	cf89                	beqz	a5,1818 <strcmp+0x26>
    1800:	0505                	addi	a0,a0,1
    1802:	0585                	addi	a1,a1,1
    1804:	0005c783          	lbu	a5,0(a1)
    1808:	00054703          	lbu	a4,0(a0)
    180c:	fef709e3          	beq	a4,a5,17fe <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1810:	0007051b          	sext.w	a0,a4
}
    1814:	9d1d                	subw	a0,a0,a5
    1816:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1818:	4501                	li	a0,0
}
    181a:	9d1d                	subw	a0,a0,a5
    181c:	8082                	ret

000000000000181e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    181e:	c231                	beqz	a2,1862 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1820:	00054783          	lbu	a5,0(a0)
    1824:	0005c683          	lbu	a3,0(a1)
    1828:	c795                	beqz	a5,1854 <strncmp+0x36>
    182a:	ca85                	beqz	a3,185a <strncmp+0x3c>
    if (!n--)
    182c:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182e:	c615                	beqz	a2,185a <strncmp+0x3c>
    1830:	00150713          	addi	a4,a0,1
    1834:	9532                	add	a0,a0,a2
    1836:	00d78963          	beq	a5,a3,1848 <strncmp+0x2a>
    183a:	a005                	j	185a <strncmp+0x3c>
    183c:	ce99                	beqz	a3,185a <strncmp+0x3c>
    183e:	00e50e63          	beq	a0,a4,185a <strncmp+0x3c>
    1842:	0705                	addi	a4,a4,1
    1844:	00d79b63          	bne	a5,a3,185a <strncmp+0x3c>
    1848:	00074783          	lbu	a5,0(a4)
    184c:	0585                	addi	a1,a1,1
    184e:	0005c683          	lbu	a3,0(a1)
    1852:	f7ed                	bnez	a5,183c <strncmp+0x1e>
    1854:	4501                	li	a0,0
        ;
    return *l - *r;
    1856:	9d15                	subw	a0,a0,a3
    1858:	8082                	ret
    185a:	0007851b          	sext.w	a0,a5
    185e:	9d15                	subw	a0,a0,a3
    1860:	8082                	ret
        return 0;
    1862:	4501                	li	a0,0
}
    1864:	8082                	ret

0000000000001866 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1866:	00757793          	andi	a5,a0,7
    186a:	cfa1                	beqz	a5,18c2 <strlen+0x5c>
        if (!*s)
    186c:	00054783          	lbu	a5,0(a0)
    1870:	cbb9                	beqz	a5,18c6 <strlen+0x60>
    1872:	87aa                	mv	a5,a0
    1874:	a021                	j	187c <strlen+0x16>
    1876:	0007c703          	lbu	a4,0(a5)
    187a:	c329                	beqz	a4,18bc <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    187c:	0785                	addi	a5,a5,1
    187e:	0077f713          	andi	a4,a5,7
    1882:	fb75                	bnez	a4,1876 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1884:	00000717          	auipc	a4,0x0
    1888:	7d470713          	addi	a4,a4,2004 # 2058 <__clone+0x9c>
    188c:	630c                	ld	a1,0(a4)
    188e:	00000717          	auipc	a4,0x0
    1892:	7d270713          	addi	a4,a4,2002 # 2060 <__clone+0xa4>
    1896:	6394                	ld	a3,0(a5)
    1898:	6310                	ld	a2,0(a4)
    189a:	a019                	j	18a0 <strlen+0x3a>
    189c:	07a1                	addi	a5,a5,8
    189e:	6394                	ld	a3,0(a5)
    18a0:	00b68733          	add	a4,a3,a1
    18a4:	fff6c693          	not	a3,a3
    18a8:	8f75                	and	a4,a4,a3
    18aa:	8f71                	and	a4,a4,a2
    18ac:	db65                	beqz	a4,189c <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	c709                	beqz	a4,18bc <strlen+0x56>
    18b4:	0785                	addi	a5,a5,1
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	ff6d                	bnez	a4,18b4 <strlen+0x4e>
        ;
    return s - a;
    18bc:	40a78533          	sub	a0,a5,a0
}
    18c0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c2:	87aa                	mv	a5,a0
    18c4:	b7c1                	j	1884 <strlen+0x1e>
        if (!*s)
    18c6:	4501                	li	a0,0
            return s - a;
    18c8:	8082                	ret

00000000000018ca <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ca:	00757793          	andi	a5,a0,7
    18ce:	0ff5f593          	andi	a1,a1,255
    18d2:	cb99                	beqz	a5,18e8 <memchr+0x1e>
    18d4:	c655                	beqz	a2,1980 <memchr+0xb6>
    18d6:	00054783          	lbu	a5,0(a0)
    18da:	0ab78663          	beq	a5,a1,1986 <memchr+0xbc>
    18de:	0505                	addi	a0,a0,1
    18e0:	00757793          	andi	a5,a0,7
    18e4:	167d                	addi	a2,a2,-1
    18e6:	f7fd                	bnez	a5,18d4 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e8:	4701                	li	a4,0
    if (n && *s != c)
    18ea:	ca49                	beqz	a2,197c <memchr+0xb2>
    18ec:	00054783          	lbu	a5,0(a0)
    18f0:	08b78b63          	beq	a5,a1,1986 <memchr+0xbc>
        size_t k = ONES * c;
    18f4:	00000797          	auipc	a5,0x0
    18f8:	77478793          	addi	a5,a5,1908 # 2068 <__clone+0xac>
    18fc:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fe:	479d                	li	a5,7
        size_t k = ONES * c;
    1900:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1904:	08c7f863          	bleu	a2,a5,1994 <memchr+0xca>
    1908:	611c                	ld	a5,0(a0)
    190a:	00000317          	auipc	t1,0x0
    190e:	75630313          	addi	t1,t1,1878 # 2060 <__clone+0xa4>
    1912:	00033803          	ld	a6,0(t1)
    1916:	00f8c7b3          	xor	a5,a7,a5
    191a:	fff7c713          	not	a4,a5
    191e:	8f95                	sub	a5,a5,a3
    1920:	8ff9                	and	a5,a5,a4
    1922:	0107f7b3          	and	a5,a5,a6
    1926:	e7bd                	bnez	a5,1994 <memchr+0xca>
    1928:	4e1d                	li	t3,7
    192a:	00000e97          	auipc	t4,0x0
    192e:	72ee8e93          	addi	t4,t4,1838 # 2058 <__clone+0x9c>
    1932:	a005                	j	1952 <memchr+0x88>
    1934:	6514                	ld	a3,8(a0)
    1936:	000eb783          	ld	a5,0(t4)
    193a:	00033803          	ld	a6,0(t1)
    193e:	00d8c6b3          	xor	a3,a7,a3
    1942:	97b6                	add	a5,a5,a3
    1944:	fff6c693          	not	a3,a3
    1948:	8ff5                	and	a5,a5,a3
    194a:	0107f7b3          	and	a5,a5,a6
    194e:	e3a1                	bnez	a5,198e <memchr+0xc4>
    1950:	853a                	mv	a0,a4
    1952:	1661                	addi	a2,a2,-8
    1954:	00850713          	addi	a4,a0,8
    1958:	fcce6ee3          	bltu	t3,a2,1934 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    195c:	c215                	beqz	a2,1980 <memchr+0xb6>
    195e:	00074783          	lbu	a5,0(a4)
    1962:	00f58d63          	beq	a1,a5,197c <memchr+0xb2>
    1966:	00170793          	addi	a5,a4,1
    196a:	963a                	add	a2,a2,a4
    196c:	873e                	mv	a4,a5
    196e:	00f60963          	beq	a2,a5,1980 <memchr+0xb6>
    1972:	0007c683          	lbu	a3,0(a5)
    1976:	0785                	addi	a5,a5,1
    1978:	feb69ae3          	bne	a3,a1,196c <memchr+0xa2>
}
    197c:	853a                	mv	a0,a4
    197e:	8082                	ret
    return n ? (void *)s : 0;
    1980:	4701                	li	a4,0
}
    1982:	853a                	mv	a0,a4
    1984:	8082                	ret
    1986:	872a                	mv	a4,a0
    1988:	00074783          	lbu	a5,0(a4)
    198c:	bfd9                	j	1962 <memchr+0x98>
    198e:	00854783          	lbu	a5,8(a0)
    1992:	bfc1                	j	1962 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1994:	872a                	mv	a4,a0
    1996:	bfc1                	j	1966 <memchr+0x9c>

0000000000001998 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1998:	00757793          	andi	a5,a0,7
    199c:	cfc5                	beqz	a5,1a54 <strnlen+0xbc>
    199e:	c1c5                	beqz	a1,1a3e <strnlen+0xa6>
    19a0:	00054783          	lbu	a5,0(a0)
    19a4:	cfd9                	beqz	a5,1a42 <strnlen+0xaa>
    19a6:	87ae                	mv	a5,a1
    19a8:	86aa                	mv	a3,a0
    19aa:	a029                	j	19b4 <strnlen+0x1c>
    19ac:	cbc9                	beqz	a5,1a3e <strnlen+0xa6>
    19ae:	0006c703          	lbu	a4,0(a3)
    19b2:	cb51                	beqz	a4,1a46 <strnlen+0xae>
    19b4:	0685                	addi	a3,a3,1
    19b6:	0076f713          	andi	a4,a3,7
    19ba:	17fd                	addi	a5,a5,-1
    19bc:	fb65                	bnez	a4,19ac <strnlen+0x14>
    if (n && *s != c)
    19be:	c3c1                	beqz	a5,1a3e <strnlen+0xa6>
    19c0:	0006c703          	lbu	a4,0(a3)
    19c4:	c349                	beqz	a4,1a46 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c6:	471d                	li	a4,7
    19c8:	08f77a63          	bleu	a5,a4,1a5c <strnlen+0xc4>
    19cc:	00000e17          	auipc	t3,0x0
    19d0:	68ce0e13          	addi	t3,t3,1676 # 2058 <__clone+0x9c>
    19d4:	6290                	ld	a2,0(a3)
    19d6:	000e3703          	ld	a4,0(t3)
    19da:	00000e97          	auipc	t4,0x0
    19de:	686e8e93          	addi	t4,t4,1670 # 2060 <__clone+0xa4>
    19e2:	000eb803          	ld	a6,0(t4)
    19e6:	9732                	add	a4,a4,a2
    19e8:	fff64613          	not	a2,a2
    19ec:	8f71                	and	a4,a4,a2
    19ee:	01077733          	and	a4,a4,a6
    19f2:	e72d                	bnez	a4,1a5c <strnlen+0xc4>
    19f4:	4f1d                	li	t5,7
    19f6:	a839                	j	1a14 <strnlen+0x7c>
    19f8:	6698                	ld	a4,8(a3)
    19fa:	000e3303          	ld	t1,0(t3)
    19fe:	000eb803          	ld	a6,0(t4)
    1a02:	fff74893          	not	a7,a4
    1a06:	971a                	add	a4,a4,t1
    1a08:	01177733          	and	a4,a4,a7
    1a0c:	01077733          	and	a4,a4,a6
    1a10:	ef1d                	bnez	a4,1a4e <strnlen+0xb6>
    1a12:	86b2                	mv	a3,a2
    1a14:	17e1                	addi	a5,a5,-8
    1a16:	00868613          	addi	a2,a3,8
    1a1a:	fcff6fe3          	bltu	t5,a5,19f8 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a1e:	c385                	beqz	a5,1a3e <strnlen+0xa6>
    1a20:	00064703          	lbu	a4,0(a2)
    1a24:	cb19                	beqz	a4,1a3a <strnlen+0xa2>
    1a26:	00160713          	addi	a4,a2,1
    1a2a:	97b2                	add	a5,a5,a2
    1a2c:	863a                	mv	a2,a4
    1a2e:	00e78863          	beq	a5,a4,1a3e <strnlen+0xa6>
    1a32:	0705                	addi	a4,a4,1
    1a34:	fff74683          	lbu	a3,-1(a4)
    1a38:	faf5                	bnez	a3,1a2c <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a3a:	40a605b3          	sub	a1,a2,a0
}
    1a3e:	852e                	mv	a0,a1
    1a40:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a42:	87ae                	mv	a5,a1
    1a44:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a46:	8636                	mv	a2,a3
    1a48:	00064703          	lbu	a4,0(a2)
    1a4c:	bfe1                	j	1a24 <strnlen+0x8c>
    1a4e:	0086c703          	lbu	a4,8(a3)
    1a52:	bfc9                	j	1a24 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a54:	87ae                	mv	a5,a1
    1a56:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a58:	f7a5                	bnez	a5,19c0 <strnlen+0x28>
    1a5a:	b7d5                	j	1a3e <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a5c:	8636                	mv	a2,a3
    1a5e:	b7e1                	j	1a26 <strnlen+0x8e>

0000000000001a60 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a60:	00b547b3          	xor	a5,a0,a1
    1a64:	8b9d                	andi	a5,a5,7
    1a66:	efa9                	bnez	a5,1ac0 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a68:	0075f793          	andi	a5,a1,7
    1a6c:	c38d                	beqz	a5,1a8e <strcpy+0x2e>
            if (!(*d = *s))
    1a6e:	0005c783          	lbu	a5,0(a1)
    1a72:	00f50023          	sb	a5,0(a0)
    1a76:	e799                	bnez	a5,1a84 <strcpy+0x24>
    1a78:	a095                	j	1adc <strcpy+0x7c>
    1a7a:	0005c783          	lbu	a5,0(a1)
    1a7e:	00f50023          	sb	a5,0(a0)
    1a82:	cbb9                	beqz	a5,1ad8 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a84:	0585                	addi	a1,a1,1
    1a86:	0075f793          	andi	a5,a1,7
    1a8a:	0505                	addi	a0,a0,1
    1a8c:	f7fd                	bnez	a5,1a7a <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a8e:	00000797          	auipc	a5,0x0
    1a92:	5ca78793          	addi	a5,a5,1482 # 2058 <__clone+0x9c>
    1a96:	0007b803          	ld	a6,0(a5)
    1a9a:	00000797          	auipc	a5,0x0
    1a9e:	5c678793          	addi	a5,a5,1478 # 2060 <__clone+0xa4>
    1aa2:	6198                	ld	a4,0(a1)
    1aa4:	6390                	ld	a2,0(a5)
    1aa6:	a031                	j	1ab2 <strcpy+0x52>
    1aa8:	0521                	addi	a0,a0,8
    1aaa:	05a1                	addi	a1,a1,8
    1aac:	fee53c23          	sd	a4,-8(a0)
    1ab0:	6198                	ld	a4,0(a1)
    1ab2:	010707b3          	add	a5,a4,a6
    1ab6:	fff74693          	not	a3,a4
    1aba:	8ff5                	and	a5,a5,a3
    1abc:	8ff1                	and	a5,a5,a2
    1abe:	d7ed                	beqz	a5,1aa8 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ac0:	0005c783          	lbu	a5,0(a1)
    1ac4:	00f50023          	sb	a5,0(a0)
    1ac8:	cb89                	beqz	a5,1ada <strcpy+0x7a>
    1aca:	0585                	addi	a1,a1,1
    1acc:	0005c783          	lbu	a5,0(a1)
    1ad0:	0505                	addi	a0,a0,1
    1ad2:	00f50023          	sb	a5,0(a0)
    1ad6:	fbf5                	bnez	a5,1aca <strcpy+0x6a>
        ;
    return d;
}
    1ad8:	8082                	ret
    1ada:	8082                	ret
    1adc:	8082                	ret

0000000000001ade <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ade:	00b547b3          	xor	a5,a0,a1
    1ae2:	8b9d                	andi	a5,a5,7
    1ae4:	ebc1                	bnez	a5,1b74 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ae6:	0075f793          	andi	a5,a1,7
    1aea:	cf91                	beqz	a5,1b06 <strncpy+0x28>
    1aec:	20060e63          	beqz	a2,1d08 <strncpy+0x22a>
    1af0:	0005c783          	lbu	a5,0(a1)
    1af4:	00f50023          	sb	a5,0(a0)
    1af8:	c3d5                	beqz	a5,1b9c <strncpy+0xbe>
    1afa:	0585                	addi	a1,a1,1
    1afc:	0075f793          	andi	a5,a1,7
    1b00:	167d                	addi	a2,a2,-1
    1b02:	0505                	addi	a0,a0,1
    1b04:	f7e5                	bnez	a5,1aec <strncpy+0xe>
            ;
        if (!n || !*s)
    1b06:	20060163          	beqz	a2,1d08 <strncpy+0x22a>
    1b0a:	0005c683          	lbu	a3,0(a1)
    1b0e:	c6d9                	beqz	a3,1b9c <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b10:	479d                	li	a5,7
    1b12:	22c7f563          	bleu	a2,a5,1d3c <strncpy+0x25e>
    1b16:	00000317          	auipc	t1,0x0
    1b1a:	54230313          	addi	t1,t1,1346 # 2058 <__clone+0x9c>
    1b1e:	6198                	ld	a4,0(a1)
    1b20:	00033783          	ld	a5,0(t1)
    1b24:	00000e17          	auipc	t3,0x0
    1b28:	53ce0e13          	addi	t3,t3,1340 # 2060 <__clone+0xa4>
    1b2c:	000e3803          	ld	a6,0(t3)
    1b30:	97ba                	add	a5,a5,a4
    1b32:	fff74893          	not	a7,a4
    1b36:	0117f7b3          	and	a5,a5,a7
    1b3a:	0107f7b3          	and	a5,a5,a6
    1b3e:	1e079f63          	bnez	a5,1d3c <strncpy+0x25e>
    1b42:	4e9d                	li	t4,7
    1b44:	a005                	j	1b64 <strncpy+0x86>
    1b46:	6598                	ld	a4,8(a1)
    1b48:	00033783          	ld	a5,0(t1)
    1b4c:	000e3803          	ld	a6,0(t3)
    1b50:	fff74893          	not	a7,a4
    1b54:	97ba                	add	a5,a5,a4
    1b56:	0117f7b3          	and	a5,a5,a7
    1b5a:	0107f7b3          	and	a5,a5,a6
    1b5e:	1a079f63          	bnez	a5,1d1c <strncpy+0x23e>
    1b62:	85b6                	mv	a1,a3
            *wd = *ws;
    1b64:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b66:	1661                	addi	a2,a2,-8
    1b68:	00858693          	addi	a3,a1,8
    1b6c:	0521                	addi	a0,a0,8
    1b6e:	fcceece3          	bltu	t4,a2,1b46 <strncpy+0x68>
    1b72:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b74:	18060a63          	beqz	a2,1d08 <strncpy+0x22a>
    1b78:	0005c783          	lbu	a5,0(a1)
    1b7c:	872a                	mv	a4,a0
    1b7e:	00f50023          	sb	a5,0(a0)
    1b82:	e799                	bnez	a5,1b90 <strncpy+0xb2>
    1b84:	a829                	j	1b9e <strncpy+0xc0>
    1b86:	0005c783          	lbu	a5,0(a1)
    1b8a:	00f70023          	sb	a5,0(a4)
    1b8e:	cb81                	beqz	a5,1b9e <strncpy+0xc0>
    1b90:	167d                	addi	a2,a2,-1
    1b92:	0585                	addi	a1,a1,1
    1b94:	0705                	addi	a4,a4,1
    1b96:	fa65                	bnez	a2,1b86 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b98:	853a                	mv	a0,a4
    1b9a:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b9c:	872a                	mv	a4,a0
    1b9e:	4805                	li	a6,1
    1ba0:	14061c63          	bnez	a2,1cf8 <strncpy+0x21a>
    1ba4:	40e007b3          	neg	a5,a4
    1ba8:	8b9d                	andi	a5,a5,7
    1baa:	4581                	li	a1,0
    1bac:	12061e63          	bnez	a2,1ce8 <strncpy+0x20a>
    1bb0:	00778693          	addi	a3,a5,7
    1bb4:	452d                	li	a0,11
    1bb6:	12a6e763          	bltu	a3,a0,1ce4 <strncpy+0x206>
    1bba:	16d5e663          	bltu	a1,a3,1d26 <strncpy+0x248>
    1bbe:	14078c63          	beqz	a5,1d16 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc2:	00070023          	sb	zero,0(a4)
    1bc6:	4585                	li	a1,1
    1bc8:	00170693          	addi	a3,a4,1
    1bcc:	14b78363          	beq	a5,a1,1d12 <strncpy+0x234>
    1bd0:	000700a3          	sb	zero,1(a4)
    1bd4:	4589                	li	a1,2
    1bd6:	00270693          	addi	a3,a4,2
    1bda:	14b78963          	beq	a5,a1,1d2c <strncpy+0x24e>
    1bde:	00070123          	sb	zero,2(a4)
    1be2:	458d                	li	a1,3
    1be4:	00370693          	addi	a3,a4,3
    1be8:	12b78363          	beq	a5,a1,1d0e <strncpy+0x230>
    1bec:	000701a3          	sb	zero,3(a4)
    1bf0:	4591                	li	a1,4
    1bf2:	00470693          	addi	a3,a4,4
    1bf6:	12b78d63          	beq	a5,a1,1d30 <strncpy+0x252>
    1bfa:	00070223          	sb	zero,4(a4)
    1bfe:	4595                	li	a1,5
    1c00:	00570693          	addi	a3,a4,5
    1c04:	12b78863          	beq	a5,a1,1d34 <strncpy+0x256>
    1c08:	000702a3          	sb	zero,5(a4)
    1c0c:	459d                	li	a1,7
    1c0e:	00670693          	addi	a3,a4,6
    1c12:	12b79363          	bne	a5,a1,1d38 <strncpy+0x25a>
    1c16:	00770693          	addi	a3,a4,7
    1c1a:	00070323          	sb	zero,6(a4)
    1c1e:	40f80833          	sub	a6,a6,a5
    1c22:	ff887513          	andi	a0,a6,-8
    1c26:	97ba                	add	a5,a5,a4
    1c28:	953e                	add	a0,a0,a5
    1c2a:	0007b023          	sd	zero,0(a5)
    1c2e:	07a1                	addi	a5,a5,8
    1c30:	fea79de3          	bne	a5,a0,1c2a <strncpy+0x14c>
    1c34:	ff887513          	andi	a0,a6,-8
    1c38:	9da9                	addw	a1,a1,a0
    1c3a:	00a687b3          	add	a5,a3,a0
    1c3e:	f4a80de3          	beq	a6,a0,1b98 <strncpy+0xba>
    1c42:	00078023          	sb	zero,0(a5)
    1c46:	0015869b          	addiw	a3,a1,1
    1c4a:	f4c6f7e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c4e:	000780a3          	sb	zero,1(a5)
    1c52:	0025869b          	addiw	a3,a1,2
    1c56:	f4c6f1e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c5a:	00078123          	sb	zero,2(a5)
    1c5e:	0035869b          	addiw	a3,a1,3
    1c62:	f2c6fbe3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c66:	000781a3          	sb	zero,3(a5)
    1c6a:	0045869b          	addiw	a3,a1,4
    1c6e:	f2c6f5e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c72:	00078223          	sb	zero,4(a5)
    1c76:	0055869b          	addiw	a3,a1,5
    1c7a:	f0c6ffe3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c7e:	000782a3          	sb	zero,5(a5)
    1c82:	0065869b          	addiw	a3,a1,6
    1c86:	f0c6f9e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c8a:	00078323          	sb	zero,6(a5)
    1c8e:	0075869b          	addiw	a3,a1,7
    1c92:	f0c6f3e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1c96:	000783a3          	sb	zero,7(a5)
    1c9a:	0085869b          	addiw	a3,a1,8
    1c9e:	eec6fde3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1ca2:	00078423          	sb	zero,8(a5)
    1ca6:	0095869b          	addiw	a3,a1,9
    1caa:	eec6f7e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1cae:	000784a3          	sb	zero,9(a5)
    1cb2:	00a5869b          	addiw	a3,a1,10
    1cb6:	eec6f1e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1cba:	00078523          	sb	zero,10(a5)
    1cbe:	00b5869b          	addiw	a3,a1,11
    1cc2:	ecc6fbe3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1cc6:	000785a3          	sb	zero,11(a5)
    1cca:	00c5869b          	addiw	a3,a1,12
    1cce:	ecc6f5e3          	bleu	a2,a3,1b98 <strncpy+0xba>
    1cd2:	00078623          	sb	zero,12(a5)
    1cd6:	25b5                	addiw	a1,a1,13
    1cd8:	ecc5f0e3          	bleu	a2,a1,1b98 <strncpy+0xba>
    1cdc:	000786a3          	sb	zero,13(a5)
}
    1ce0:	853a                	mv	a0,a4
    1ce2:	8082                	ret
    1ce4:	46ad                	li	a3,11
    1ce6:	bdd1                	j	1bba <strncpy+0xdc>
    1ce8:	00778693          	addi	a3,a5,7
    1cec:	452d                	li	a0,11
    1cee:	fff60593          	addi	a1,a2,-1
    1cf2:	eca6f4e3          	bleu	a0,a3,1bba <strncpy+0xdc>
    1cf6:	b7fd                	j	1ce4 <strncpy+0x206>
    1cf8:	40e007b3          	neg	a5,a4
    1cfc:	8832                	mv	a6,a2
    1cfe:	8b9d                	andi	a5,a5,7
    1d00:	4581                	li	a1,0
    1d02:	ea0607e3          	beqz	a2,1bb0 <strncpy+0xd2>
    1d06:	b7cd                	j	1ce8 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d08:	872a                	mv	a4,a0
}
    1d0a:	853a                	mv	a0,a4
    1d0c:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d0e:	458d                	li	a1,3
    1d10:	b739                	j	1c1e <strncpy+0x140>
    1d12:	4585                	li	a1,1
    1d14:	b729                	j	1c1e <strncpy+0x140>
    1d16:	86ba                	mv	a3,a4
    1d18:	4581                	li	a1,0
    1d1a:	b711                	j	1c1e <strncpy+0x140>
    1d1c:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d20:	872a                	mv	a4,a0
    1d22:	85b6                	mv	a1,a3
    1d24:	bda9                	j	1b7e <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d26:	87ba                	mv	a5,a4
    1d28:	4581                	li	a1,0
    1d2a:	bf21                	j	1c42 <strncpy+0x164>
    1d2c:	4589                	li	a1,2
    1d2e:	bdc5                	j	1c1e <strncpy+0x140>
    1d30:	4591                	li	a1,4
    1d32:	b5f5                	j	1c1e <strncpy+0x140>
    1d34:	4595                	li	a1,5
    1d36:	b5e5                	j	1c1e <strncpy+0x140>
    1d38:	4599                	li	a1,6
    1d3a:	b5d5                	j	1c1e <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d3c:	00d50023          	sb	a3,0(a0)
    1d40:	872a                	mv	a4,a0
    1d42:	b5b9                	j	1b90 <strncpy+0xb2>

0000000000001d44 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d44:	87aa                	mv	a5,a0
    1d46:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d48:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d4c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d50:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d52:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d54:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <openat>:
    register long a7 __asm__("a7") = n;
    1d5c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d60:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d64:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <close>:
    register long a7 __asm__("a7") = n;
    1d6c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d70:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <read>:
    register long a7 __asm__("a7") = n;
    1d78:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d80:	8082                	ret

0000000000001d82 <write>:
    register long a7 __asm__("a7") = n;
    1d82:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d86:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d8a:	8082                	ret

0000000000001d8c <getpid>:
    register long a7 __asm__("a7") = n;
    1d8c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d90:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <getppid>:
    register long a7 __asm__("a7") = n;
    1d98:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d9c:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1da4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1da8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <fork>:
    register long a7 __asm__("a7") = n;
    1db0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1db4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1db6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dc0:	85b2                	mv	a1,a2
    1dc2:	863a                	mv	a2,a4
    if (stack)
    1dc4:	c191                	beqz	a1,1dc8 <clone+0x8>
	stack += stack_size;
    1dc6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dc8:	4781                	li	a5,0
    1dca:	4701                	li	a4,0
    1dcc:	4681                	li	a3,0
    1dce:	2601                	sext.w	a2,a2
    1dd0:	1ec0006f          	j	1fbc <__clone>

0000000000001dd4 <exit>:
    register long a7 __asm__("a7") = n;
    1dd4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dd8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ddc:	8082                	ret

0000000000001dde <waitpid>:
    register long a7 __asm__("a7") = n;
    1dde:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1de2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1de4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <exec>:
    register long a7 __asm__("a7") = n;
    1dec:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <execve>:
    register long a7 __asm__("a7") = n;
    1df8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <times>:
    register long a7 __asm__("a7") = n;
    1e04:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e08:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <get_time>:

int64 get_time()
{
    1e10:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e12:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e16:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e1e:	2501                	sext.w	a0,a0
    1e20:	ed09                	bnez	a0,1e3a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e22:	67a2                	ld	a5,8(sp)
    1e24:	3e800713          	li	a4,1000
    1e28:	00015503          	lhu	a0,0(sp)
    1e2c:	02e7d7b3          	divu	a5,a5,a4
    1e30:	02e50533          	mul	a0,a0,a4
    1e34:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e36:	0141                	addi	sp,sp,16
    1e38:	8082                	ret
        return -1;
    1e3a:	557d                	li	a0,-1
    1e3c:	bfed                	j	1e36 <get_time+0x26>

0000000000001e3e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e3e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e42:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <time>:
    register long a7 __asm__("a7") = n;
    1e4a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <sleep>:

int sleep(unsigned long long time)
{
    1e56:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e58:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e5a:	850a                	mv	a0,sp
    1e5c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e5e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e62:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e68:	e501                	bnez	a0,1e70 <sleep+0x1a>
    return 0;
    1e6a:	4501                	li	a0,0
}
    1e6c:	0141                	addi	sp,sp,16
    1e6e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e70:	4502                	lw	a0,0(sp)
}
    1e72:	0141                	addi	sp,sp,16
    1e74:	8082                	ret

0000000000001e76 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e76:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e82:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e86:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e8a:	8082                	ret

0000000000001e8c <munmap>:
    register long a7 __asm__("a7") = n;
    1e8c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <wait>:

int wait(int *code)
{
    1e98:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e9e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ea0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ea2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ea4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <spawn>:
    register long a7 __asm__("a7") = n;
    1eac:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eb0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <mailread>:
    register long a7 __asm__("a7") = n;
    1eb8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ec4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <fstat>:
    register long a7 __asm__("a7") = n;
    1ed0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1edc:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ede:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ee2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eec:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eee:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ef2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <link>:

int link(char *old_path, char *new_path)
{
    1efc:	87aa                	mv	a5,a0
    1efe:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f00:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f0a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f0e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f10:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <unlink>:

int unlink(char *path)
{
    1f18:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f1a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f1e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f22:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <uname>:
    register long a7 __asm__("a7") = n;
    1f2c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f30:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <brk>:
    register long a7 __asm__("a7") = n;
    1f38:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f3c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f44:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f46:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f4a:	8082                	ret

0000000000001f4c <chdir>:
    register long a7 __asm__("a7") = n;
    1f4c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f50:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f58:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f5a:	02059613          	slli	a2,a1,0x20
    1f5e:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f60:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f64:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f68:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6a:	00000073          	ecall
}
    1f6e:	2501                	sext.w	a0,a0
    1f70:	8082                	ret

0000000000001f72 <getdents>:
    register long a7 __asm__("a7") = n;
    1f72:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f76:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <pipe>:
    register long a7 __asm__("a7") = n;
    1f7e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f84:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f88:	2501                	sext.w	a0,a0
    1f8a:	8082                	ret

0000000000001f8c <dup>:
    register long a7 __asm__("a7") = n;
    1f8c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f8e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f92:	2501                	sext.w	a0,a0
    1f94:	8082                	ret

0000000000001f96 <dup2>:
    register long a7 __asm__("a7") = n;
    1f96:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f98:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <mount>:
    register long a7 __asm__("a7") = n;
    1fa2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <umount>:
    register long a7 __asm__("a7") = n;
    1fae:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fb8:	2501                	sext.w	a0,a0
    1fba:	8082                	ret

0000000000001fbc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fbc:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fbe:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fc0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fc2:	8532                	mv	a0,a2
	mv a2, a4
    1fc4:	863a                	mv	a2,a4
	mv a3, a5
    1fc6:	86be                	mv	a3,a5
	mv a4, a6
    1fc8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fca:	0dc00893          	li	a7,220
	ecall
    1fce:	00000073          	ecall

	beqz a0, 1f
    1fd2:	c111                	beqz	a0,1fd6 <__clone+0x1a>
	# Parent
	ret
    1fd4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fd6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fd8:	6522                	ld	a0,8(sp)
	jalr a1
    1fda:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fdc:	05d00893          	li	a7,93
	ecall
    1fe0:	00000073          	ecall
