abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppLoadingState extends AppStates{}
class AppSuccessState extends AppStates{}
class AppErrorState extends AppStates{}
//============================================
class ScreenLoadingState extends AppStates{}

class Screen1SuccessState extends AppStates{}
class Screen2SuccessState extends AppStates{}
class Screen3SuccessState extends AppStates{}

//============================================

class UpdateTabSelectionState extends AppStates{}
class ConvertHadithState extends AppStates{}
class ConvertHadithLoadingState extends AppStates{}
//============================================

class CreateDatabaseState extends AppStates{}
class InsertDatabaseState extends AppStates{}

class GetDatabasLoadingeState extends AppStates{}
class GetDatabaseState extends AppStates{}

class UpdateDatabaseState extends AppStates{}

class DeleteDatabaseState extends AppStates{}

class toggleState extends AppStates{}


