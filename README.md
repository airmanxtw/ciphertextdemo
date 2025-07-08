# 登入驗證加密範例
## 上線所需金鑰由計網中心提供

### 驗證流程
1. 使用者輸入帳號及密碼後,並產生一個有效時間,建議現在時間加30秒,格式為yyyyMMddHHmm,產生一個物件 {userid:string,password:string,exp:string}
2. 範例,帳號是user01,密碼是12345,有效時間202507081315,將其三欄位包裝成物件 {'userid':'user01','password':'123455','exp':'202507081315'},在這裡將此物件稱之為R
3. 將此物件R序列化為json字串,在這裡將json字串稱為S
4. 將字串S使用RSA加密,此加密字串稱為A
5. 將加密字串A包裝成物件 {'ciphertext':'AZQE6U/SOqjQMDEKDA3aM.....'},這裡物件稱之為P
6. 將物件P,使用SignIn的WEBAPI POST
7. 驗證成功的話,會回傳一個jwt字串
8. jwt字串會由.號分隔為三段,請取出中間那一段做base64 decode
9. 可以得到像這樣的格式:  
  {"userName":"王大頭","studNo":"學號","className":"六年一班","email":"學號@gmail.com","http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name":"學號","http://schemas.microsoft.com/ws/2008/06/identity/claims/role":"STUD","nbf":1751953767,"exp":1759902567,"iss":"STUST","aud":"STUST"}
10. 其中 http://schemas.microsoft.com/ws/2008/06/identity/claims/role 段會有角色的資訊,學生為STUD,教職員為EMP,如果有校安人力的身分將會是一個陣列['EMP','SECURITY']

