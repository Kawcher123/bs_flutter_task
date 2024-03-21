abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DuplicateRowDatabaseFailure extends Failure {}

class GeneralFailure extends Failure {}