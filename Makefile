install:
	pip install . --upgrade

uninstall:
	pip uninstall pyModeS -y

ext:
	python setup.py build_ext --inplace

test:
	make clean
	@echo ""
	@echo "[Test with py_common]"
	python -m pytest tests
	@echo ""
	@echo "[Test with c_common]"
	python setup.py build_ext --inplace
	python -m pytest tests

clean:
	find pyModeS -type f -name '*.c' -delete
	find pyModeS -type f -name '*.so' -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo$$)" | xargs rm -rf
	rm -rf *.egg-info
	rm -rf .pytest_cache
	rm -rf build/*
