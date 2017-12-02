# Build
```bash
docker build -t deep-cv -f Dockerfile .
```

# Run 

**Ipython**
```bash
docker run -it -v $(pwd):/project deep-ml bash
```

**Ipython**
```bash
docker run -it -v $(pwd):/project deep-ml ipython
```

**Jupyter notebook**
```bash
docker run -d -v $(pwd):/project -p 8888:8888 -p 6006:6006 deep-cv
```