.class final Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;
.super Landroid/service/fingerprint/IFingerprintService$Stub;
.source "FingerprintService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/fingerprint/FingerprintService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FingerprintServiceWrapper"
.end annotation


# static fields
.field private static final DUMP_CMD_GET_NUM_ENROLLMENT_STEPS:Ljava/lang/String; = "getNumEnrollmentSteps"

.field private static final DUMP_CMD_PRINT_ENROLLMENTS:Ljava/lang/String; = "printEnrollments"

.field private static final DUMP_CMD_REMOVE_FINGER:Ljava/lang/String; = "removeFinger"

.field private static final DUMP_CMD_SET_FINGER_NAME:Ljava/lang/String; = "setFingerName"


# instance fields
.field final synthetic this$0:Lcom/android/server/fingerprint/FingerprintService;


# direct methods
.method private constructor <init>(Lcom/android/server/fingerprint/FingerprintService;)V
    .locals 0

    .prologue
    .line 498
    iput-object p1, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-direct {p0}, Landroid/service/fingerprint/IFingerprintService$Stub;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/fingerprint/FingerprintService;Lcom/android/server/fingerprint/FingerprintService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/fingerprint/FingerprintService;
    .param p2, "x1"    # Lcom/android/server/fingerprint/FingerprintService$1;

    .prologue
    .line 498
    invoke-direct {p0, p1}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;-><init>(Lcom/android/server/fingerprint/FingerprintService;)V

    return-void
.end method

.method private dumpCommandList(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 658
    const-string v0, "Valid Fingerprint Commands:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 659
    const-string v0, "printEnrollments - Print Fingerprint Enrollments"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 660
    const-string v0, "removeFinger <id> - Remove fingerprint"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 661
    const-string v0, "setFingerName <id> <name> - Rename a finger"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 662
    const-string v0, "getNumEnrollmentSteps - Returns num of steps the vendor requires to enroll a finger."

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 664
    return-void
.end method

.method private dumpEnrollments(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 6
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    .line 635
    const/4 v4, 0x0

    :try_start_0
    iget-object v5, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->getCurrentUserId()I
    invoke-static {v5}, Lcom/android/server/fingerprint/FingerprintService;->access$600(Lcom/android/server/fingerprint/FingerprintService;)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->getEnrolledFingerprints(Landroid/os/IBinder;I)Ljava/util/List;

    move-result-object v2

    .line 636
    .local v2, "fingerprints":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/fingerprint/Fingerprint;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " fingerprints found"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 637
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/fingerprint/Fingerprint;

    .line 638
    .local v1, "fingerprint":Landroid/hardware/fingerprint/Fingerprint;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fingerprint id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/hardware/fingerprint/Fingerprint;->getFingerId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/hardware/fingerprint/Fingerprint;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " userId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/hardware/fingerprint/Fingerprint;->getUserId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 643
    .end local v1    # "fingerprint":Landroid/hardware/fingerprint/Fingerprint;
    .end local v2    # "fingerprints":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/fingerprint/Fingerprint;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 644
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 646
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method

.method private dumpGetNumEnrollmentSteps(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 4
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    .line 650
    :try_start_0
    iget-object v2, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v2}, Lcom/android/server/fingerprint/FingerprintService;->getNumEnrollmentSteps()I

    move-result v1

    .line 651
    .local v1, "steps":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Number of enrollment steps: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 655
    .end local v1    # "steps":I
    :goto_0
    return-void

    .line 652
    :catch_0
    move-exception v0

    .line 653
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private dumpRemoveFinger(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    const/16 v6, 0x22

    const/4 v5, 0x1

    .line 619
    const/4 v3, 0x1

    :try_start_0
    aget-object v3, p2, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 620
    .local v1, "index":I
    if-gtz v1, :cond_0

    .line 621
    const-string v3, "INVALID INDEX: index must be greater than 0"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 631
    .end local v1    # "index":I
    :goto_0
    return-void

    .line 624
    .restart local v1    # "index":I
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Removing finger "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 625
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->getCurrentUserId()I
    invoke-static {v4}, Lcom/android/server/fingerprint/FingerprintService;->access$600(Lcom/android/server/fingerprint/FingerprintService;)I

    move-result v4

    invoke-virtual {p0, v3, v1, v4}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->remove(Landroid/os/IBinder;II)V

    .line 626
    iget-object v3, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v3, v1}, Lcom/android/server/fingerprint/FingerprintService;->nativeRemove(I)I

    move-result v2

    .line 627
    .local v2, "result":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Removed with result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 628
    .end local v1    # "index":I
    .end local v2    # "result":I
    :catch_0
    move-exception v0

    .line 629
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p2, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is an invalid number"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private dumpSetFingerprintName(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    const/16 v6, 0x22

    const/4 v5, 0x1

    .line 606
    const/4 v3, 0x1

    :try_start_0
    aget-object v3, p2, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 607
    .local v1, "index":I
    const/4 v3, 0x2

    aget-object v2, p2, v3

    .line 608
    .local v2, "name":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting name to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " on index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 609
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->getCurrentUserId()I
    invoke-static {v4}, Lcom/android/server/fingerprint/FingerprintService;->access$600(Lcom/android/server/fingerprint/FingerprintService;)I

    move-result v4

    invoke-virtual {p0, v3, v1, v2, v4}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->setFingerprintName(Landroid/os/IBinder;ILjava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 615
    .end local v1    # "index":I
    .end local v2    # "name":Ljava/lang/String;
    :goto_0
    return-void

    .line 610
    :catch_0
    move-exception v0

    .line 611
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p2, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is an invalid number"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 612
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v0

    .line 613
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public authenticate(Landroid/os/IBinder;I)V
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "userId"    # I

    .prologue
    .line 506
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 507
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 508
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/fingerprint/FingerprintService;->startAuthentication(Landroid/os/IBinder;I)V

    .line 509
    return-void
.end method

.method public cancel(Landroid/os/IBinder;I)V
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "userId"    # I

    .prologue
    .line 520
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 521
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 522
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/fingerprint/FingerprintService;->startCancel(Landroid/os/IBinder;I)V

    .line 523
    return-void
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 6
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 583
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # getter for: Lcom/android/server/fingerprint/FingerprintService;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$400(Lcom/android/server/fingerprint/FingerprintService;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.DUMP"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 585
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Permission Denial: can\'t dump telephony.registry from from pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 602
    :goto_0
    return-void

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # getter for: Lcom/android/server/fingerprint/FingerprintService;->mHal:J
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$500(Lcom/android/server/fingerprint/FingerprintService;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 590
    const-string v0, "Fingerprint sensor not available"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 591
    :cond_1
    array-length v0, p3

    if-eqz v0, :cond_2

    const-string v0, "printEnrollments"

    aget-object v1, p3, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 592
    invoke-direct {p0, p2, p3}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->dumpEnrollments(Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_0

    .line 593
    :cond_2
    array-length v0, p3

    const/4 v1, 0x3

    if-lt v0, v1, :cond_3

    const-string v0, "setFingerName"

    aget-object v1, p3, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 594
    invoke-direct {p0, p2, p3}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->dumpSetFingerprintName(Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_0

    .line 595
    :cond_3
    array-length v0, p3

    if-le v0, v5, :cond_4

    const-string v0, "removeFinger"

    aget-object v1, p3, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 596
    invoke-direct {p0, p2, p3}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->dumpRemoveFinger(Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_0

    .line 597
    :cond_4
    array-length v0, p3

    if-lt v0, v5, :cond_5

    const-string v0, "getNumEnrollmentSteps"

    aget-object v1, p3, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 598
    invoke-direct {p0, p2, p3}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->dumpGetNumEnrollmentSteps(Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_0

    .line 600
    :cond_5
    invoke-direct {p0, p2}, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->dumpCommandList(Ljava/io/PrintWriter;)V

    goto :goto_0
.end method

.method public enroll(Landroid/os/IBinder;JI)V
    .locals 2
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "timeout"    # J
    .param p4, "userId"    # I

    .prologue
    .line 513
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 514
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 515
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/server/fingerprint/FingerprintService;->startEnroll(Landroid/os/IBinder;JI)V

    .line 516
    return-void
.end method

.method public getEnrolledFingerprints(Landroid/os/IBinder;I)Ljava/util/List;
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            "I)",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/fingerprint/Fingerprint;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 550
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 551
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 552
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/fingerprint/FingerprintService;->getEnrolledFingerprints(Landroid/os/IBinder;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getNumEnrollmentSteps(Landroid/os/IBinder;)I
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 566
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 567
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 568
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->getNumEnrollmentSteps()I

    move-result v0

    return v0
.end method

.method public getState()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 573
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 574
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 575
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->getState()I

    move-result v0

    return v0
.end method

.method public remove(Landroid/os/IBinder;II)V
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "fingerprintId"    # I
    .param p3, "userId"    # I

    .prologue
    .line 527
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 528
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 529
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/fingerprint/FingerprintService;->startRemove(Landroid/os/IBinder;II)V

    .line 530
    return-void
.end method

.method public setFingerprintName(Landroid/os/IBinder;ILjava/lang/String;I)Z
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "fingerprintId"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "userId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 558
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 559
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 560
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/server/fingerprint/FingerprintService;->setFingerprintName(Landroid/os/IBinder;ILjava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public startListening(Landroid/os/IBinder;Landroid/service/fingerprint/IFingerprintServiceReceiver;I)V
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "receiver"    # Landroid/service/fingerprint/IFingerprintServiceReceiver;
    .param p3, "userId"    # I

    .prologue
    .line 535
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 536
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 537
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/fingerprint/FingerprintService;->addListener(Landroid/os/IBinder;Landroid/service/fingerprint/IFingerprintServiceReceiver;I)V

    .line 538
    return-void
.end method

.method public stopListening(Landroid/os/IBinder;I)V
    .locals 1
    .param p1, "token"    # Landroid/os/IBinder;
    .param p2, "userId"    # I

    .prologue
    .line 542
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0}, Lcom/android/server/fingerprint/FingerprintService;->checkPermission()V

    .line 543
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    # invokes: Lcom/android/server/fingerprint/FingerprintService;->throwIfNoFingerprint()V
    invoke-static {v0}, Lcom/android/server/fingerprint/FingerprintService;->access$300(Lcom/android/server/fingerprint/FingerprintService;)V

    .line 544
    iget-object v0, p0, Lcom/android/server/fingerprint/FingerprintService$FingerprintServiceWrapper;->this$0:Lcom/android/server/fingerprint/FingerprintService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/fingerprint/FingerprintService;->removeListener(Landroid/os/IBinder;I)V

    .line 545
    return-void
.end method
