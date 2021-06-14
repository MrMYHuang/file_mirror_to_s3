import AWS from 'aws-sdk';
import axios from 'axios';
import params from './params.json';

const s3bucket = new AWS.S3({
  accessKeyId: params.IAM_USER_KEY,
  secretAccessKey: params.IAM_USER_SECRET
});

async function uploadObjectToS3Bucket(objectName: string, objectData: any) {
  return new Promise<void>((ok, fail) => {
    const s3params: AWS.S3.PutObjectRequest = {
      Bucket: params.BUCKET_NAME,
      Key: objectName,
      Body: objectData,
      ACL: 'public-read'
    };
    s3bucket.upload(s3params, function (err: Error, data: { Location: any; }) {
      if (err) {
        fail(err);
        return;
      }

      ok();
    });
  });
}

async function downloadSource() {
  const res = await axios.get(params.SOURCE_URL, { responseType: 'arraybuffer' });
  if (res.status == 200) {
    return res.data;
  } else {
    throw `Download source error: ${res.statusText}`;
  }
}

export async function fileMirroringToS3() {
  try {
    const data = await downloadSource();
    await uploadObjectToS3Bucket(params.S3_OBJECT_NAME, data);
    console.log(`File mirroring success!`);
  } catch (err) {
    console.error(`File mirroring failed: ` + err);
  }
}
