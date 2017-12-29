# ios--Data
关于iOS数据存储的应用
1.Keychain使用步骤
/*

 Keychain使用步骤
 1.导入Security.framework
 2.导入#import "KeychainItemWrapper.h"，由于这个类文件是用MRC，需在编译时禁用ARC
 2. 1，选择项目中的Targets，选中你所要操作的Target，
 2. 2，选Build Phases，在其中Complie Sources中选择需要ARC的文件双击，
     并在输入框中输入：-fobjc-arc，如果不要ARC则输入：-fno-objc-arc
 3.创建KeychainItemWrapper对象，操作方法类似NSDictionary

 */

    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 1
         [keychain setObject:username forKey:(__bridge id)(kSecAttrAccount)];// 2
         [keychain setObject:password forKey:(__bridge id)(kSecValueData)];// 3

 KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 通过同样的标志创建keychain
    // 获取对应Key里保存的用户名和密码
    NSString *username = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *password = [keychain objectForKey:(__bridge id)(kSecValueData)];
        

2.数据库操作步骤
/*
 1.导入框架libsqlite3.tbd包，导入头文件#import <sqlite3.h>
 2.生成沙盒路径
 3.创建打开数据库
 4.创建表
 5.关于数据库的增删改查
 6.结束(关闭数据库)
 */
-(NSString *) databasePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathname = [path objectAtIndex:0];
    return [pathname stringByAppendingPathComponent:@"database.sqlite3"];
}

-(BOOL) opendatabase
{
    if (sqlite3_open([[self databasePath] UTF8String], &database) != SQLITE_OK) { //根据指定目录打开数据库文件，如果没有就创建一个新的
        sqlite3_close(database);
        printf("failed to open the database.\n");
        return NO;
    }
    else {
        printf("open the database successfully.\n");
        return YES;
    }
}

-(BOOL) createStudentTable
{
    if ([self opendatabase] == YES) {
        char *erroMsg;
        NSString *TableName = @"StudentTable";
        NSString *createSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(userid INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, math INTEGER, iconurl BLOB, virbrate INTEGER, status INTEGER, message TEXT)", TableName];//创建一个表    AUTOINCREMENT 这里userid的值是创建表是自动生成的，从1开始依次自增
        
        if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &erroMsg) != SQLITE_OK) {
            sqlite3_close(database);
            printf("create table failed.\n");
            return NO;
        }
        else {
            printf("table was created.\n");
            return YES;
        }
    }
    else
        return NO;
}

-(void) ErrorReport:(NSString *)item
{
    char *errorMsg;
    if (sqlite3_exec(database, [item UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK) {
        NSLog(@"%@ ok\n", item);
    }
    else {
        printf("error: %s", errorMsg);
        sqlite3_free(errorMsg);
    }
}

-(void) insertTable
{
    char *errorMsg;
    
    NSString *insertSql = @"insert into StudentTable (name) values ('Mr_Guo')"; //插入语句
    
    if (sqlite3_exec(database, [insertSql UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK) {
        printf("insert ok.\n");
    }
    else {
        printf("can't insert it to table\n");
        [self ErrorReport:insertSql];
    }
}

//查询数据库
-(void) inquire
{
    //char *errMsg;
    NSString *inquireSQL = @"select userid, name from StudentTable";
    sqlite3_stmt *statement;
    /*
     [注：]
     sqlite3_prepare_v2把一条SQL语句（这里是inquireSQL）解析到sqlite3_stmt结构中
     试了一下这里使用sqlite3_prepare的结果是完全一样的
     [最后面有这两个函数的实现]
     */
    if (sqlite3_prepare_v2(database, [inquireSQL UTF8String], -1, &statement, nil) == SQLITE_OK) {
        printf("select ok.\n");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int _id = sqlite3_column_int(statement, 0); //这里的0是userid在sql语句中的索引，因为我们要查询的内容有userid和name，所以userid的索引为0，name的索引为1
            NSString *_time = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
            printf("userid = %d, _time = %s.\n",_id, [_time UTF8String]);
        }
    }
    else {
        [self ErrorReport:inquireSQL];
    }
    sqlite3_finalize(statement);
}

-(void) deleteTable
{
    char *errMsg;
    //[self opendatabase];
    
    NSString *deleteSQL = @"delete from StudentTable where userid=4"; //删除userid为4的表
    if (sqlite3_exec(database, [deleteSQL UTF8String], NULL, NULL, &errMsg) == SQLITE_OK) {
        printf("delete ok.\n");
    }
    else {
        printf("can't delete it\n");
        [self ErrorReport:deleteSQL];
    }
}

3.归档使用步骤
/*
 归档对象时
 1.创建归档对象，实现归档的协议方法NSCoding
 2.归档操作
 2.1 拿到沙盒路径
 2.2 给对象赋值
 2.3 转化为NSDdata
 NSData * data1 = [NSKeyedArchiver archivedDataWithRootObject:dataArray];
 2.4 归档操作
 [data1 writeToFile:filePath atomically:YES];

 3.解码
解码操作同上
 
 2.1 拿到沙盒路径
 2.2 解码
 NSData * data = [NSData dataWithContentsOfFile:filePath];
 NSMutableArray *tmpArray = [NSKeyedUnarchiver  unarchiveObjectWithData:data];
 */
