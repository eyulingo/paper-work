
package io.github.eyulingo.Controller.General;

import com.mongodb.MongoClient
import com.mongodb.MongoClientURI

import com.mongodb.client.gridfs.GridFSBuckets
import com.mongodb.client.gridfs.model.GridFSUploadOptions
import com.mongodb.gridfs.GridFS
import io.github.eyulingo.MongoDB.ImageManager
import org.bson.Document
import org.bson.types.ObjectId
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile
import java.util.*
import javax.servlet.http.HttpServletResponse
import kotlin.collections.HashMap


@Controller
@RequestMapping("/img")
class UploadFileController {

    @Autowired
    lateinit var gridFS: GridFS

    var mongoDBUri = ImageManager.getMongoDBUri()

    var mongoClient = MongoClient(MongoClientURI(mongoDBUri))

    var myDatabase = mongoClient.getDatabase("eyulingo_imgs")

    var gridFSBucket = GridFSBuckets.create(myDatabase)

    /**
     * 上传文件
     *
     * @param file 文件
     * @return 文件名和文件存储的fileId键值对的Map
     */
    @RequestMapping(value = ["/upload"], method = [RequestMethod.POST], produces = ["application/json;charset=UTF-8"])
    @ResponseBody
    fun upload(@RequestParam(value = "file") file: MultipartFile): String
    {
        val map = HashMap<String, ObjectId>()
        try {
            val streamToUploadFrom = file.inputStream

            val document = Document()
            //自定义数据，放入文件真正名和文件类型
            document.append("fileTrueName", file.originalFilename)
            document.append("contentType", file.contentType)
            //设置chunks长度为358400字节，如果文件过大则创建新的分块
            // 自定义的数据放在metadata里
            val options = GridFSUploadOptions()
                    .chunkSizeBytes(358400)
                    .metadata(document)

            val fileId = gridFSBucket.uploadFromStream(UUID.randomUUID().toString(), streamToUploadFrom, options)
            System.out.println("上传成功，" + "文件名:" + file.originalFilename + "文件ID:" + fileId)
            map[file.originalFilename!!] = fileId
            return "{\"status\": \"ok\", \"origin_name\": \"" + file.originalFilename!! + "\", \"file_id\": \"" + fileId.toString() + "\"}"
        } catch (e: Exception) {
            e.printStackTrace()
            return "{\"status\": \"internal_error\"}"
        }
    }

    @RequestMapping(value = ["/download"])
    fun downLoadByFileId(@RequestParam(value = "fileId") fileId: ObjectId, response: HttpServletResponse) {

        val gridFSDBFile = this.gridFS.findOne(fileId)

        try {
            //获取回复的输出流
            val sos = response.outputStream
            //设置编码格式
            response.characterEncoding = "UTF-8"
            response.setHeader("Access-Control-Allow-Origin", "*")
            //设置文件返回类型，为上传文件时获取的文件类型
            response.contentType = gridFSDBFile!!.metaData.get("contentType").toString()
            response.addHeader("Content-Disposition", "attachment; filename=\"" + gridFSDBFile.metaData.get("fileTrueName") + "\"")
            //将查询到的数据放入到输出流sos中
            gridFSDBFile.writeTo(sos)
            sos.flush()
            sos.close()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}