import {BaseModel} from "~/lib/data/base-model";

export class Post extends BaseModel {

  get title(){
    return this.attributes.title;
  }
}