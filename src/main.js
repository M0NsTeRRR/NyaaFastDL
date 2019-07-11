import Vue from "vue";
import { 
  Layout,
  Row,
  Col,
  Affix,
  Form,
  Input,
  Select,
  TreeSelect,
  Switch,
  Cascader,
  Button,
  Progress,
  Alert,
  Icon,
  message
} from "ant-design-vue";
import "ant-design-vue/dist/antd.less";
import App from "./App";

Vue.prototype.$message = message;

Vue.use(Layout);
Vue.use(Row);
Vue.use(Col);
Vue.use(Affix);
Vue.use(Form);
Vue.use(Input);
Vue.use(Select);
Vue.use(TreeSelect);
Vue.use(Switch);
Vue.use(Cascader);
Vue.use(Button);
Vue.use(Progress);
Vue.use(Alert);
Vue.use(Icon);
Vue.use(message);

Vue.config.productionTip = false;

new Vue({
  render: (h) => h(App),
}).$mount("#app");
