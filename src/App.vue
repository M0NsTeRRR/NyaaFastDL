<template>
  <a-layout style="background: #fff">
    <a-layout-header class="header" style="background: #008080; color: white">
      NyaaFastDL
    </a-layout-header>
    <br>
    <a-layout-content>
      <a-form layout="inline" style="text-align: center">
        <div>
          <a-row>
            <a-col :span="24">
              <a-form-item label="Search">
                <a-input v-model="search" @change="getQuery" placeholder="Code geass <3" style="width: 300px"/>
              </a-form-item>
            </a-col>
          </a-row>
          <br>
          <a-row>
            <a-col :span="24">
              <a-form-item label="Video quality">
                <a-select
                  v-model="videoQualitySelected"
                  @change="getQuery"
                  showSearch
                  optionFilterProp="children"
                  style="width: 200px"
                  allowClear
                >
                  <a-select-option 
                    v-for="(quality, index) in videoQualityList"
                    :key="index"
                    :value="quality"
                  >
                    {{ quality }}
                  </a-select-option>
                </a-select>
              </a-form-item>
              <a-form-item label="Language">
                <a-select
                  v-model="languageSelected"
                  @change="getQuery"
                  showSearch
                  optionFilterProp="children"
                  style="width: 200px"
                  allowClear  
                >
                  <a-select-option 
                    v-for="(language, index) in languageList"
                    :key="index"
                    :value="language"
                  >
                    {{ language }}
                  </a-select-option>
                </a-select>
              </a-form-item>
            </a-col>
          </a-row>
          <br>
          <a-row>
            <a-col :span="24">
              <a-form-item label="Filter">
                <a-select
                  v-model="filterSelected"
                  showSearch
                  optionFilterProp="children"
                  style="width: 200px"
                >
                  <a-select-option 
                    v-for="(filter, index) in filterList"
                    :key="index"
                    :value="index"
                  >
                    {{ filter }}
                  </a-select-option>
                </a-select>
              </a-form-item>
              <a-form-item label="Category">
                <a-tree-select
                  v-model="categorySelected"
                  showSearch
                  style="width: 200px"
                  :value="categorySelected"
                  :dropdownStyle="{ maxHeight: '400px', overflow: 'auto' }"
                  treeDefaultExpandAll
                >
                  <a-tree-select-node 
                    v-for="(category, index) in categoryList"
                    :title="category.name"
                    :value='index + "_0"'
                    :key='index + "_0"'
                  >
                    <a-tree-select-node 
                      v-for="(subcategory, subindex) in category.subCategory"
                      :title="subcategory"
                      :value='index + "_" + (subindex + 1)'
                      :key='index + "_" + (subindex + 1)'
                    >
                    </a-tree-select-node>
                  </a-tree-select-node>
                </a-tree-select>
              </a-form-item>
            </a-col>
          </a-row>
          <br>
          <a-row>
            <a-col :span="24">
              <a-form-item label="Sort">
                <a-cascader v-model="sortSelected" style="width: 260px; text-align: left" :options="sortList"/>
              </a-form-item>
            </a-col>
          </a-row>
          <br>
          <a-row>
            <a-col :span="24">
              <a-form-item>
                Edit &nbsp;<a-switch @change='onEditQuery'/>
              </a-form-item>
              <a-form-item>
                <a-input v-model="query" style="width: 300px" :disabled="editQuery"/>
              </a-form-item>
            </a-col>
          </a-row>
          <br>
          <a-row>
            <a-col :span="24">
              <a-form-item>
                <a-button v-if="download" type="primary" icon="download" @click="validate">
                  Download
                </a-button>
                <div v-if="progressDownload">
                  <a-alert
                    message="Informational Notes"
                    :description="downloadDescription"
                    type="info"
                    showIcon
                  />
                  <br>
                  <a-progress type="circle" :percent="progressDownloadPercent"/>
                </div>
              </a-form-item>
            </a-col>
          </a-row>
        </div>
      </a-form>
    </a-layout-content>
    <br><br><br><br><br><br>
    <a-affix :offsetBottom="this.affixFooter">
      <a-layout-footer style="background: #008080; text-align: center; color: white; position: fixed; width: 100%; bottom: 0">
        NyaaFastDL is published under license <strong>CeCILL v2.1</strong> &nbsp;<a href="https://github.com/M0NsTeRRR/NyaaFastDL" target="_blank" style="color: white"><a-icon type="github"/></a><br>
        Copyright © <strong>Ludovic Ortega</strong> 2019<br>
        by Ludovic « -MoNsTeRRR » Ortega &nbsp;<a href="https://twitter.com/MoNsTeRRR_CSGO/" target="_blank" style="color: white"><a-icon type="twitter"/></a>
      </a-layout-footer>
    </a-affix>
  </a-layout>
</template>

<script>
  export default {
    name: "Search",
    data: () => ({
      search: '',
      videoQualitySelected: '1080p',
      languageSelected: 'VOSTFR',
      filterSelected: '0',
      categorySelected: '0_0',
      sortSelected: undefined,
      query: '',
      editQuery: true,
      download: true,
      progressDownload: false,
      downloadDescription: '',
      progressDownloadPercent: 0,
      videoQualityList: {
        "1080p": "1080p",
        "720p": "720p",
        "480p": "480p",
      },
      languageList: {
        "RAW": "RAW",
        "VOST": "VOST",
        "VOSTFR": "VOSTFR",
        "VOSTEN": "VOSTEN"
      },
      filterList: {
        "0": "No filter",
        "1": "No remakes",
        "2": "Trusted only",
      },
      categoryList: [
        { 
          name: "All categories", 
          subCategory: []
        },
        { 
          name: "Anime", 
          subCategory: [
            "Anime Music Video",
            "English-translated",
            "Non-English-translated",
            "RAW",
          ]
        },
        { 
          name: "Audio", 
          subCategory: [
            "Lossless",
            "Lossy",
          ],
        },
        { 
          name: "Literature", 
          subCategory: [
            "English-translated",
            "Non-English-translated",
            "RAW",
          ],
        },
        { 
          name: "Live action", 
          subCategory: [
            "English-translated",
            "Idole/promotional Video",
            "Non-English-translated",
            "RAW"
          ]
        },
        { 
          name: "Pictures", 
          subCategory: [
            "Graphics",
            "Photos",
          ],
        },
        { 
          name: "Software", 
          subCategory: [
            "Applications",
            "Games",
          ]
        }
      ],
      
      sortList: [{
        value: 'size',
        label: 'Size',
        children: [{
          value: 'asc',
          label: 'Ascending',
        },
        {
          value: 'desc',
          label: 'Descending',
        }],
      }, 
      {
        value: 'id',
        label: 'Date',
        children: [{
          value: 'asc',
          label: 'Ascending',
        },
        {
          value: 'desc',
          label: 'Descending',
        }],
      },
      {
        value: 'seeders',
        label: 'Seeders',
        children: [{
          value: 'asc',
          label: 'Ascending',
        },
        {
          value: 'desc',
          label: 'Descending',
        }],
      },
      {
        value: 'leechers',
        label: 'Leechers',
        children: [{
          value: 'asc',
          label: 'Ascending',
        },
        {
          value: 'desc',
          label: 'Descending',
        }],
      },
      {
        value: 'downloads',
        label: 'Completed downloads',
        children: [{
          value: 'asc',
          label: 'Ascending',
        },
        {
          value: 'desc',
          label: 'Descending',
        }],
      }],
      affixFooter: 0
    }),
    mounted(){
      this.getQuery();
    },
    methods: {
      onEditQuery(){
        this.editQuery = !this.editQuery;
      },
      getQuery(){
        const quality = this.videoQualitySelected ? this.videoQualitySelected : ""
        const language = this.languageSelected ? this.languageSelected : ""
        this.query = this.search + (this.search.length > 0 ? " " : "") + quality + (quality.length > 0 ? " " : "") + language;
      },
      validate(){
        if(this.query.length > 0)
        {
          this.download = false;
          this.progressDownload = true;
          this.progressDownloadPercent = 20;
          this.downloadDescription = 'Asking for torrent to Nyaa.si';

          this.getSearch();
        }
        else
        {
          this.error("Query is empty");
          this.download = true;
          this.progressDownload = false;
        }
      },
      async getSearch(){
        const axios = require('axios');
        const baseURLNyaa = 'https://nyaa.si';

        try {
          const order = this.sortSelected === undefined ? "" : "&s=" + this.sortSelected[0] + "&o=" + this.sortSelected[1];
          const response = await axios.get('https://cors-anywhere.herokuapp.com/' + baseURLNyaa + '/?f=' + this.filterSelected + "&c=" + this.categorySelected + "&q=" + this.query + order);
          
          this.progressDownloadPercent = 40;
          this.downloadDescription = 'Received torrents list. Parsing torrents ...';

          const parser = new DOMParser();
          const doc = parser.parseFromString(response.data, "text/html");

          const torrents = doc.querySelectorAll('body > div > div.table-responsive > table > tbody > tr');

          //check if >1 torrent
          if(torrents.length === 0)
          {
            this.download = true;
            this.progressDownload = false;
            this.error("No torrent found");
            return
          }
          else
          {
            this.progressDownloadPercent = 60;
            this.downloadDescription = torrents.length > 1 ? torrents.length + ' torrents found' : torrents.length + ' torrent found';
          }

          //check if torrent has comment
          let torrentName = '';
          if(torrents[0].querySelectorAll('td:nth-child(2) > a')[0].classList.contains("comments"))
          {
            torrentName = torrents[0].querySelectorAll('td:nth-child(2) > a:nth-child(2)')[0].getAttribute("title") + '.torrent';
          }
          else
          {
            torrentName = torrents[0].querySelectorAll('td:nth-child(2) > a:nth-child(1)')[0].getAttribute("title") + '.torrent';
          }

          this.progressDownloadPercent = 80;
          this.downloadDescription = 'Downloading torrent : ' + torrentName;

          const torrentBlob = await axios.get('https://cors-anywhere.herokuapp.com/' + baseURLNyaa + torrents[0].querySelectorAll('td:nth-child(3) > a:nth-child(1)')[0].getAttribute("href"), { responseType: 'blob' });

          const url = window.URL.createObjectURL(new Blob([torrentBlob.data], {type: 'application/x-bittorrent'}));
          const link = document.createElement('a');
          link.href = url;
          link.download = torrentName;
          link.click();

          this.progressDownloadPercent = 100;
          this.downloadDescription = 'Torrent downloaded';
          this.success("Torrent downloaded")
          
          this.download = true;
          this.progressDownload = false;
        }
        catch (e) {
          this.error("Something wrong happened" + e.message);

          this.download = true;
          this.progressDownload = false;
        }
      },
      success(message){
        this.$message.success(message);
      },
      error(message){
        this.$message.error(message);
      }
    }
  }
</script>