export class BaseModel{
  constructor(payload) {
    this.payload = payload
    this.attributes = payload.attributes
  }

  get id() {
    return this.payload.id;
  }

  get type() {
    return this.payload.type;
  }
}