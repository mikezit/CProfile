import sqlite3

class PathForName:
    """interface for sqlite3 database of name of dir"""

    def __init__(self):
        self.dbcon = sqlite3.connect("sqlite3/localset")
        self.dbcur = self.dbcon.cursor()

    def createDB(self):
        self.dbcur.execute("""create table namepath(name text,dir text)""")

    def addNamePathPair(self,name,path):
        print("1")
        t = (name,path)
        self.dbcur.execute("select * from namepath where name = ?",t[0:1])
        if self.dbcur.rowcount > 1 :
            print("""\
The name  you inputed has exist please choise another name """)
        else:
            print("2")
            self.dbcur.execute("insert into namepath values(?,?)",t)
            self.dbcon.commit()
            print("3")

    def getPath(self,name):
        t = (name,)
        self.dbcur.execute("select * from namepath where name = ?",t)
        if self.dbcur.rowcount != 1:
            #print("Error ! There is {0} count result".format(self.dbcur.rowcount))
            pass
        return self.dbcur.fetchone()[1]
    
    def getAllPathNamePair(self):
        self.dbcur.execute("select * from namepath")
        listpair = self.dbcur.fetchall()
        for (name,path) in listpair:
            print( "{0} {1}".format(name,path))

if __name__ == "__main__" :
    pfn = PathForName()
    print("""exec [pfn.addNamePathPair("test","test")] """)
    pfn.addNamePathPair("test","test")
    print("exec getPath test : {0}".format(pfn.getPath("test")) )
    print("exec getAllPathNamePair:{0}".format(pfn.getAllPathNamePair()))
